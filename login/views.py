# Rest_framework
from rest_framework.decorators import action, api_view, permission_classes
from rest_framework.permissions import AllowAny
from rest_framework import generics
from rest_framework.permissions import IsAuthenticated
from rest_framework.viewsets import ModelViewSet

# Django
from django.views.decorators.csrf import csrf_exempt
from django.shortcuts import render, get_object_or_404
from django_filters.rest_framework import DjangoFilterBackend
from django.contrib.auth.models import User as Users
from django.http import StreamingHttpResponse
from django.views.generic.list import ListView
from django.http import HttpResponse

# Local project
from login.models import (Users, 
                          Category, 
                          Content, 
                          Content_Media, 
                          Event, 
                          Group, 
                          Group_Contact, 
                          Group_Event, 
                          Info_Site, 
                          Item_Category, 
                          Menu, 
                          Person, 
                          Person_Contact, 
                          Person_Media, 
                          Person_Role, 
                          Person_Section, 
                          Role, 
                          Section, 
                          Site, 
                          Subject_Matter, 
                          Requirement)

from login.serializers import (Category_Serializer, 
                               Content_Media_Serializer, 
                               Content_Serializer,
                               Event_Serializer, 
                               Group_Contact_Serializer, 
                               Group_Event_Serializer, 
                               Group_Serializer, 
                               Info_Site_Serializer, 
                               Item_Category_Serializer, 
                               Menu_Serializer, 
                               Person_Contact_Serializer, 
                               Person_Media_Serializer, 
                               Person_Role_Serializer, 
                               Person_Section_Serializer, 
                               Person_Serializer, 
                               RegisterSerializer, 
                               RegistrationSerializer, 
                               Requirement_Serializer, 
                               Role_Serializer, 
                               Section_Serializer,
                               Site_Serializer, 
                               Subject_Matter_Serializer)


# Others
from wsgiref.util import FileWrapper
import mimetypes



def vista1(request):
    cat = Item_Category.objects.all()
    print(cat)
    
    #print(cat)
    #diccionario = {'Hola':'mundo'}
    return HttpResponse("cat")

#Vistas de servicios
class titulacionView(generics.ListAPIView):
    serializer_class = Item_Category_Serializer
    def get_queryset(self):
        #print (self.kwargs)
        print (self.kwargs["idCat"])
        idCat = self.kwargs["idCat"]
        #cat = Category.objects.all()
        #print(cat)
        tit = Category.objects.get(idCategory=idCat)
        querySet = Item_Category.objects.filter(category=tit)
        return querySet
        #serializer = ItemCategorySerializer
        #return Response(serializer.data, status=status.HTTP_200_OK)

class sectionAPIView(ListView):
    def get(self, request, idSec):
        seccion = Category.objects.get(idCategory=idSec)
        secciones = Item_Category.objects.filter(category=seccion)
        location_serializer = Item_Category_Serializer(secciones, many=True)

        return Response({
            'secciones': location_serializer.data
        })

class aboutAPIView(ListView):
    def get(self, request, idAbout):
        quienesSomos = Item_Category.objects.get(idItemCategory=idAbout)
        quienesSomosF = Info_site.objects.filter(type_info=quienesSomosObj)
        location_serializer = Item_Category_Serializer(quienesSomosF, many=True)

        return Response({
            'about': location_serializer.data
        })


class Item_Category_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo Item_Category
    """
    queryset = Item_Category.objects.all()
    serializer_class = Item_Category_Serializer


class Category_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo Category
    """
    queryset           = Category.objects.all()
    serializer_class   = Category_Serializer


class Person_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo Person
    """
    queryset = Person.objects.all()
    serializer_class = Person_Serializer


class Section_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo Section
    """
    queryset = Section.objects.all()
    serializer_class = Section_Serializer
    
    
class Person_Section_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo Person_Section
    """
    queryset = Person_Section.objects.all()
    serializer_class = Person_Section_Serializer


class Role_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo Role
    """
    queryset = Role.objects.all()
    serializer_class = Role_Serializer


class Subject_Matter_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo de Subject_Matter
    """
    queryset = Subject_Matter.objects.all()
    serializer_class = Subject_Matter_Serializer
    

class Person_Role_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo Person_Role
    """
    queryset = Person_Role.objects.all()
    serializer_class = Person_Role_Serializer


class Person_Media_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo Person_Media
    """
    queryset = Person_Media.objects.all()
    serializer_class = Person_Media_Serializer
    
    
class Person_Contact_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo Person_Contact
    """
    queryset = Person_Contact.objects.all()
    serializer_class = Person_Contact_Serializer


class Person_Contact_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo Person_Contact
    """
    queryset = Person_Contact.objects.all()
    serializer_class = Person_Contact_Serializer


class Requirement_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo Requirement
    """
    queryset = Requirement.objects.all()
    serializer_class = Requirement_Serializer
    

class Info_Site_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo Info_Site
    """
    queryset = Info_Site.objects.all()
    serializer_class = Info_Site_Serializer
    
    
class Site_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo Site
    """
    queryset = Site.objects.all()
    serializer_class = Site_Serializer
    

class Site_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo Site
    """
    queryset = Site.objects.all()
    serializer_class = Site_Serializer


class Content_Media_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo Content_Media
    """
    queryset = Content_Media.objects.all()
    serializer_class = Content_Media_Serializer
     
     
class Event_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo Event
    """
    queryset = Event.objects.all()
    serializer_class = Event_Serializer
    
    
class Menu_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo Menu
    """
    queryset = Menu.objects.all()
    serializer_class = Menu_Serializer
    
    
class Group_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo Group
    """
    queryset = Group.objects.all()
    serializer_class = Group_Serializer
    
    
class Group_Contact_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo Group_Contact
    """
    queryset = Group_Contact.objects.all()
    serializer_class = Group_Contact_Serializer
    
    
class Group_Event_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo Group_Event
    """
    queryset = Group_Event.objects.all()
    serializer_class = Group_Event_Serializer
    

class Content_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo Group_Event
    """
    queryset = Content.objects.all()
    serializer_class = Content_Serializer
    

    


















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