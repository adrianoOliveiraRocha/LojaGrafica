from django import template
from dashboard_client.models import Service, Service
from django.core.paginator import Paginator

register = template.Library()

@register.inclusion_tag('dashboard_client/show_services_art.html')
def show_services_art(request):
	# i nedd exclude ServiceImpress objects
	service_list = Service.get_only_service()
	paginator = Paginator(service_list, 3)
	page = request.GET.get('page')
	services = paginator.get_page(page)
	services_has_next = services.has_next()
	services_has_previous = services.has_previous()
	service_number = services.number

	context = {
		'services': services,
		'paginator': paginator,
		'service_number': service_number,
		'services_has_next': services_has_next,
		'services_has_previous': services_has_previous
		}
	return context


@register.simple_tag
def get_value(service_id):
	value = None
	
	try:
		service = Service.objects.get(id=service_id)
		value = service.value
	except:
		pass

	return 'R$ %d ' % value
	
	
	