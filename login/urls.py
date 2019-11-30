# Django imports
from django.conf.urls.static import static
from django.conf import settings
from django.urls import path, include


# Rest framework imports
from rest_framework_jwt.views import refresh_jwt_token
from rest_framework_jwt.views import obtain_jwt_token
from rest_framework_simplejwt.views import (
    TokenRefreshView,
)


# Local project imports
from login import views


# Other imports
# ...


# URLs del login
urlpatterns = [

    path('api/token/', views.CustomTokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('api/refresh_token/', TokenRefreshView.as_view(), name='token_refresh'),

]
