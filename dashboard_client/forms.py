from django import forms


class OrderItemImpressForm(forms.Form):
	art = forms.FileField(required=False)
	observations = forms.CharField(widget=forms.Textarea, required=False)
	model = forms.FileField(required=False)
	image_example1 = forms.ImageField(required=False)
	image_example2 = forms.ImageField(required=False)
	image_example3 = forms.ImageField(required=False)
	image_example4 = forms.ImageField(required=False) 


class OrderItemArtForm(forms.Form):
	image = forms.ImageField(required=False)
	model = forms.FileField(label='Modelo', required=False)
	note = forms.CharField(widget=forms.Textarea, required=False)
	
		