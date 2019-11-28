# Rest framewkor
from rest_framework_jwt.views import refresh_jwt_token
from rest_framework_jwt.views import obtain_jwt_token
from rest_framework_simplejwt.views import (
    TokenRefreshView,
)

# Django
from django.conf.urls.static import static
from django.conf import settings
from django.urls import path, include

# Local project
from login.router import router
from login import views




# Others

urlpatterns = [
    path('', include(router.urls)),
    path('<str:name>',views.titulacionView.as_view()),
    
    path('api/token/', views.CustomTokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('api/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    
    path('<str:category>/', views.post_get_put_category),
    path('<str:category>/<str:item_category>/', views.get_put_delete_category_item_category),
    
    
]

    # path('rest-auth/', include('rest_auth.urls')),
    # path('rest-auth/registration/', include('rest_auth.registration.urls')),
    # path('api-token-auth/', obtain_jwt_token),
    # path('refresh-token/', refresh_jwt_token),
    # path('titulacion/<int:idCat>',views.titulacionAPIView.as_view()),
    # path('secciones/<int:idSec>',views.sectionAPView),
    # path('quienes_somos/<int:idAbout>',views.aboutAPIView.as_view()),
    # path('<name:nameCategory', views.about,