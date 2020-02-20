from django.shortcuts import render
from django.http import HttpResponse

# Create your views here.
def home(request):

        request.session.set_expiry(0) #Session ends when the browser is closed
        try:
                visitor = Visitors.objects.filter(id=1)
        except:
                visitor = Visitors()
                visitor.save()

        if request.session.get('has_visited') == None:
                visitors.visitor_count+=1
                request.session['has_visited'] = True

        context = {"visitors": visitors.visitor_count}
        return render(request,'home.html',context)
