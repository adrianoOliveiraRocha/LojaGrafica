# Generated by Django 2.0.3 on 2018-05-15 11:18

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0002_serviceimpress'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='service',
            name='category',
        ),
    ]
