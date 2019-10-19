from . import views
from django.conf.urls import url
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from . import views

app_name = 'multiprotseqalign'

urlpatterns = [
    url(r'^$', views.predict, name="predict"),
    url(r'^result/(?P<id>[\w-]+)/$', views.result, name="result"),
]

urlpatterns += staticfiles_urlpatterns()