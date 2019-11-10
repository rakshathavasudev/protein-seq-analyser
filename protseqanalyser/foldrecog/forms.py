from django import forms
from . import models

class FoldRecognitionForm(forms.ModelForm):
    class Meta:
        model = models.FoldRecognition
        fields = ['sequence']