from django.shortcuts import render
from django.http import HttpResponse
from . import models
from . import forms

# Create your views here.
def predict(request):
    if request.method == 'POST':
        form = forms.ProteinSequenceForm(request.POST)
        if form.is_valid():
            print("here")
            form.save()
            return render(request, 'foldrecog/process.html')
    else:
        form = forms.ProteinSequenceForm
    return render(request, 'foldrecog/predict.html', {'form':form})