from django.urls import path
from . import views

app_name = 'dashboard_admin'


urlpatterns = [
	path('index', views.index, name='index'),
	path('nova_category', views.new_category, name='new_category'),
	# path('categoria/<int:id_category>', views.category, name='category'),
	path('categorias', views.all_categories, name='all_categories'),
	path('editar_categoria/<int:category_id>', views.edit_category,
		name='edit_category'),
	path('deletar_catagoria/<int:category_id>', views.delete_category,
		name='delete_category'),

	path('all_services', views.all_services, name='all_services'),
	# path('new_service', views.new_service, name='new_service'),
	path('novo_servico_arte', views.new_art_service, name='new_art_service'),
	path('detalhes/<int:service_id>', views.detail_service,
		name='detail_service'),
	path('edit_service/<int:service_id>', views.edit_service,
		name='edit_service'),
	path('deletar_servico/<int:service_id>', views.delete_service,
		name='delete_service'),
	path('delete_service/<int:service_id>', views.delete_srvice,
		name='delete_srvice'),

	path('novo_servico_impressao', views.new_impress_service,
		name='new_impress_service'),
]