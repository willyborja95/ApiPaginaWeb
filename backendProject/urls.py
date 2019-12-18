# Django importaciones
from django.conf.urls import url, include
from django.contrib import admin
from django.urls import path

# Rest_framework importaciones
from rest_framework_jwt.views import obtain_jwt_token


urlpatterns = [
    path('admin/', admin.site.urls),        # El admin no debe ir bajo otra url
    path('api/login/', include('login.urls')),    # Inlcuimos las urls de la app login
    path('api/career/', include('career.urls')),  # Incluimos las urls de la app career
    path('api/', include('core.urls')),     # Inlcuimos las urls de la app core (Servicios de superadmin)
    

]