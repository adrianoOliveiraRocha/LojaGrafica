from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from dashboard_client.models import (OrderImpress, OrderItemImpress,
	OrderArt, OrderItemArt)
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib import messages
from accounts.models import User


@login_required
def finalize_payment(request, order_id):
	order = None
	
	try:
		order = OrderArt.objects.get(id=order_id)
	except:
		order = OrderImpress.objects.get(id=order_id)

	if isinstance(order, OrderArt):
		return HttpResponse('this part yet not is finished')
	elif isinstance(order, OrderImpress):
		cart_items = OrderItemImpress.get_cart_items(order_id)
		client = OrderImpress.get_client(order_id)
		
		context = {
			'order': order,
			'cart_items': cart_items,
			'client': client 
		}
		request.session['order_id'] = order_id
		return render(request, 'checkout/finalize_payment.html',
			context)
