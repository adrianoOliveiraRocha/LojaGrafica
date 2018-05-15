from django import template
from core.models import Service

register = template.Library()

@register.simple_tag
def get_value(service_id):
	value = None
	
	try:
		service = Service.objects.get(id=service_id)
		value = service.value
	except:
		pass

	if value is None:
		return 'depende de análise'
	else:
		return 'R$ %d ' % value
	
	