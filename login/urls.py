from django.urls import path
from . import views
from rest_framework import routers
from rest_framework_jwt.views import refresh_jwt_token
from rest_framework_jwt.views import obtain_jwt_token
from django.conf.urls.static import static
from django.conf import settings


urlpatterns = [
    path('', views.vista1, name="vista1"),
    path('titulacion/<int:idCat>',views.titulacionView.as_view()),
]