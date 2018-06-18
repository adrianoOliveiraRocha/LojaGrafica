from django.http import HttpResponse
from django.conf import settings
from django.shortcuts import render
from dashboard_client.models import OrderImpress, OrderArt


def thanks(request):
	# i setting the pagseguro for send the transaction_id
	msg = ""
	context = {}
	try:
		transaction_id = request.GET['transaction_id']
		order_id = request.session['order_id']
		order = None 
		
		try:
			order = OrderArt.objects.get(id=order_id)
		except:
			order = OrderImpress.objects.get(id=order_id)
		
		order.transaction_id = transaction_id
		order.save()
		request.session['order_id'] = None
		
	except Exception as error:
		context.update({'msg': error})
	
	return render(request, 'core/thanks.html', context)


def notification(request):
	msg = 'this view serve by receive notifications'

	try:
		# notification code sended
		notification_code = request.POST['notificationCode']
		# setting pg object
		pg = PagSeguro(
				email=settings.PAGSEGURO_EMAIL,
				token=settings.PAGSEGURO_TOKEN
		)
		# this method get the informations relating to this code
		notification_data = pg.check_notification(notification_code)

		for key, value in notification_data.items():
			print(key, value)
		print(notification_data)

	except Exception as e:
		msg = 'we have a error: %s' % e

	return HttpResponse('Notifications')


def tests(request):
	return render(request, 'core/tests.html')
	
	