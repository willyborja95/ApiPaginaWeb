# Django imports

# Rest_framework imports
from rest_framework import routers

# Local imports
from core.views import (Category_Viewset,
                         Item_Category_Viewset,
                         Person_Viewset,
                         Section_Viewset,
                         Person_Section_Viewset,
                         Role_Viewset,
                         Person_Role_Viewset,
                         Person_Media_Viewset,
                         Person_Contact_Viewset,
                         Subject_Matter_Viewset,
                         Requirement_Viewset,
                         Content_Viewset,
                         Content_Media_Viewset,
                         Event_Viewset,
                         Menu_Viewset,
                         Group_Viewset,
                         Group_Contact_Viewset,
                         Group_Event_Viewset
                         )

router = routers.DefaultRouter()

router.register('category', Category_Viewset)
router.register('item_category', Item_Category_Viewset)
router.register('person', Person_Viewset)
router.register('section', Section_Viewset)
router.register('person_section', Person_Section_Viewset)
router.register('role', Role_Viewset)
router.register('person_role', Person_Role_Viewset)
router.register('person_media', Person_Media_Viewset)
router.register('person_contact', Person_Contact_Viewset)
router.register('subject_matter', Subject_Matter_Viewset)
router.register('requirement', Requirement_Viewset)
router.register('content', Content_Viewset)
router.register('content_media', Content_Media_Viewset)
router.register('event', Event_Viewset)
router.register('menu', Menu_Viewset)
router.register('group', Group_Viewset)
router.register('group_contact', Group_Contact_Viewset)
router.register('group_event', Group_Event_Viewset)
