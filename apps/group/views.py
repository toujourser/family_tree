from django.shortcuts import render, HttpResponse, redirect, HttpResponseRedirect
from django.views import View
from apps.user.models import Members
from apps.group.models import Groups
from django.utils.decorators import method_decorator
from django.contrib.auth.decorators import login_required
from django.core.paginator import Paginator
from django.db.models import Q
from apps.user.views import Menu
import json


class GroupList(View):
    def get(self, request):
        menu_list = Menu.get_menu(request)
        if not request.user.has_perm('user.view_groups'):
            return render(request, 'fail.html', {'msg': '该用户没有操作权限...'})
        page = request.GET.get('page', 1)
        page_size = request.GET.get('page_size', 5)

        user = request.user

        if request.user.is_superuser:
            group_list = Groups.objects.all()
        else:
            group_list = Groups.objects.filter(id=user.group_id).all()

        # 创建分页对象
        paginator = Paginator(group_list, page_size)
        # 根据当前页码,确定返回的数据
        current_page = paginator.page(page)
        # 保证前端取到的'页数'为整型
        page_id = int(page)
        # 总数
        count = paginator.count

        return render(request, 'group_list.html', locals())

    def delete(self, request):
        if not request.user.has_perm('user.delete_groups'):
            return render(request, 'fail.html', {'msg': '该用户没有操作权限...'})
        param = json.loads(request.body)
        group_id = param['id']
        print(group_id)
        Groups.objects.filter(id=group_id).delete()
        return HttpResponse({'code': 200, 'status': 'successfull'})


class GroupAdd(View):
    def get(self, request):
        menu_list = Menu.get_menu(request)
        if not request.user.has_perm('user.add_groups'):
            return render(request, 'fail.html', {'msg': '该用户没有操作权限...'})
        user = request.user
        return render(request, 'group_add.html', locals())

    def post(self, request):
        if not request.user.has_perm('user.add_groups'):
            return render(request, 'fail.html', {'msg': '该用户没有操作权限...'})
        name = request.POST.get('name')
        if len(name) == 0:
            return render(request, 'fail.html', {'msg': '族谱名不能为空...'})
        remark = request.POST.get('introduction')

        g = Groups.objects.filter(name__icontains=name).first()
        if g:
            return render(request, 'fail.html', {'msg': '家谱名称已存在...'})
        Groups(name=name, remark=remark, created_by=request.user.username).save()
        return redirect('/group_list/')


class GroupEdit(View):
    @method_decorator(login_required(login_url='/login/'))
    def get(self, request):
        menu_list = Menu.get_menu(request)
        if not request.user.has_perm('user.change_groups'):
            return render(request, 'fail.html', {'msg': '该用户没有操作权限...'})
        group_id = request.GET.get('id')
        print(group_id)
        group = Groups.objects.get(id=group_id)
        group_list = Groups.objects.all()
        member_list = Members.objects.all()
        user = request.user
        return render(request, 'group_edit.html', locals())

    @method_decorator(login_required(login_url='/login/'))
    def post(self, request):
        if not request.user.has_perm('user.change_groups'):
            return render(request, 'fail.html', {'msg': '该用户没有操作权限...'})
        id = request.POST.get('id')
        group = Groups.objects.filter(id=id).first()
        if not group:
            return render(request, 'fail.html', {'msg': '族谱不存在...'})
        name = request.POST.get('name')
        if name == '':
            return render(request, 'fail.html', {'msg': '家谱名称不可为空...'})

        if Groups.objects.filter(name__icontains=name).exclude(id=id).first():
            return render(request, 'fail.html', {'msg': '家谱名称已存在...'})
        group.name = name
        group.remark = request.POST.get('introduction')
        group.updated_by = request.user.username
        group.save()
        return redirect('/group_list/')
