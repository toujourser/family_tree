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


class Login(View):
    def get(self, request):
        return render(request, 'login.html')

    def post(self, request):
        username = request.POST.get('username')
        password = request.POST.get('password')
        # 验证用户密码
        user = authenticate(username=username, password=password)
        if user:
            login(request, user)
            return redirect('/index/')
        else:
            return render(request, 'login.html')


class Index(View):
    @method_decorator(login_required(login_url='/login/'))
    def get(self, request):
        group_id = request.GET.get('id', 1)
        data = self.get_tree(group_id)
        group = Groups.objects.filter(id=group_id).first()
        group_list = Groups.objects.all()
        return render(request, 'index.html',
                      {'username': request.user.username, 'group_list': group_list, 'data': json.dumps(data),
                       'group_': group})

    def get_tree(self, group_id):
        member_list = Members.objects.filter(group_id=group_id).all()
        root = dict()
        for member in member_list:
            if not member.parent_id:
                root = self.gen_map(member)
        self.gen_tree(root, member_list)
        return root

    def gen_tree(self, root, member_list):
        for member in member_list:
            if member.parent_id and member.parent_id == root.get('id'):
                m = self.gen_map(member)
                root['children'].append(m)
                self.gen_tree(m, member_list)
        return root

    def gen_map(self, member):
        root = {'id': member.id, 'name': member.name, 'gender': member.gender, 'spouse': member.spouse,
                'introduction': member.introduction, 'parentId': member.parent_id, 'groupId': member.group.id,
                'groupName': member.group.name, 'children': [], 'birthday': member.birthday,
                'festival_day': member.festival_day}
        return root


class Member(View):
    @method_decorator(login_required(login_url='/login/'))
    def get(self, request):
        page = request.GET.get('page', 1)
        page_size = request.GET.get('page_size', 15)
        group_id = request.GET.get('groupId', '')
        input_name = request.GET.get('name', '')

        member_obs = Members.objects
        if len(group_id) > 0 or len(input_name) > 0:
            if len(group_id) > 0:
                if group_id == '': group_id = 0
                member_obs = member_obs.filter(group_id=group_id)
            if len(input_name) > 0:
                member_obs = member_obs.filter(name=input_name)
        else:
            member_obs = Members.objects.all()

        member_obs = member_obs.order_by('-id')

        # 创建分页对象
        paginator = Paginator(member_obs, page_size)
        # 根据当前页码,确定返回的数据
        current_page = paginator.page(page)
        # 保证前端取到的'页数'为整型
        page_id = int(page)
        # 总数
        count = paginator.count

        member_list = current_page.object_list
        group_list = Groups.objects.all()

        username = request.user.username
        return render(request, 'member_list.html', locals())

    @method_decorator(login_required(login_url='/login/'))
    def delete(self, request):
        param = json.loads(request.body)
        member_id = param['id']
        Members.objects.filter(id=member_id).delete()
        return HttpResponse({'code': 200, 'status': 'successfull'})


class MemberAdd(View):
    @method_decorator(login_required(login_url='/login/'))
    def get(self, request):
        group_list = Groups.objects.all()
        member_list = Members.objects.all().order_by('-id')
        username = request.user.username
        return render(request, 'member_add.html', locals())

    @method_decorator(login_required(login_url='/login/'))
    def post(self, request):
        name = request.POST.get('name')
        if name == '':
            return render(request, 'fail.html', {'msg': '姓名不可为空...'})
        gender = request.POST.get('gender')
        birthday = request.POST.get('birthday')
        festival_day = request.POST.get('festival_day')
        spouse = request.POST.get('spouse')
        introduction = request.POST.get('introduction')
        groupId = request.POST.get('groupId')
        if groupId == '' or groupId == 0:
            return render(request, 'fail.html', {'msg': '群组不可为空...'})

        group = Groups.objects.filter(id=groupId).first()
        if not group:
            return render(request, 'fail.html', {'msg': '找不到对应族谱...'})

        parentId = request.POST.get('parentId')
        parent = None
        if len(parentId) > 0:
            parent = Members.objects.filter(id=parentId).first()
            if not parent:
                return render(request, 'fail.html', {'msg': '找不到对应长辈.'})
            if parent.group_id != int(groupId):
                return render(request, 'fail.html', {'msg': '长辈不属于该族谱.'})
        else:
            ms = Members.objects.filter(group_id=groupId).all()
            # 如果该族谱有成员则报错，没有则是族谱第一人
            if ms:
                return render(request, 'fail.html', {'msg': '该族谱已有节点，请选择成员的父辈...'})

        m = Members(name=name, gender=gender, birthday=birthday, festival_day=festival_day, spouse=spouse,
                    introduction=introduction, group=group, parent=parent, created_by=request.user.username)
        m.save()
        return render(request, 'member_add_success.html')


class MemberEdit(View):
    @method_decorator(login_required(login_url='/login/'))
    def get(self, request, id=None):
        member_id = request.GET.get('id')
        if not member_id:
            member_id = id
        user = Members.objects.get(id=member_id)
        parent = user.parent
        group = user.group
        group_list = Groups.objects.all()
        member_list = Members.objects.all()
        username = request.user.username
        return render(request, 'member_edit.html', locals())

    @method_decorator(login_required(login_url='/login/'))
    def post(self, request):
        id = request.POST.get('id')
        member = Members.objects.filter(id=id).first()
        name = request.POST.get('name')
        if name == '':
            return render(request, 'fail.html', {'msg': '姓名不可为空...'})
        member.name = name
        member.gender = request.POST.get('gender')
        member.birthday = request.POST.get('birthday')
        member.festival_day = request.POST.get('festival_day')
        member.spouse = request.POST.get('spouse')
        member.introduction = request.POST.get('introduction')
        groupId = request.POST.get('groupId')
        if groupId == '' or groupId == 0:
            return render(request, 'fail.html', {'msg': '群组不可为空...'})
        group = Groups.objects.filter(id=groupId).first()
        if not group:
            return render(request, 'fail.html', {'msg': '找不到对应族谱...'})
        member.group = group

        parentId = request.POST.get('parentId')
        parent = None
        if int(parentId) > 0:
            parent = Members.objects.filter(id=parentId).first()
            if not parent:
                return render(request, 'fail.html', {'msg': '找不到对应长辈...'})
            member.parent = parent
        member.updated_by = request.user.username
        member.save()
        return redirect('/list/')


class Logout(View):
    def get(self, request):
        logout(request)
        return render(request, 'login.html')
