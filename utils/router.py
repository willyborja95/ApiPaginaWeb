# Django imports

# Rest_framework imports
from rest_framework import routers

# Local imports
from utils.views import (University_Career_Viewset,
                        Contact_Type_Viewset,
                        Menu_Item_Viewset,
                        Type_Content_Viewset,
                        Academic_Period_Viewset,
                        Media_Type_Viewset,
                        Testimonials_Viewset,
                        News_Viewset)



router = routers.DefaultRouter()


router.register('university_career', University_Career_Viewset, basename='university_career')
router.register('contact_type', Contact_Type_Viewset, basename='contact_type')
router.register('menu_item', Menu_Item_Viewset, basename='menu_item')
router.register('type_content', Type_Content_Viewset, basename='type_content')
router.register('academic_period', Academic_Period_Viewset, basename='academic_period')
router.register('media_type', Media_Type_Viewset, basename='media_type')

router.register('testimonials', Testimonials_Viewset, basename='testimonials')
router.register('news', News_Viewset, basename='news')







