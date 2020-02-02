# Django
from django.urls import path, include

# Rest framework imports
# ...

# Local project imports
from utils import views as utils_views
from utils.router import router as utils_router

# Other impoprts
# ...


urlpatterns = [

    path('university_career_authorities/<int:university_career_id>/', utils_views.request_university_career_authorities),


    path('', include(utils_router.urls)),


   
]


