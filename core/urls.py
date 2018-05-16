from django.urls import path
from . import views

app_name = 'core'
urlpatterns = [
    path('', views.index, name='index'),
    path('categoria/<int:category_id>', views.category, name='category'),
    path('quemsomos', views.QuemSomosView.as_view(), name='quemsomos'),
    path('contato', views.ContatoView.as_view(), name='contato'),
]