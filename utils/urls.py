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
    path('', include(utils_router.urls)),
]


"""
Servicio de universityCareer (CRUD) en general (Category - ItemCategory)
universityCarrer = { Sistemas, Arquitectura}
Servicio de contactType (CRUD) en general (Category - ItemCategory)
contactType = { Email }
Servicio de menu (CRUD) en general
Servicio de typeContent (CRUD) en general (Category - ItemCategory)
typeContent = { Anuncio, Evento }
Servicio de academicPeriod (CRUD) en general (Category - ItemCategory)
Servicio de media_type (CRUD) en general (Category - ItemCategory)
media_type = { FotoPerfil, ImagenAnuncio, ImagenEvento }
"""
"""
universityCareer
contactType
menu
typeContent
academicPeriod
media_type
"""