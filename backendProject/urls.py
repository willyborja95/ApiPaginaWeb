from django.conf.urls import url, include
from django.contrib import admin
from django.urls import path
from rest_framework_jwt.views import obtain_jwt_token
from rest_framework_simplejwt.views import (
    TokenObtainPairView,
    TokenRefreshView,
)

urlpatterns = [
    path('admin/', admin.site.urls),
    
    path('api/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    
    #path('rest-auth/', include('rest_auth.urls')),
    #path('rest-auth/registration/', include('rest_auth.registration.urls')),
    path('', include('login.urls')),

    #path('api-token-auth/', obtain_jwt_token),
    #url(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework')),
]