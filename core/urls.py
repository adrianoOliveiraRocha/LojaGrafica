from django.urls import path
from . import views

app_name = 'core'
urlpatterns = [
    path('', views.index, name='index'),
    path('quemsomos', views.QuemSomosView.as_view(), name='quemsomos'),
    path('contato', views.ContatoView.as_view(), name='contato'),
]