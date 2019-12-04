from django import forms
from . import models

class SecondaryStructurePredictionForm(forms.ModelForm):
    class Meta:
        model = models.SecondaryStructurePrediction
        fields = ['sequence']