"""LojaGrafica URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from django.contrib.auth.views import login, logout
from django.conf.urls.static import static
from django.conf import settings
from . import views


urlpatterns = [
    path('admin/', admin.site.urls),
    path('tests/', views.tests, name='tests'),
    path('', include('core.urls')),
    path('conta/', include('accounts.urls'), name='accounts'),
    path('entrar/', login, {'template_name': 'core/login.html'}, name='login'),
    path('sair', logout, {'next_page': 'core:index'}, name='logout'),
    path('area_administrativa/', include('dashboard_admin.urls'), name='index'),
    path('area_do_cliente/', include('dashboard_client.urls'), name='index'),
    path('checkout/', include('checkout.urls'), name='finalize_payment'),
    path('obrigado/', views.thanks, name='thanks'),
    path('notification/', views.notification, name='notification')
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)