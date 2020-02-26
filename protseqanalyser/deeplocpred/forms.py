from django import forms
from . import models

class DeepLocSubCellLocationForm(forms.ModelForm):
    class Meta:
        model = models.DeepLocSubCellLocation
        fields = ['sequence']
