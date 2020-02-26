from django.shortcuts import render
from django.http import HttpResponse
from visitor.models import Visitors
from django.db.models import F

# Create your views here.
def home(request):

        request.session.set_expiry(0) #Session ends when the browser is closed
        try:
                visitor = Visitors.objects.get(id=0)
        except:
                visitor = Visitors(id=0)
                visitor.save()

        if request.session.get('has_visited') == None:
                visitor.visitor_count = F('visitor_count') + 1
                request.session['has_visited'] = True
                visitor.save()

        context = {"visitors": visitor.visitor_count}
        return render(request,'home.html',context)
