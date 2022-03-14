from django.contrib import admin
from apps.user.models import Users, Members
from django.contrib.auth.admin import UserAdmin


# Register your models here.

# Underwriter admin model
class UsersAdmin(UserAdmin):
    # 需要显示的字段信息
    list_display = (
        'id', 'username', 'first_name', 'email', 'is_active', 'group', 'is_superuser')

    # 设置哪些字段可以点击进入编辑界面，默认是第一个字段
    list_display_links = (
        'id', 'username', 'first_name', 'email', 'is_active', 'group', 'is_superuser')

    ordering = ["-id", ]
    fieldsets = (
        (None, {'fields': ('username', 'password')}),
        (('Personal info'), {'fields': ('first_name', 'last_name', 'email')}),
        (('Permissions'), {
            'fields': ('is_active', 'is_staff', 'is_superuser', 'groups', 'user_permissions'),
        }),
        (('Important dates'), {'fields': ('last_login', 'date_joined')}),
        (('Groups'), {'fields': ('group',)}),
    )
    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('username', 'password1', 'password2'),
        }),
    )


class MemberAdmin(admin.ModelAdmin):
    ordering = ["-id", ]
    # 需要显示的字段信息
    list_display = (
        'id', 'name', 'spouse', 'parent', 'group', 'created_by', 'created_at')

    # 设置哪些字段可以点击进入编辑界面，默认是第一个字段
    list_display_links = ('id', 'name')


admin.site.site_header = '族谱管理系统'
admin.site.site_title = '登录系统后台'
admin.site.index_title = '后台管理'

# 注册时，在第二个参数写上 admin model
admin.site.register(Users, UsersAdmin)
admin.site.register(Members, MemberAdmin)
