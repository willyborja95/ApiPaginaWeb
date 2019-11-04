from django.urls import path, include
from . import views
from rest_framework import routers
from rest_framework_jwt.views import refresh_jwt_token
from rest_framework_jwt.views import obtain_jwt_token
from django.conf.urls.static import static
from django.conf import settings

router = routers.DefaultRouter()
#router.register('login', views.login, name="login")
#router.register('usuario', views.usuario)
router.register('category', views.Category)
router.register('itemcategory', views.ItemCategory)
router.register('persons', views.Persons)
router.register('personsDepartments', views.Persons_departaments)
router.register('personsRole', views.Persons_role)
router.register('personsMedia', views.Persons_media)
router.register('personsContact', views.Persons_Contacts)
router.register('subjectMatter', views.Subject_matter)
router.register('preRequirements', views.Pre_requirements)
router.register('infoSite', views.Info_site)
router.register('content', views.Content)
router.register('contentMedia', views.Content_media)
router.register('contentInfo', views.Content_info)
router.register('menu', views.Menu)

urlpatterns = [
    path('', include(router.urls)),
    path('rest-auth/', include('rest_auth.urls')),
    path('rest-auth/registration/', include('rest_auth.registration.urls')),
    path('api-token-auth/', obtain_jwt_token),
    path('refresh-token/', refresh_jwt_token),
    ]