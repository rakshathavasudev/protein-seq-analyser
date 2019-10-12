from django.contrib import admin
from django.conf.urls import url,include
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from . import views

urlpatterns = [
    url('admin/', admin.site.urls),
    url('multiprotseqalign/',include('multiprotseqalign.urls')),
    url('secstructpred/',include('secstructpred.urls')),
    url('secstructclasspred/',include('secstructclasspred.urls')),
    url('foldrecog/',include('foldrecog.urls')),
    url('subcelllocpred/',include('subcelllocpred.urls')),
    url(r'$',views.home, name='home'),
]

urlpatterns += staticfiles_urlpatterns()