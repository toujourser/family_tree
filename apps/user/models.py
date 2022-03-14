from django.db import models
from django.contrib.auth.models import AbstractUser


# 系统用户表
class Users(AbstractUser):
    group = models.ForeignKey('group.Groups', on_delete=models.CASCADE, verbose_name='所属家族节点')
    class Meta:
        db_table = 'users'
        verbose_name = '系统用户'
        verbose_name_plural = '系统用户'


# 族谱成员表
class Members(models.Model):
    GENDER_CHIOCES = [
        ('man', '男'),
        ('woman', '女')
    ]
    id = models.BigAutoField(primary_key=True)
    name = models.CharField(max_length=500, verbose_name='名字')
    spouse = models.CharField(max_length=100, null=True, blank=True, verbose_name='配偶')
    gender = models.CharField(max_length=8, choices=GENDER_CHIOCES, default='man', verbose_name='性别')
    avater = models.CharField(max_length=500, null=True, blank=True, verbose_name='头像')
    introduction = models.TextField(null=True, blank=True, verbose_name='介绍')
    parent = models.ForeignKey('self', on_delete=models.SET_NULL, null=True, blank=True, verbose_name='父节点')
    group = models.ForeignKey('group.Groups', on_delete=models.CASCADE, verbose_name='所属家族节点')
    birthday = models.CharField(max_length=500, null=True, blank=True, verbose_name='生日', help_text="生日")
    festival_day = models.CharField(max_length=500, null=True, blank=True, verbose_name='祭日', help_text="祭日")
    created_by = models.CharField(max_length=100, null=True, blank=True, verbose_name='创建人', help_text="创建人")
    updated_by = models.CharField(max_length=100, null=True, blank=True, verbose_name='更新人', help_text="更新人")
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name

    class Meta:
        db_table = 'family_member'
        verbose_name = '家族成员'
        verbose_name_plural = '家族成员'
        ordering = ['id']
        permissions = [('add_groups', 'Can add 族谱族群'), ('view_groups', 'Can view 族谱族群'),
                       ('delete_groups', 'Can delete 族谱族群'), ('change_groups', 'Can change 族谱族群'), ]
