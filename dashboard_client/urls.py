from django.urls import path
from . import views

app_name = 'dashboard_client'
urlpatterns = [
    path('', views.index, name='index'),
    path('colocar_no_carrinho/<int:service_id>', views.insert_cart, 
    	name='insert_cart'),
    
]