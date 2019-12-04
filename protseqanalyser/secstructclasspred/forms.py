from django import forms
from . import models

class SecondaryStructureClassPredictionForm(forms.ModelForm):
    class Meta:
        model = models.SecondaryStructureClassPrediction
        fields = ['sequence']
