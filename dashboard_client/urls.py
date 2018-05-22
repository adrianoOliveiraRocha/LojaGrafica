from django.urls import path
from . import views

app_name = 'dashboard_client'
urlpatterns = [
    path('', views.index, name='index'),
    path('index_art', views.index_art, name='index_art'),
    path('colocar_no_carrinho/<int:service_id>', views.insert_cart, 
    	name='insert_cart'),
    path('deletar_pedido_impressao/<int:oii_id>', views.delete_oii, name='delete_oii'),
    path('cancelar_pedido_impressao<int:oi_id>', views.cancel_orderImpress,
    	name='cancel_orderImpress'),
    path('enviar_logo/<int:item_id>', views.send_logo, name='send_logo'),
    path('delivery/<int:order_id>/<int:opt>', views.delivery,
    	name='delivery'),
    path('salvar_dendereco_de_entrega', views.save_address_delivery, 
    	name='save_address_delivery'),
    
    path('enviar_imagem1/<int:oia_id>', views.send_imageexample1,
        name='send_imageexample1'),
    path('enviar_imagem2/<int:oia_id>', views.send_imageexample2,
        name='send_imageexample2'),
    path('enviar_imagem3/<int:oia_id>', views.send_imageexample3,
        name='send_imageexample3'),
    path('enviar_imagem4/<int:oia_id>', views.send_imageexample4,
        name='send_imageexample4'),
]