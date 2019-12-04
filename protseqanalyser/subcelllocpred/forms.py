from django import forms
from . import models

class SubCellLocationForm(forms.ModelForm):
    class Meta:
        model = models.SubCellLocation
        fields = ['sequence']
