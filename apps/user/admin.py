from django.contrib import admin
from apps.user.models import Users, Members
from django.contrib.auth.admin import UserAdmin


# Register your models here.

# Underwriter admin model
class UsersAdmin(UserAdmin):
    # 需要显示的字段信息
    list_display = (
        'id', 'username', 'email', 'is_active', 'is_superuser')

    # 设置哪些字段可以点击进入编辑界面，默认是第一个字段
    list_display_links = (
        'id', 'username', 'email', 'is_active', 'is_superuser')

    # fieldsets = [
    #     (None, {'fields': ['username',]}),
    #     ('Date information', {'fields': ['pub_date']}),
    # ]


class MemberAdmin(admin.ModelAdmin):
    # 需要显示的字段信息
    list_display = (
        'id', 'name', 'spouse', 'parent', 'group', 'created_by', 'created_at')

    # 设置哪些字段可以点击进入编辑界面，默认是第一个字段
    list_display_links = ('id', 'name')


# 注册时，在第二个参数写上 admin model
admin.site.register(Users, UsersAdmin)
admin.site.register(Members, MemberAdmin)
