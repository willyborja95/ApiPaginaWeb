# Django
from django.urls import path, include

# Rest framewkor imports
# ...

# Local project imports
from career import views
from career.router import router


# Other impoprts
# ...


urlpatterns = [


    path('', include(router.urls)),

    # Rutas de los servicios especializados para coordinador
    path('<str:category>/', views.post_get_put_category),
    path('<str:category>/<str:item_category>/', views.get_put_delete_category_item_category),


]
