from django.conf.urls import url, include
from django.contrib import admin
from django.urls import path
from rest_framework_jwt.views import obtain_jwt_token

urlpatterns = [
   url(r'^admin/', admin.site.urls),
   url(r'^rest-auth/', include('rest_auth.urls')),
   url(r'^rest-auth/registration/', include('rest_auth.registration.urls')),
   url(r'', include(('login.urls', 'login', ), namespace='login')),
   url(r'^api-token-auth/', obtain_jwt_token)
    #url(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework')),
   
]
