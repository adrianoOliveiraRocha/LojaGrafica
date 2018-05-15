from django import template

register = template.Library()


@register.simple_tag
def show_status(status):
	if status == 'FZ':
		return 'Finalizado'
	elif status == 'EA':
		return 'Em Andamento'
	elif status == 'CL':
		return 'Cancelado'
	elif status == 'PG':
		return 'Pago'


@register.simple_tag
def is_active(status):
	if status:
		return 'Ativo'
	else:
		return 'Inativo'


@register.simple_tag
def fix_state(state):
	if state == 'AC':
		return 'Acre'
	elif state == 'AL':
		return 'Alagoas'
	elif state == 'AP':
		return 'Amapá'
	elif state == 'AM':
		return 'Amazonas'
	elif state == 'BA':
		return 'Bahia'
	elif state == '"CE"':
		return 'Ceará'
	elif state == 'DF':
		return 'Distrito Federal'
	elif state == 'ES':
		return 'Espírito Santo'
	elif state == 'GO':
		return 'Goiás'
	elif state == 'MA':
		return 'Maranhão'
	elif state == 'MT':
		return 'Mato Grosso'
	elif state == 'MS':
		return 'Mato Grosso do Sul'
	elif state == 'MG':
		return 'Minas Gerais'
	elif state == 'PA':
		return 'Pará'
	elif state == 'PB':
		return 'Paraíba'
	elif state == 'PR':
		return 'Paraná'
	elif state == 'PE':
		return 'Pernambuco'
	elif state == 'PI':
		return 'Piauí'
	elif state == 'RJ':
		return 'Rio de Janeiro'
	elif state == 'RN':
		return 'Rio Grande do Norte'
	elif state == 'RS':
		return 'Rio Grande do Sul'
	elif state == 'RO':
		return 'Rondônia'
	elif state == 'RR':
		return 'Roraima'
	elif state == 'SC':
		return 'Santa Catarina'
	elif state == 'SP':
		return 'São Paulo'
	elif state == 'SE':
		return 'Sergipe'
	elif state == 'TO':
		return 'Tacantins'


@register.simple_tag
def get_dict_value(key, dictionary):
	return dictionary[key]


@register.inclusion_tag('dashboard_admin/value_creation_art.html')
def value_creation_art(service):
	
	if service.__class__.__name__ == 'ServiceImpress':
		context = {'value_creation_art': service.value_creation_art}
		return context


@register.inclusion_tag('dashboard_admin/edit_value_creation_art.html')
def edit_value_creation_art(service):
	
	if service.__class__.__name__ == 'ServiceImpress':
		context = {'value_creation_art': service.value_creation_art}
		return context
