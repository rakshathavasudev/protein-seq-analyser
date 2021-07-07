from django.contrib import admin
from django.conf.urls import url,include
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from . import views

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^multiprotseqalign/',include('multiprotseqalign.urls')),
    url(r'^secstructpred/',include('secstructpred.urls')),
    url(r'^secstructclasspred/',include('secstructclasspred.urls')),
    url(r'^foldrecog/',include('foldrecog.urls')),
    url(r'^subcelllocpred/',include('subcelllocpred.urls')),
    url(r'^deeplocpred/',include('deeplocpred.urls')),
    url(r'^$',views.home, name='home'),
    url(r'^team/$',views.teampage, name='teampage'),
]

urlpatterns += staticfiles_urlpatterns()