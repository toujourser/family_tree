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
        return render(request, 'group_list.html')

class GroupAdd(View):
    def get(self, request):
        return render(request, 'group_add.html')
