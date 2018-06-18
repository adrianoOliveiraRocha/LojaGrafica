# Generated by Django 2.0.3 on 2018-06-08 11:56

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('dashboard_client', '0004_auto_20180602_0925'),
    ]

    operations = [
        migrations.AddField(
            model_name='orderimpress',
            name='status_pg',
            field=models.CharField(blank=True, choices=[('1', 'Completo'), ('2', 'Aprovado'), ('3', 'Em Análise'), ('4', 'Devolvido'), ('5', 'Cancelado')], max_length=10, null=True, verbose_name='Status PagSeguro'),
        ),
        migrations.AlterField(
            model_name='orderart',
            name='status',
            field=models.CharField(choices=[('FZ', 'finalizado'), ('EA', 'em andamento')], default='EA', max_length=2, verbose_name='Status do Pedido'),
        ),
        migrations.AlterField(
            model_name='orderimpress',
            name='status',
            field=models.CharField(choices=[('FZ', 'finalizado'), ('EA', 'em andamento')], default='EA', max_length=2, verbose_name='Status do Pedido'),
        ),
    ]
