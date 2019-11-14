# Rest_framework
from rest_framework.decorators import action, api_view, permission_classes
from rest_framework.permissions import AllowAny
from rest_framework import viewsets, generics
from rest_framework.permissions import IsAuthenticated


# Django
from django.views.decorators.csrf import csrf_exempt
from django.shortcuts import render, get_object_or_404
from django_filters.rest_framework import DjangoFilterBackend
from django.contrib.auth.models import User as Users
from django.http import StreamingHttpResponse
from django.views.generic.list import ListView
from django.http import HttpResponse

# Local project
from login.models import ItemCategory, Category, Content, Content_info, Content_media, Event, Group, Group_contact, Info_site, ItemCategory, Menu, Persons, Persons_departaments, Persons_role, Persons_media, Persons_Contacts, Subject_matter, Pre_requirements
from login import serializers


# Others
from wsgiref.util import FileWrapper
import mimetypes



def vista1(request):
    cat = ItemCategory.objects.all()
    print(cat)
    
    #print(cat)
    #diccionario = {'Hola':'mundo'}
    return HttpResponse("cat")

#Vistas de servicios
class titulacionView(generics.ListAPIView):
    serializer_class = serializers.ItemCategorySerializer
    def get_queryset(self):
        #print (self.kwargs)
        print (self.kwargs["idCat"])
        idCat = self.kwargs["idCat"]
        #cat = Category.objects.all()
        #print(cat)
        tit = Category.objects.get(idCategory=idCat)
        querySet = ItemCategory.objects.filter(category=tit)
        return querySet
        #serializer = ItemCategorySerializer
        #return Response(serializer.data, status=status.HTTP_200_OK)

class sectionAPIView(ListView):
    def get(self, request, idSec):
        seccion = Category.objects.get(idCategory=idSec)
        secciones = ItemCategory.objects.filter(category=seccion)
        location_serializer = ItemCategorySerializer(secciones, many=True)

        return Response({
            'secciones': location_serializer.data
        })

class aboutAPIView(ListView):
    def get(self, request, idAbout):
        quienesSomos = ItemCategory.objects.get(idItemCategory=idAbout)
        quienesSomosF = Info_site.objects.filter(type_info=quienesSomosObj)
        location_serializer = ItemCategorySerializer(quienesSomosF, many=True)

        return Response({
            'about': location_serializer.data
        })

class CategoryViewset(viewsets.ModelViewSet):
    queryset           = Category.objects.all()
    serializer_class   = serializers.CategorySerializer


class ItemCategoryViewset(viewsets.ModelViewSet):

    queryset           = ItemCategory.objects.all()
    serializer_class   = serializers.ItemCategorySerializer


class PersonsViewset(viewsets.ModelViewSet):
    queryset           = Persons.objects.all()
    serializer_class   = serializers.PersonsSerializer


class Persons_departamentsViewset(viewsets.ModelViewSet):
    queryset           = Persons_departaments.objects.all()
    serializer_class   = serializers.Persons_depaSerializer


class Persons_roleViewset(viewsets.ModelViewSet):
    queryset           = Persons_role.objects.all()
    serializer_class   = serializers.Persons_roleSerializer


class Persons_mediaViewset(viewsets.ModelViewSet):
    queryset           = Persons_media.objects.all()
    serializer_class   = serializers.Persons_mediaSerializer


class Persons_ContactsViewset(viewsets.ModelViewSet):
    queryset           = Persons_Contacts.objects.all()
    serializer_class   = serializers.Persons_ContactSerializer


class Subject_matterViewset(viewsets.ModelViewSet):
    queryset           = Subject_matter.objects.all()
    serializer_class   = serializers.Subject_matter_Serializer


class Pre_requirementsViewset(viewsets.ModelViewSet):
    queryset           = Pre_requirements.objects.all()
    serializer_class   = serializers.Pre_requirements_Serializer


class Info_siteViewset(viewsets.ModelViewSet):
    queryset           = Info_site.objects.all()
    serializer_class   = serializers.Info_site_Serializer


class ContentViewset(viewsets.ModelViewSet):
    queryset           = Content.objects.all()
    serializer_class   = serializers.Content_Serializer


class Content_mediaViewset(viewsets.ModelViewSet):
    queryset           = Content_media.objects.all()
    serializer_class   = serializers.Content_media_Serializer


class Content_infoViewset(viewsets.ModelViewSet):
    queryset           = Content_info.objects.all()
    serializer_class   = serializers.Content_info_Serializer


class MenuViewset(viewsets.ModelViewSet):
    queryset           = Menu.objects.all().order_by('orden')
    serializer_class   = serializers.Menu_Serializer



@csrf_exempt
@api_view(["POST"])
@permission_classes((AllowAny,))
def login(request):
    username = request.data.get("username")
    password = request.data.get("password")
    if username is None or password is None:
        return Response({'error': 'Please provide both username and password'}, status=HTTP_400_BAD_REQUEST)
    user = authenticate(username=username, password=password)
    if not user:
        return Response({'error': 'Invalid Credentials'}, status=HTTP_404_NOT_FOUND)
    token, _ = Token.objects.get_or_create(user=user)
    return Response({'token': token.key}, status=HTTP_200_OK)

@csrf_exempt
@api_view(["GET"])
@permission_classes((AllowAny,))
def usuario(request):
    if request.method == 'GET':
        users = models.Users.objects.all()
        serializer = serializers.RegistrationSerializer(users, many=True)
        return Response(serializer.data)