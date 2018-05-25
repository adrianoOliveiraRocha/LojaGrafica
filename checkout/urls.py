from django.urls import path
from . import views

app_name = 'checkout'

urlpatterns = [
	path('finalizar_pagamento/<int:order_id>', views.finalize_payment,
		name='finalize_payment'),
]