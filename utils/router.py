# Django imports

# Rest_framework imports
from rest_framework import routers

# Local imports
from utils.views import (University_Career_Viewset)



router = routers.DefaultRouter()


router.register('university_career', University_Career_Viewset, basename='university_career')

