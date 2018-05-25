from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from dashboard_client.models import (OrderImpress, OrderItemImpress,
	OrderArt, OrderItemArt)
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib import messages


@login_required
def finalize_payment(request, order_id):
	order = None
	orderItems = None
	total = None
	try:
		order = OrderArt.objects.get(id=order_id)
	except:
		order = OrderImpress.objects.get(id=order_id)

	if isinstance(order, OrderArt):
		pass
	elif isinstance(order, OrderImpress):
		orderItems, total = OrderImpress.getList(order_id)

	return render(request, 'checkout/finalize_payment.html')
