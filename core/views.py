from django.shortcuts import get_object_or_404, render
from django.http import HttpResponseRedirect, HttpResponse
from django.urls import reverse
from django.views.generic.base import TemplateView
# from django.views.generic import CreateView
# from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth import get_user_model
from django.urls import reverse_lazy
from django.core.paginator import Paginator
from .models import Category, Service 


User = get_user_model()

def index(request):
	categories = Category.objects.all()

	service_list = Service.objects.all()
	paginator = Paginator(service_list, 6)
	page = request.GET.get('page')
	services = paginator.get_page(page)

	label_category = 'TODAS AS CATEGORIAS'

	context = {
		'label_category': label_category,
		'categories': categories,
		'services': services,
		'paginator': paginator
	}
	return render(request, 'core/index.html', context)


def category(request, category_id):
	""" this view show the products of the one category """
	categories = Category.objects.all()
	
	service_list = Service.objects.filter(category__id=category_id)
	paginator = Paginator(service_list, 6)
	page = request.GET.get('page')
	services = paginator.get_page(page)

	label_category = str.upper(Category.objects.get(id=category_id).name)

	context = {
		'label_category': label_category,
		'categories': categories,
		'services': services,
		'paginator': paginator
	}
	return render(request, 'core/index.html', context)


class QuemSomosView(TemplateView):
	template_name = "core/quem_somos.html"

class ContatoView(TemplateView):
	template_name = "core/contato.html"



