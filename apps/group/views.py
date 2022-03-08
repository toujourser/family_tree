from django.shortcuts import render, HttpResponse, redirect, HttpResponseRedirect
from django.views import View
from apps.user.models import Members
from apps.group.models import Groups
from django.contrib.auth import authenticate, login, logout
from django.utils.decorators import method_decorator
from django.contrib.auth import authenticate
from django.contrib.auth.decorators import login_required
from django.core.paginator import Paginator
from django.http import QueryDict
import json


class GroupList(View):
    def get(self, request):
        page = request.GET.get('page', 1)
        page_size = request.GET.get('page_size', 5)

        group_list = Groups.objects.all()
        username = request.user.username

        # 创建分页对象
        paginator = Paginator(group_list, page_size)
        # 根据当前页码,确定返回的数据
        current_page = paginator.page(page)
        # 保证前端取到的"页数"为整型
        page_id = int(page)
        # 总数
        count = paginator.count

        return render(request, 'group_list.html', locals())

    def delete(self, request):
        param = json.loads(request.body)
        group_id = param['id']
        print(group_id)
        Groups.objects.filter(id=group_id).delete()
        return HttpResponse({'code': 200, 'status': 'successfull'})


class GroupAdd(View):
    def get(self, request):
        username = request.user.username
        return render(request, 'group_add.html', locals())

    def post(self, request):
        name = request.POST.get('name')
        if len(name) == 0:
            return HttpResponse({'code': 400, 'msg': '族谱名不能为空'})
        remark = request.POST.get('introduction')

        g = Groups.objects.filter(name__icontains=name).first()
        if g:
            return HttpResponse({'code': 400, 'msg': '族谱名已存在'})
        Groups(name=name, remark=remark, created_by=request.user.username).save()
        return redirect('/group_list/')


class GroupEdit(View):
    @method_decorator(login_required(login_url='/login/'))
    def get(self, request):
        group_id = request.GET.get('id')
        print(group_id)
        group = Groups.objects.get(id=group_id)
        group_list = Groups.objects.all()
        member_list = Members.objects.all()
        username = request.user.username
        return render(request, 'group_edit.html', locals())

    @method_decorator(login_required(login_url='/login/'))
    def post(self, request):
        id = request.POST.get('id')
        group = Groups.objects.filter(id=id).first()
        if not group:
            return HttpResponse({'code': 400, 'msg': '家谱节点不存在'})
        name = request.POST.get('name')
        if name == '':
            return HttpResponse({'code': 400, 'msg': '家谱名称不可为空'})
        group.name = name
        group.remark = request.POST.get('introduction')
        group.updated_by = request.user.username
        group.save()
        return redirect('/group_list/')
