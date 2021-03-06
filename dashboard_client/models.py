from django.db import models
from core.models import Service
from datetime import date
from accounts.models import User
from pagseguro import PagSeguro
from django.conf import settings


STATUS_CHOICE = (
			('FZ', 'finalizado'), 
			('EA', 'em andamento'),
		)

STATUS_PAGSEGURO = (
		('1', 'Completo'), ('2', 'Aprovado'), 
		('3', 'Em Análise'), ('4', 'Devolvido'),
		('5', 'Cancelado')
	)

# Order Impress
class OrderImpress(models.Model):
	
	UF_CHOICES = (
	    ('AC','Acre'), ('AL','Alagoas'), ('AP','Amapá'),
	    ('AM','Amazonas'), ('BA','Bahia'), ('CE','Ceará'),
	    ('DF','Distrito Federal'), ('ES','Espírito Santo'),
	    ('GO','Goiás'), ('MA','Maranhão'), ('MT','Mato Grosso'),
	    ('MS','Mato Grosso do Sul'), ('MG','Minas Gerais'),
	    ('PA','Pará'), ('PB','Paraíba'), ('PR','Paraná'),
	    ('PE','Pernambuco'), ('PI','Piauí'),
	    ('RJ','Rio de Janeiro'), ('RN','Rio Grande do Norte'),
	    ('RS','Rio Grande do Sul'), ('RO','Rondônia'),
	    ('RR','Roraima'), ('SC','Santa Catarina'),
	    ('SP','São Paulo'), ('SE','Sergipe'),
		('TO','Tacantins'), 
	)

	date = models.DateField(default=date.today, editable=False)
	value = models.DecimalField('Valor R$', max_digits=10, 
		decimal_places=2, default=0)
	status = models.CharField('Status do Pedido', max_length=2,
		choices=STATUS_CHOICE, default='EA')
	user = models.ForeignKey(User, on_delete=models.CASCADE)

	delivery_address_is_the_same = models.BooleanField(
		verbose_name='Entregar no endereço cadastrado',
		default=True,
		blank=True)
	logradouro_delivery = models.CharField('Rua/Avenida', max_length=100,
		null=True, blank=True, default='')
	numero_delivery = models.CharField('Número', max_length=100,
		null=True, blank=True, default='')
	cep_delivery = models.CharField('CEP', max_length=10, null=True, 
		blank=True, default='')
	complemento_delivery = models.CharField('Complamento', max_length=100, 
		null=True, blank=True, default='')
	bairro_delivery = models.CharField('Bairro', max_length=100, null=True, 
		blank=True, default='')
	cidade_delivery = models.CharField('Cidade', max_length=100, null=True,
		blank=True, default='')
	estado_delivery = models.CharField('Estado', max_length=100, null=True,
		blank=True, default='')
	transaction_id = models.CharField('ID da transação', max_length=100, null=True,
		blank=True)
	status_pg = models.CharField('Status PagSeguro', max_length=10,
		choices=STATUS_PAGSEGURO, default='3')
		
	def __str__(self):
		return 'Feito por {} em {}'.format(self.user, self.date)

	class Meta:
		verbose_name = 'Pedido Impressão'
		verbose_name_plural = 'Pedidos Impressão'
		ordering = ['date']

	@staticmethod
	def getLastOrderImpressId(user_id):
		""" return the last id for order that user """
		from django.db.models import Max
		# get all orders for that user
		try:
			orders = OrderImpress.objects.filter(user_id=user_id)
			return orders.aggregate(Max('id'))['id__max']
		except:
			return None

	@staticmethod
	def get_orderImpress_data(user_id):
		# get last order 
		order_id = OrderImpress.getLastOrderImpressId(user_id)
		orderImpress = None
		try:
			orderImpress = OrderImpress.objects.get(id=order_id)
		except:
			pass
		if orderImpress is not None:
			data = {}	
			if orderImpress.status == 'EA':
				data.update({'order': orderImpress})
			else:
				pass

			number_field_ad = OrderImpress.get_number_field_ad(orderImpress)
			orderItemImpress_list, total = OrderItemImpress.getList(order_id)

			data.update({'number_field_ad': number_field_ad})
			data.update({'orderItemImpress_list': orderItemImpress_list})
			data.update({'total': total})

			return data

		else:
			return None
	
	@staticmethod
	def get_number_field_ad(orderImpress):
		""" counts a number of filled-in address delivery fields """
		number = 0
		if orderImpress.logradouro_delivery:
			number = number + 1
		if orderImpress.numero_delivery: 
			number = number + 1
		if orderImpress.cep_delivery:
			number = number + 1
		if orderImpress.complemento_delivery:
			number = number + 1
		if orderImpress.bairro_delivery:
			number = number + 1
		if orderImpress.cidade_delivery:
			number = number + 1
		if orderImpress.estado_delivery:
			number = number + 1
		
		return number

	@staticmethod
	def current_value(order_id):
		orderItemImpress_list = \
		OrderItemImpress.objects.filter(order_id=order_id)
		total = 0
		for item in orderItemImpress_list:
			total = total + item.service.value
		return total

	@staticmethod
	def getLastOrderImpress(user_id):
		""" return the last order for this user """
		last_id = OrderImpress.getLastOrderImpressId(user_id)
		if last_id is not None:
			return OrderImpress.objects.get(id=last_id)
		else:
			return None


	@staticmethod
	def get_client(order_id):
		orderImpress = OrderImpress.objects.get(id=order_id)
		return orderImpress.user

	@staticmethod
	def get_orders_ap():
		return OrderImpress.objects.filter(status='AP')


class OrderItemImpress(models.Model):
	quantity = models.PositiveSmallIntegerField(verbose_name='Quantidade',
		default=1, editable=False)
	service = models.ForeignKey(Service, on_delete=models.CASCADE)
	art = models.FileField(upload_to='order-item-impress',
		verbose_name='Logo', null=True, blank=True)
	order = models.ForeignKey(OrderImpress, on_delete=models.CASCADE,
		related_name="itens",)
	creation_art_solicited = models.BooleanField(
		verbose_name='Criação de arte solicitada',
		default=False,
		blank=True)
	observations = models.TextField('Observações', max_length=300,
		blank=True, null=True)
	date_solicitation = models.DateTimeField('Data de solicitação da arte',
		blank=True, null=True)
	# if the user require the art creation, he have send model
	model = models.FileField(upload_to='order-item-impress',
		verbose_name='Logo', null=True, blank=True)
	# it is images examples for art creation
	image_example1 = models.FileField(upload_to='image-example',
		verbose_name='Imagem de Exemplo 1', null=True, blank=True)
	image_example2 = models.FileField(upload_to='image-example',
		verbose_name='Imagem de Exemplo 2', null=True, blank=True)
	image_example3 = models.FileField(upload_to='image-example',
		verbose_name='Imagem de Exemplo 3', null=True, blank=True)
	image_example4 = models.FileField(upload_to='image-example',
		verbose_name='Imagem de Exemplo 4', null=True, blank=True)

	class Meta:
		verbose_name = 'Impressão'
		verbose_name_plural = 'Impressões'
		ordering = ['order']

	@staticmethod
	def getList(order_id):
		''' returns the list that items that order and your total value '''
		orderItemImpress_list = \
		OrderItemImpress.objects.filter(order_id=order_id)
		total = 0
		for item in orderItemImpress_list:
			total = total + item.service.value
		return orderItemImpress_list, total

	@staticmethod
	def get_cart_items(order_id):
		cart_items = []
		items = OrderItemImpress.objects.filter(order_id=order_id)
		count = 1
		for item in items:
			list_item = []
			list_item.append(count)
			list_item.append(item.id)
			list_item.append(item.service.description)
			list_item.append(str(item.service.value)) 
			cart_items.append(list_item)
			count = count + 1
		return cart_items


# Order Creation Art
class OrderArt(models.Model):
	date = models.DateField(default=date.today, editable=False)
	value = models.DecimalField('Valor R$', max_digits=5, 
		decimal_places=2, default=0)
	status = models.CharField('Status do Pedido', max_length=2,
		choices=STATUS_CHOICE, default='EA')
	user = models.ForeignKey(User, on_delete=models.CASCADE)
	model = models.FileField(upload_to='orderArt_models', blank=True,
		null=True)
	transaction_id = models.CharField('ID da transação', max_length=100, null=True,
		blank=True)

	def __str__(self):
		return 'Feito por {} em {}'.format(self.user, self.date)

	class Meta:
		verbose_name = 'Pedido Criação de Arte'
		verbose_name_plural = 'Pedidos Criação de Arte'
		ordering = ['date']

	@staticmethod
	def getLastOrderArtId(user_id):
		""" return the last id for order that user """
		from django.db.models import Max
		# get all orders for that user
		try:
			orders = OrderArt.objects.filter(user_id=user_id)
			return orders.aggregate(Max('id'))['id__max']
		except:
			return None

	@staticmethod
	def getLastOrderArt(user_id):
		""" return the last order for this user """
		last_id = OrderArt.getLastOrderArtId(user_id)
		if last_id is not None:
			return OrderArt.objects.get(id=last_id)
		else:
			return None

	@staticmethod
	def get_orderArt_data(user_id):
		# get last order 
		orderArt = OrderArt.getLastOrderArt(user_id)
		if orderArt is not None:
			data = {}	
			if orderArt.status == 'EA':
				data.update({'orderArt': orderArt})
			else:
				pass

			orderItemArt_list, total = OrderItemArt.getList(orderArt.id)
			data.update({'orderItemArt_list': orderItemArt_list})
			data.update({'total': total})
			return data
		else:
			return None

	@staticmethod
	def current_value(order_id):
		orderItemArt_list = \
		OrderItemArt.objects.filter(orderArt_id=order_id)
		total = 0
		for item in orderItemArt_list:
			total = total + item.service.value
		return total


class OrderItemArt(models.Model):
	quantity = models.PositiveSmallIntegerField(verbose_name='Quantidade',
		default=1, editable=False)
	service = models.ForeignKey(Service, on_delete=models.CASCADE)
	orderArt = models.ForeignKey(OrderArt, on_delete=models.CASCADE,
		related_name="items", null=True, blank=True)
	note = models.TextField(verbose_name='Observações', null=True,
		blank=True)
	model = models.FileField(upload_to='order-item-impress',
		verbose_name='Logo', null=True, blank=True)
	
	image_example1 = models.FileField(upload_to='image-example',
		verbose_name='Imagem de Exemplo 1', null=True, blank=True)
	image_example2 = models.FileField(upload_to='image-example',
		verbose_name='Imagem de Exemplo 2', null=True, blank=True)
	image_example3 = models.FileField(upload_to='image-example',
		verbose_name='Imagem de Exemplo 3', null=True, blank=True)
	image_example4 = models.FileField(upload_to='image-example',
		verbose_name='Imagem de Exemplo 4', null=True, blank=True)

	final_work = models.FileField(upload_to='final_work',
		verbose_name='Trabalho Final', null=True, blank=True)

	@staticmethod
	def getList(orderArt_id):
		orderItemArt_list = \
		OrderItemArt.objects.filter(orderArt_id=orderArt_id)
		total = 0
		for item in orderItemArt_list:
			total = total + item.service.value
		return orderItemArt_list, total

	@staticmethod
	def delete_images(orderItemArt):
		import os
		from lojagrafica.settings import BASE_DIR
		try:
			path = BASE_DIR + orderItemArt.image_example1.url
			os.remove(path)
			path = BASE_DIR + orderItemArt.image_example2.url
			os.remove(path)
			path = BASE_DIR + orderItemArt.image_example3.url
			os.remove(path)
			path = BASE_DIR + orderItemArt.image_example4.url
			os.remove(path)
			
		except:
			pass
			
		 

