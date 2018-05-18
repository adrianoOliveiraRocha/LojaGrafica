from django.db import models
from django.urls import reverse

class Category(models.Model):
	name = models.CharField('Nome', max_length=100)
	slug = models.CharField('slug', max_length=100, null=True, blank=True)
	created = models.DateTimeField('Criado em', auto_now_add=True)
	modified = models.DateTimeField('Modificado em', auto_now=True)

	class Meta:
		verbose_name = 'Categoria'
		verbose_name_plural = 'Categorias'
		ordering = ['name']

	def __str__(self):
		return self.name

	def get_absolute_url(self):
		return reverse('catalog:category', kwargs={'slug': self.slug})

	@staticmethod
	def get_names_and_id():
		all_categories = Category.objects.all()
		infos_categories = {}
		
		for category in all_categories:
			infos_categories[category.id] = category.name
			
		return infos_categories

	@staticmethod
	def create_choices_category():
		categories = Category.objects.all()
		category_choices = {}
		for category in categories:
			category_choices[category.id] = category.name
		return category_choices

# criation art service
class Service(models.Model):
	TYPE_CHOICES = (
			('IP', 'impressão'), 
			('AT', 'criação de arte'),
			
		)
	description = models.TextField('Descrição', max_length=300)
	image = models.ImageField(upload_to='impress-art',
		verbose_name='Imagem', null=True, blank=True)
	value = models.DecimalField(verbose_name='Valor', null=True,
		blank=True, max_digits=8, decimal_places=2)
	category = models.ForeignKey(Category, on_delete=models.CASCADE, 
		null=True, blank=True)
	

	class Meta:
		verbose_name = 'Serviço'
		verbose_name_plural = 'Serviços'
		ordering = ['description']

	def __str__(self):
		return self.description

	def getServiceDescription(service_id):
		service = Service.objects.get(id=service_id)
		return service.description

	@staticmethod
	def change_for_decimal(valuestring):
		new_value = valuestring.replace(',', '.')
		return float(new_value)

	@staticmethod
	def service_white_category(category_id):
		services = Service.objects.filter(category__id=category_id)
		if services:
			return True
		else:
			return False

	@staticmethod
	def get_only_service():
		""" return services that are not ServiceImpress """
		services = Service.objects.all()
		art_service = []
		for service in services:
			try:
				ServiceImpress.objects.get(id=service.id)
			except:
				# it is not service impress
				art_service.append(service)
		return art_service
	
# create impress service
class ServiceImpress(Service):
	value_creation_art = models.DecimalField(verbose_name='Valor',
		max_digits=8, decimal_places=2)
	deadline = models.PositiveSmallIntegerField('Prazo em dias para criação de arte',
		null=True, blank=True)
	
	