# Generated by Django 2.0.3 on 2018-06-02 12:25

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('dashboard_client', '0003_orderart_transaction_id'),
    ]

    operations = [
        migrations.AlterField(
            model_name='orderart',
            name='status',
            field=models.CharField(choices=[('FZ', 'finalizado'), ('EA', 'em andamento'), ('CL', 'cancelado'), ('PG', 'pago'), ('AP', 'aguardando pagamento')], default='EA', max_length=2, verbose_name='Status do Pedido'),
        ),
        migrations.AlterField(
            model_name='orderimpress',
            name='status',
            field=models.CharField(choices=[('FZ', 'finalizado'), ('EA', 'em andamento'), ('CL', 'cancelado'), ('PG', 'pago'), ('AP', 'aguardando pagamento')], default='EA', max_length=2, verbose_name='Status do Pedido'),
        ),
    ]
