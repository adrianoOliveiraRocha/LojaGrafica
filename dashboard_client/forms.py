from django import forms


class OrderItemImpressForm(forms.Form):
	art = forms.FileField()


class OrderItemArtForm(forms.Form):
	image = forms.ImageField(required=False)
	note = forms.CharField(widget=forms.Textarea, required=False)
	image_view = forms.ImageField(label='Imagem Para Aprovação', required=True)
		