from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib import messages
from django.urls import reverse
from core.models import Service, ServiceImpress
from . models import OrderImpress 


@login_required
def index(request):
	return render(request, 'dashboard_client/index.html')


@login_required
def insert_cart(request, service_id):
	try:
		service = ServiceImpress.objects.get(id=service_id)
	except:
		service = Service.objects.get(id=service_id)

	if service.__class__.__name__ == 'ServiceImpress':
		orderImpress = OrderImpress.getLastOrderImpress(request.user.id)
		if orderImpress is None: # to create other OrderImpress
			pass
		else:
			if orderImpress.status == 'EA':
				print('there are a orderImpress in open')
			else:
				print('do not there are a orderImpress in open')
	else:
		pass

	return HttpResponse(service.__class__.__name__)
