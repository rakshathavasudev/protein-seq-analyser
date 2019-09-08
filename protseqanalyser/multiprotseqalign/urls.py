from . import views
from django.conf.urls import url
from . import views

app_name = 'multiprotseqalign'

urlpatterns = [
    url(r'^$', views.predict, name="predict"),
]
