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
    path('find_item_category/', utils_views.find_item_category),
    
    path('welcome_message/', utils_views.welcome_message),
    path('university_career_sections/', utils_views.university_career_sections),


    path('', include(utils_router.urls)),


   
]


