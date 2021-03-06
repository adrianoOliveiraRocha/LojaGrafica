from django.shortcuts import render
from django.views.generic.base import TemplateView
from django.contrib.auth.decorators import login_required
from dashboard_client.models import OrderImpress
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib import messages
from core.forms import CategoryForm
from django.urls import reverse
from core.models import Service, Category, ServiceImpress
from core.forms import CategoryForm, ServiceForm
from dashboard_client.models import OrderItemImpress
from accounts.models import User
from dashboard_client.models import OrderArt, OrderItemArt
from django.conf import settings
from django.shortcuts import redirect
from django.shortcuts import resolve_url


@login_required
def index(request):
	# the user can see the orders finalizeds
	context = {'orderimpress_list': OrderImpress.objects.all()}
	orderimpress_list = OrderImpress.objects.all()
	
	if request.user.is_staff:
		return render(request, 'dashboard_admin/index.html', context)
	else:
		messages.warning(request,
			"Você não tem permissão para acessar essa área")
		return HttpResponseRedirect(reverse('core:index'))


@login_required
def new_category(request):
	context = {}
	if request.method == 'GET':
		form = CategoryForm()
		context.update({'form': form})
		return render(request, 'dashboard_admin/new_category.html', context)
		
	else:
		form = CategoryForm(request.POST)
		context.update({'form': form})
		if form.is_valid():
			form.save()
			messages.success(request, 'Nova categoria salva com sucesso!')
			
		else:
			messages.error(request, 'Erro ao tentar salvar!')
			
		return HttpResponseRedirect(reverse('dashboard_admin:all_categories'))	


@login_required
def all_categories(request):
	categories = Category.objects.all()
	return render(request, 'dashboard_admin/all_categories.html',
		{'categories': categories})


def delete_srvice(request, service_id):
	service = Service.objects.get(id=service_id)
	try:
		service.delete()
		messages.success(request, 'Serviço deletado com sucesso!')
	except Exception as e:
		messages.warning(request, 'Não foi possível realizar essa operação!')
	
	return HttpResponseRedirect(reverse('accounts:all_services'))


@login_required
def edit_category(request, category_id):
	category = Category.objects.get(id=category_id)
	if request.method == 'GET':
		form = CategoryForm(instance=category)
		return render(request, 'dashboard_admin/edit_category.html',
			{'form': form, 'category_id': category.id})
	else:
		form = CategoryForm(request.POST, instance=category)
		if form.is_valid():
			form.save()
			messages.success(request,
				'Categria atualizada com sucesso!')
			return HttpResponseRedirect(reverse('dashboard_admin:all_categories'))


def delete_category(request, category_id):
	category = Category.objects.get(id=category_id)
	try:
		category.delete()
		messages.success(request, 'Categoria deletada com sucesso!')
	except Exception as e:
		messages.warning(request, 'Não foi possível realizar essa operação!')
	
	return HttpResponseRedirect(reverse('dashboard_admin:all_categories'))
	

@login_required
def new_art_service(request):
	context = {'categories': Category.create_choices_category()}
	if request.method == 'GET':
		form = ServiceForm()
		context.update({'form': form})
		return render(request, 'dashboard_admin/new_art_service.html', context)

	else:
		form = ServiceForm(request.POST, request.FILES)
		context.update({'form': form})
		if form.is_valid():
			category_id = int(request.POST.get('category'))
			category = Category.objects.get(id=category_id)

			service = Service()
			service.description = form.cleaned_data['description']
			service.image = form.cleaned_data['image']
			service.category = category
			service.value = Service.change_for_decimal(form.cleaned_data['value'])
			service.save()

			messages.success(request, 'Novo serviço criado com sucesso!')	
			return HttpResponseRedirect(reverse('dashboard_admin:all_services'))
		else:
			messages.error(request, 'Erro ao tentar salvar!')
			return render(request, 'dashboard_admin/new_art_service.html', context)


@login_required
def all_services(request):
	services = Service.objects.all()
	return render(request, 'dashboard_admin/all_services.html',
		{'services': services})


@login_required
def detail_service(request, service_id):
	try:
		service = ServiceImpress.objects.get(id=service_id)
	except:
		service = Service.objects.get(id=service_id)

		print('\n', service.__class__.__name__,'\n')

	return render(request, 'dashboard_admin/detail_service.html', 
		{'service': service})


@login_required
def edit_service(request, service_id):
	try:
		service = ServiceImpress.objects.get(id=service_id)
	except:
		service = Service.objects.get(id=service_id)

	infos_categories = Category.get_names_and_id()
	current_category = service.category
	context = {
		'service': service,
		'infos_categories': infos_categories,
		'current_category': service.category.id
	}
	
	if request.method == 'GET':
		data = {
		'description': service.description,
		'image': service.image.url,
		'value': service.value,
		}

		if service.__class__.__name__ == 'ServiceImpress':
			data['value_creation_art'] = service.value_creation_art
			
		form = ServiceForm(initial=data)
		context.update({'form': form})
		
	else:
		
		form = ServiceForm(request.POST, request.FILES)
		if form.is_valid():
			category = Category.objects.get(id=int(request.POST.get('category')))

			service.description = form.cleaned_data['description']
			if form.cleaned_data['image']:
				service.image = form.cleaned_data['image']
			service.category = category
			service.value = Service.change_for_decimal(form.cleaned_data['value'])
			if service.__class__.__name__ == 'ServiceImpress':
				service.value_creation_art = \
				Service.change_for_decimal(form.cleaned_data['value_creation_art'])
			service.save()
			context.update({'form': form})
			context.update({'current_category': service.category.id})
			messages.success(request, 'Serviço editado com sucesso!')
			
		else:
			# print(form.errors)
			messages.warning(request, 'Não foi possível realizar essa operação')

	return render(request, 'dashboard_admin/edit_service.html', context)


def delete_service(request, service_id):
	service = Service.objects.get(id=service_id)
	try:
		service.delete()
		messages.success(request, 'Serviço deletado com sucesso!')
	except Exception as e:
		messages.warning(request, 'Não foi possível realizar essa operação!')
	
	return HttpResponseRedirect(reverse('dashboard_admin:all_services'))


@login_required
def new_impress_service(request):
	context = {'categories': Category.create_choices_category()}
	if request.method == 'GET':
		form = ServiceForm()
		context.update({'form': form})
		return render(request, 'dashboard_admin/new_impress_service.html', context)

	else:
		form = ServiceForm(request.POST, request.FILES)
		context.update({'form': form})
		if form.is_valid():
			category_id = int(request.POST.get('category'))
			category = Category.objects.get(id=category_id)
			
			service = ServiceImpress()
			service.description = form.cleaned_data['description']
			service.image = form.cleaned_data['image']
			service.category = category
			service.value = Service.change_for_decimal(form.cleaned_data['value'])
			service.value_creation_art = \
			Service.change_for_decimal(form.cleaned_data['value_creation_art'])
			service.deadline = form.cleaned_data['deadline']
			service.save()
			messages.success(request, 'Novo serviço criado com sucesso!')	
			return HttpResponseRedirect(reverse('dashboard_admin:all_services'))
		else:
			messages.error(request, form.errors)
			return render(request, 'dashboard_admin/new_impress_service.html',
				context)

@login_required
def detail_oi(request, oi_id):
	orderimpress = OrderImpress.objects.get(id=oi_id)
	itens_list = OrderItemImpress.objects.filter(order_id=oi_id)
	context = {
		'orderimpress': orderimpress,
		'itens_list': itens_list}

	return render(request, 'dashboard_admin/detail_oi.html', context)


@login_required
def all_clients(request):
	all_clients = User.get_all_clients()
	context = {'all_clients': all_clients}
	return render(request, 'dashboard_admin/all_clients.html',
		context)


@login_required
def client_detail(request, client_id):
	client = User.objects.get(id=client_id)
	context = {'client': client}
	return render(request, 'dashboard_admin/client_detail.html',
		context)


@login_required
def artcreation_admin(request):
	orderart_list = OrderArt.objects.all()
	context = {'orderart_list': orderart_list} 
	if request.user.is_staff:
		return render(request, 'dashboard_admin/artcreation_admin.html', context)
	else:
		msg = "Você não tem permissão para acessar essa área"
		return render(request, 'accounts/errors.html', {'msg': msg})


@login_required
def detail_oa(request, oa_id):
	print('detail_oa: ', oa_id)
	orderart = OrderArt.objects.get(id=oa_id)
	itens_list = OrderItemArt.objects.filter(orderArt=oa_id)
	context = {
		'orderart': orderart,
		'itens_list': itens_list}

	return render(request, 'dashboard_admin/detail_oa.html', context)


@login_required
def become_inactive(request, client_id):
	user = User.objects.get(id=client_id)
	user.is_active = False
	user.save()
	return HttpResponseRedirect(reverse('dashboard_admin:client_detail', 
		kwargs={'client_id': client_id})) 


@login_required
def become_active(request, client_id):
	user = User.objects.get(id=client_id)
	user.is_active = True
	user.save()
	return HttpResponseRedirect(reverse('dashboard_admin:client_detail', 
		kwargs={'client_id': client_id})) 


@login_required
def all_members(request):
	all_members = User.get_all_members()
	for member in all_members:
		print(member.telefone)
	context = {'all_members': all_members}
	return render(request, 'dashboard_admin/all_members.html',
		context)


@login_required
def member_detail(request, member_id):
	member = User.objects.get(id=member_id)
	context = {'member': member}
	return render(request, 'dashboard_admin/member_detail.html',
		context)



@login_required
def update_pg_status(request, order_id):
	import requests
	import xml.etree.ElementTree as ET
	
	orer = None
	try:
		order = OrderArt.objects.get(id=order_id) 
	except:
		order = OrderImpress.objects.get(id=order_id)

	email = settings.PAGSEGURO_EMAIL
	token = settings.PAGSEGURO_TOKEN

	url = "https://ws.sandbox.pagseguro.uol.com.br/v2/transactions/{}?email={}&token={}".format(order.transaction_id, 
		email, token)
	r = requests.get(url)
	string_xml = r.text
	root = ET.fromstring(string_xml)
	status_pg = root[4].text
	print('current status {}'.format(order.status_pg))
	print('new status {}'.format(status_pg))
	order.status_pg = status_pg
	order.save()
	url_return = resolve_url('/area_administrativa/detalhes_do_pedido/{}'.format(order.id))
	return HttpResponseRedirect(url_return)