from . import views
from django.conf.urls import url
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from . import views

app_name = 'secstructclasspred'

urlpatterns = [
    url(r'^$', views.predict, name="predict"),
]

urlpatterns += staticfiles_urlpatterns()