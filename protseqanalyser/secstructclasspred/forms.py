from django import forms
from . import models

class ProteinSequenceForm(forms.ModelForm):
    class Meta:
        model = models.ProteinSequence
        fields = ['sequence']