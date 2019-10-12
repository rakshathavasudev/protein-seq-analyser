from django.shortcuts import render
from . import models
from . import forms

# Create your views here.
def predict(request):
    if request.method == 'POST':
        form = forms.ProteinSequenceForm(request.POST)
        if form.is_valid():
            form.save()
            return render(request, 'secstructpred/process.html')
    else:
        form = forms.ProteinSequenceForm
    return render(request, 'secstructpred/predict.html', {'form':form})