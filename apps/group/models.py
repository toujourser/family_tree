from django.db import models


# 族谱
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
