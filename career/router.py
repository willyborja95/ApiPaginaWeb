# Django imports

# Rest_framework imports
from rest_framework import routers

# Local imports
from core.views import (Section_Viewset)

router = routers.DefaultRouter()


router.register('section', Section_Viewset, basename='section_viewset')
