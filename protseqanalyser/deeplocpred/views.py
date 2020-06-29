from django.shortcuts import render

# Create your views here.
from django.shortcuts import render, redirect, get_object_or_404
from django.http import HttpResponse, HttpResponseNotFound
from . import models
from . import forms
from json import loads
from requests import post

# Create your views here.
def predict(request):
    if request.method == 'POST':
        form = forms.DeepLocSubCellLocationForm(request.POST)
        if form.is_valid():
            recaptcha = request.POST.get('g-recaptcha-response')
            url = 'https://www.google.com/recaptcha/api/siteverify'
            payload = {
                # since no settings file, added for testing purpose
                'secret': '6LcrOasZAAAAAN5H88IsPI_NItWBYona40l33k78',
                'response': recaptcha
            }
            resp = post(url, data=payload)
            resp = loads(resp.content)
            if resp['success']:
                obj = form.save()
            else:
                message = 'Invalid captcha'
                return render(request, 'deeplocpred/message.html', {'message':message})

            # obj = form.save()
            return redirect('deeplocpred:result', id=obj.id)
    else:
        form = forms.DeepLocSubCellLocationForm
    return render(request, 'deeplocpred/predict.html', {'form':form})

def result(request,id):
    try:
        id=int(id)
    except:
        message = 'Invalid link entered. Please check your URL again.'
        return render(request, 'deeplocpred/message.html', {'message':message})
    try:
        obj = models.DeepLocSubCellLocation.objects.get(id=id)
    except:
        message = 'Requested object not found. Please check your URL again.'
        return render(request, 'deeplocpred/message.html', {'message':message})
    if obj.completed:
        try:
            with open(f'/home/psa/VGST_Scripts/5-PSCP-Deep/Results/{id}', 'r') as f:   # Change the path when editing
                content = f.read().replace('\'','"')
                print('1',content)                
                content = loads(content)
                print('2',content)
        except:
            message = "Couldn't process your input. Please check your input sequence again."
            return render(request, 'deeplocpred/message.html', {'message':message})  
        return render(request, 'deeplocpred/result.html', {'result':content})    
    else:
        DOMAIN_NAME = 'http://nitkit-vgst727-nppsa.nitk.ac.in'
        message = f'Your entered input sequence is still under process. Please come back later to the same url {DOMAIN_NAME}{request.get_full_path()}'
        return render(request, 'deeplocpred/message.html', {'message':message})
