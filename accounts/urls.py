from django.urls import include, path
from django.contrib.auth.views import login, logout
from . import views 

app_name = 'accounts'

urlpatterns = [
	path('registro', views.RegisterView.as_view(), name='register'),
	
]