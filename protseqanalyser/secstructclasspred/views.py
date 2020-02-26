from django.shortcuts import render, redirect, get_object_or_404
from django.http import HttpResponse, HttpResponseNotFound
from . import models
from . import forms
from json import loads

# Create your views here.
def predict(request):
    if request.method == 'POST':
        form = forms.SecondaryStructureClassPredictionForm(request.POST)
        if form.is_valid():
            obj = form.save()
            return redirect('secstructclasspred:result', id=obj.id)
    else:
        form = forms.SecondaryStructureClassPredictionForm
    return render(request, 'secstructclasspred/predict.html', {'form':form})

def result(request,id):
    try:
        id=int(id)
    except:
        message = 'Invalid link entered. Please check your URL again.'
        return render(request, 'secstructclasspred/message.html', {'message':message})
    try:
        obj = models.SecondaryStructureClassPrediction.objects.get(id=id)
    except:
        message = 'Requested object not found. Please check your URL again.'
        return render(request, 'secstructclasspred/message.html', {'message':message})
    if obj.completed:
        try:
            with open(f'/home/psa/VGST_Scripts/3-PSSCP/Results/{id}', 'r') as f:
                content = f.read().replace('\'','"')
                print('1',content)                
                content = loads(content)
                print('2',content)
        except:
            message = "Couldn't process your input. Please check your input sequence again."
            return render(request, 'secstructclasspred/message.html', {'message':message})  
        return render(request, 'secstructclasspred/result.html', {'result':content})    
    else:
        DOMAIN_NAME = 'localhost:8000'
        message = f'Your entered input sequence is still under process. Please come back later to the same url {DOMAIN_NAME}{request.get_full_path()}'
        return render(request, 'secstructclasspred/message.html', {'message':message})
