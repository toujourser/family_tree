from django.db import models
from django.contrib.auth.models import AbstractUser


class Users(AbstractUser):
    class Meta:
        db_table = 'users'
        verbose_name = '系统用户'
        verbose_name_plural = '系统用户'


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
    group = models.ForeignKey('Groups', on_delete=models.CASCADE, verbose_name='所属分组节点')
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


class Groups(models.Model):
    id = models.BigAutoField(primary_key=True)
    name = models.CharField(max_length=500, unique=True, verbose_name='族群名', help_text="族群名")
    remark = models.TextField(blank=True, verbose_name='备注', help_text="备注")
    created_by = models.CharField(max_length=100, verbose_name='创建人', help_text="创建人")
    updated_by = models.CharField(max_length=100, verbose_name='更新人', help_text="更新人")
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name

    class Meta:
        db_table = 'family_group'
        verbose_name = '族谱族群'
        verbose_name_plural = '族谱族群'
