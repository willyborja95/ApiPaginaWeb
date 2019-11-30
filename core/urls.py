# Rest framewkor
from rest_framework_jwt.views import refresh_jwt_token
from rest_framework_jwt.views import obtain_jwt_token

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
    
    
    path('<str:category>/', views.post_get_put_category),
    path('<str:category>/<str:item_category>/', views.get_put_delete_category_item_category),
    
    
]