from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib import messages
from django.urls import reverse
from core.models import Service, ServiceImpress
from . models import OrderImpress, OrderArt, OrderItemImpress, OrderItemArt 
from accounts.models import User
from . forms import OrderItemImpressForm, OrderItemArtForm


@login_required
def index(request):
	""" the index show the order impress """
	context = {'data': OrderImpress.get_orderImpress_data(request.user.id)}
	return render(request, 'dashboard_client/index.html', context)


@login_required
def index_art(request):
	""" the index show the order impress """
	print('\n', OrderArt.get_orderArt_data(request.user.id), '\n')
	context = {'data': OrderArt.get_orderArt_data(request.user.id)}
	return render(request, 'dashboard_client/index_art.html', context)


@login_required
def insert_cart(request, service_id):
	try:
		service = ServiceImpress.objects.get(id=service_id)
	except:
		service = Service.objects.get(id=service_id)

	if isinstance(service, ServiceImpress):
		orderImpress = OrderImpress.getLastOrderImpress(request.user.id)
		if orderImpress is None or orderImpress.status != 'EA':
		 	# to create other OrderImpress
			orderImpress = OrderImpress()
			orderImpress.value = service.value
			orderImpress.user = User.objects.get(id=request.user.id)
			orderImpress.save()
			# create the first orderItemImpress
			orderItemImpress = OrderItemImpress()
			orderItemImpress.service = service
			orderItemImpress.order = orderImpress
			orderItemImpress.save()

		elif orderImpress is not None and orderImpress.status == 'EA':
			orderItemImpress = OrderItemImpress()
			orderItemImpress.service = service
			orderItemImpress.order = orderImpress
			orderItemImpress.save()
			orderImpress.value = OrderImpress.current_value(orderImpress.id)
			orderImpress.save()

		return HttpResponseRedirect(reverse('dashboard_client:index'))
	
	else: # is Service
		orderArt = OrderArt.getLastOrderArt(request.user.id)
		if orderArt is None or orderArt.status != 'EA':
		 	# to create other OrderArt
			orderArt = OrderArt()
			orderArt.value = service.value
			orderArt.user = User.objects.get(id=request.user.id)
			orderArt.save()
			# create the first orderItemArt
			orderItemArt = OrderItemArt()
			orderItemArt.service = service
			orderItemArt.orderArt = orderArt
			orderItemArt.save()

		elif orderArt is not None and orderArt.status == 'EA':
			orderItemArt = OrderItemArt()
			orderItemArt.service = service
			orderItemArt.orderArt = orderArt
			orderItemArt.save()
			orderArt.value = OrderArt.current_value(orderArt.id)
			orderArt.save()

		return HttpResponseRedirect(reverse('dashboard_client:index_art'))


@login_required
def delete_oii(request, oii_id):
	orderItemImpress = OrderItemImpress.objects.get(id=oii_id)
	orderItemImpress.delete()
	messages.success(request, 'Ítem deletado com sucesso!')
	return HttpResponseRedirect(reverse('dashboard_client:index'))


@login_required
def cancel_orderImpress(request, oi_id):
	orderImpress = OrderImpress.objects.get(id=oi_id)
	orderImpress.delete()
	messages.success(request, 'Pedido deletado com sucesso!')
	return HttpResponseRedirect(reverse('dashboard_client:index'))	


# impress
@login_required
def send_logo(request, item_id):
	orderItemImpress = OrderItemImpress.objects.get(id=item_id)
	data = {'service': orderItemImpress.service,
	'order': orderItemImpress.order,}
	if request.method == 'POST':
		
		orderItemImpressForm = OrderItemImpressForm(request.POST,
			request.FILES)

		if orderItemImpressForm.is_valid():
			orderItemImpress.art = orderItemImpressForm.cleaned_data['art']
			orderItemImpress.save()
			messages.add_message(request, messages.INFO,
			"Arquivo enviado com sucesso!")
			return HttpResponseRedirect(reverse('dashboard_client:index'))
	else:
		orderItemImpressForm = OrderItemImpressForm(initial=data)
		serviceImpress = ServiceImpress.objects.get(id=orderItemImpress.service.id)
	context = {
	'form': orderItemImpressForm,
	'orderItemImpress': orderItemImpress,
	'serviceImpress': serviceImpress,
	}
	return render(request, 'dashboard_client/insert_file.html', context)


def confirm_solicitation(request):
	orderItemImpressForm = OrderItemImpressForm(request.POST) 
	if orderItemImpressForm.is_valid():
		from datetime import date
		orderItemImpress = \
		OrderItemImpress.objects.get(id=request.POST.get('orderItemImpress_id'))
		orderItemImpress.creation_art_solicited = True
		orderItemImpress.observations = \
		orderItemImpressForm.cleaned_data['observations']
		orderItemImpress.date_solicitation = date.today()
		orderItemImpress.save()
		return HttpResponseRedirect(reverse('dashboard_client:index'))
	else:
		# return HttpResponseRedirect(reverse('dashboard_client:index'))
		return HttpResponse(form.errors)

# delivery address is the same?
@login_required
def delivery(request, order_id, opt):
	orderImpress = OrderImpress.objects.get(id=order_id)
	if opt == 0:
		orderImpress.delivery_address_is_the_same = True
	else:
		orderImpress.delivery_address_is_the_same = False
	orderImpress.save()
	return HttpResponseRedirect(reverse('dashboard_client:index'))


@login_required	
def save_address_delivery(request):
	orderImpress = OrderImpress.objects.get(id=int(request.POST.get('order_id')))
	orderImpress.logradouro_delivery = request.POST.get('logradouro')
	orderImpress.numero_delivery = request.POST.get('numero')
	orderImpress.cep_delivery = request.POST.get('cep')
	orderImpress.complemento_delivery = request.POST.get('complemento')
	orderImpress.bairro_delivery = request.POST.get('bairro')
	orderImpress.cidade_delivery = request.POST.get('cidade')
	orderImpress.estado_delivery = request.POST.get('estado')
	orderImpress.save()
	return HttpResponseRedirect(reverse('dashboard_client:index'))



