from django.http import HttpResponse
from django.conf import settings


def notification(request):
	msg = 'this viwew serve by receive notifications'

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

	return HttpResponse(msg)

def thanks(request):
	return HttpResponse('obrigado')
	