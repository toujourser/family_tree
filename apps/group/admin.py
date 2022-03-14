from django.contrib import admin
from apps.group.models import Groups
from django.contrib.auth.admin import UserAdmin


class GroupAdmin(admin.ModelAdmin):
    ordering = ["-id", ]
    # 需要显示的字段信息
    list_display = ('id', 'name', 'remark', 'created_by', 'updated_at')

    # 设置哪些字段可以点击进入编辑界面，默认是第一个字段
    list_display_links = ('id', 'name', 'remark', 'created_by', 'updated_at')

    fieldsets = [
        (None, {'fields': ['name', 'remark']}),
        ('Date information', {'fields': ['created_by', 'updated_by']}),
    ]


# 注册时，在第二个参数写上 admin model
admin.site.register(Groups, GroupAdmin)
