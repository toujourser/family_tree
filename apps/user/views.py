from django.shortcuts import render, HttpResponse, redirect, HttpResponseRedirect
from django.views import View
from apps.user.models import Groups, Members
from django.contrib.auth import authenticate, login, logout
from django.utils.decorators import method_decorator
from django.contrib.auth import authenticate
from django.contrib.auth.decorators import login_required
from django.core.paginator import Paginator
import json


class Login(View):
    def get(self, request):
        return render(request, "login.html")

    def post(self, request):
        username = request.POST.get('username')
        password = request.POST.get('password')
        print(username, password, "------------------")
        # 验证用户密码
        user = authenticate(username=username, password=password)
        if user:
            login(request, user)
            return redirect("/index/")
        else:
            return render(request, "login.html")


class Index(View):
    @method_decorator(login_required(login_url='/login/'))
    def get(self, request):
        group_id = request.GET.get('id', 1)
        data = self.get_tree(group_id)
        group_list = Groups.objects.all()
        return render(request, "index.html",
                      {'username': request.user.username, 'group_list': group_list, 'data': json.dumps(data)})

    def get_tree(self, group_id):
        member_list = Members.objects.filter(group_id=group_id).all()
        root = dict()
        for member in member_list:
            if not member.parent_id:
                root = self.gen_map(member)
        self.gen_tree(root, member_list)
        print(root)
        return root

    def gen_tree(self, root, member_list):
        for member in member_list:
            if member.parent_id == root['id']:
                m = self.gen_map(member)
                root['children'].append(m)
                self.gen_tree(m, member_list)
        return root

    def gen_map(self, member):
        root = {'id': member.id, 'name': member.name, 'gender': member.gender, 'spouse': member.spouse,
                'introduction': member.introduction, 'parentId': member.parent_id, 'groupId': member.group.id,
                'groupName': member.group.name, 'children': []}
        return root


class Member(View):
    def get(self, request):
        page = request.GET.get('page', 1)
        page_size = request.GET.get('page_size', 3)
        ms = Members.objects.all()
        ms_pagin = Paginator(ms, page_size)
        count = ms_pagin
        m_page = ms_pagin.page(page)

        member_list = m_page.object_list

        group_list = Groups.objects.all()

        return render(request, "list.html", {'username': request.user.username, 'group_list': group_list, 'member_list': member_list})


class Logout(View):
    def get(self, request):
        logout(request)
        return render(request, "login.html")
