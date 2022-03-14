# Generated by Django 4.0.2 on 2022-03-14 11:52

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Groups',
            fields=[
                ('id', models.BigAutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(help_text='族群名', max_length=255, unique=True, verbose_name='族群名')),
                ('remark', models.TextField(blank=True, help_text='备注', verbose_name='备注')),
                ('created_by', models.CharField(help_text='创建人', max_length=100, verbose_name='创建人')),
                ('updated_by', models.CharField(help_text='更新人', max_length=100, verbose_name='更新人')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
            ],
            options={
                'verbose_name': '族谱族群',
                'verbose_name_plural': '族谱族群',
                'db_table': 'family_group',
                'ordering': ['id'],
            },
        ),
    ]
