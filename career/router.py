# Django imports

# Rest_framework imports
from rest_framework import routers

# Local imports
from core.views import (
                         Person_Viewset, #s
                         Section_Viewset, # 
                         Person_Section_Viewset, #
                         Person_Role_Viewset, #
                         Person_Media_Viewset, #
                         Person_Contact_Viewset, #
                         Subject_Matter_Viewset, #
                         Requirement_Viewset, #
                         Content_Viewset, #
                         Content_Media_Viewset, #
                         Event_Viewset, #
                         Group_Viewset, #
                         Group_Contact_Viewset, #
                         Group_Event_Viewset, #
                         )

router = routers.DefaultRouter()


router.register('person', Person_Viewset, basename='person')
router.register('section', Section_Viewset, basename='section')
router.register('person_section', Person_Section_Viewset, basename='person_section')
router.register('person_role', Person_Role_Viewset, basename='person_role')
router.register('person_media', Person_Media_Viewset, basename='person_media')
router.register('person_contact', Person_Contact_Viewset, basename='person_contact')
router.register('subject_matter', Subject_Matter_Viewset, basename='subject_matter')
router.register('requirement', Requirement_Viewset, basename='requirement')
router.register('content', Content_Viewset, basename='content')
router.register('content_media', Content_Media_Viewset, basename='content_media')
router.register('event', Event_Viewset, basename='event')
router.register('group', Group_Viewset, basename='group')
router.register('group_contact', Group_Contact_Viewset, basename='group_contact')
router.register('group_event', Group_Event_Viewset, basename='group_event')
