from django.http import HttpResponse
from django.conf import settings


def thanks(request):
	return HttpResponse('thanks my brother!')


def notification(request):
	try:
		notification_code = request.POST['notificationCode']
		pg = PagSeguro(
				email=settings.PAGSEGURO_EMAIL,
				token=settings.PAGSEGURO_TOKEN
		)
		notification_data = pg.check_notification(notification_code)
		
		print(notification_data)

		return HttpResponse('this viwew serve by notifications')

	except Exception as e:
		return HttpResponse('we have a error: %s' % e)
	