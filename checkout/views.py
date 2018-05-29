from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from dashboard_client.models import (OrderImpress, OrderItemImpress,
	OrderArt, OrderItemArt)
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib import messages
from accounts.models import User


@login_required
def finalize_payment(request, order_id):
	context = {'order_id': order_id}
	return render(request, 'checkout/finalize_payment.html',
		context)


@login_required
def finalizing(request, order_id):
	order = None
	orderItems = None
	total = None
	try:
		order = OrderArt.objects.get(id=order_id)
	except:
		order = OrderImpress.objects.get(id=order_id)

	if isinstance(order, OrderArt):
		return HttpResponse('this part yet not is finished')
	elif isinstance(order, OrderImpress):
		user = User.objects.get(id=request.user.id)
		pg = OrderImpress.pagseguro(order_id, user)
		response = pg.checkout()
		# here i need push the order id in session variable because i 
		# have that take it in method thanks
		return redirect(response.payment_url)


