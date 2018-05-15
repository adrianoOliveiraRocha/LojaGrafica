from django import forms
from .models import Category, Service


class CategoryForm(forms.ModelForm):
	class Meta:
		model = Category
		fields = ['name']


class ServiceForm(forms.Form):
	description = forms.CharField(widget=forms.Textarea)
	image = forms.ImageField(required=False)
	# category = forms.ChoiceField(choices=Category.create_choices_category())
	value = forms.CharField()
	value_creation_art = forms.CharField(label='Valor para criação de arte',
		required=False)
