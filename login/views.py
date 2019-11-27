# Rest_framework
from rest_framework.decorators import action, api_view, permission_classes
from rest_framework.permissions import AllowAny
from rest_framework import generics, status
from rest_framework.permissions import IsAuthenticated, AllowAny, IsAdminUser, IsAuthenticatedOrReadOnly
from rest_framework.viewsets import ModelViewSet
from rest_framework.response import Response
from rest_framework_simplejwt.authentication import JWTTokenUserAuthentication

# Django
from django.views.decorators.csrf import csrf_exempt
from django.shortcuts import render, get_object_or_404
from django_filters.rest_framework import DjangoFilterBackend
from django.contrib.auth.models import User as Users
from django.http import StreamingHttpResponse
from django.views.generic.list import ListView
from django.http import HttpResponse


# Local project
from login.models import (User,
                          Category,
                          Content,
                          Content_Media,
                          Event,
                          Group,
                          Group_Contact,
                          Group_Event,
                          Item_Category,
                          Menu,
                          Person,
                          Person_Contact,
                          Person_Media,
                          Person_Role,
                          Person_Section,
                          Role,
                          Section,
                          Subject_Matter,
                          Requirement)

from login.serializers import (Category_Serializer,
                               Content_Media_Serializer,
                               Content_Serializer,
                               Event_Serializer,
                               Group_Contact_Serializer,
                               Group_Event_Serializer,
                               Group_Serializer,
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
                               Subject_Matter_Serializer,
                               Category_Item_Category_Serializer)


# Others
from wsgiref.util import FileWrapper
import mimetypes

#Vistas de servicios
class titulacionView(generics.ListAPIView):
    """
    Creación de un GET para obtener titulaciones
    """
    serializer_class = Item_Category_Serializer
    def get_queryset(self):
        category = self.kwargs["name"]
        tit = Category.objects.get(name=category)
        querySet = Item_Category.objects.filter(category_id=tit)
        return querySet


class titulacionView(generics.ListAPIView):
    """
    Creación de un GET para obtener quienes somos
    """
    serializer_class = Item_Category_Serializer
    def get_queryset(self):
        category = self.kwargs["name"]
        tit = Category.objects.get(name=category)
        querySet = Item_Category.objects.filter(category_id=tit)
        return querySet
#vistas de modelos

class Category_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo Category
    """

    authentication_classes = [JWTTokenUserAuthentication]
    permission_classes = [AllowAny]


    queryset           = Category.objects.all()
    serializer_class   = Category_Serializer

    # def create():
    #     post_get_put_category(request, *args, **kwargs)


class Item_Category_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo Item_Category
    """
    queryset = Item_Category.objects.all()
    serializer_class = Item_Category_Serializer


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

# Todo: Nuevos servicios especiales
# Todo: Revisasr requerimientos en
# Todo: https://docs.google.com/document/d/1IiG_CNBphDfpb6rUOB2aWbkNQ8svdVebe-cin1Mvs_4/edit



# * Servicio de Servicio de universityCareer (CRUD) en general (Category - ItemCategory)   # CRUD = POST GET PUT DELETE
@api_view(["GET","POST", "PUT", "DELETE"])
def post_get_put_category(request, category):

    if request.method == 'GET':
        respective_category_id = Category.objects.get(name=category).category_id
        queryset = Item_Category.objects.filter(category_id=respective_category_id)
        serializer = Item_Category_Serializer(queryset, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)

    if request.method == 'POST':
        respective_category_id = Category.objects.get(name=category).category_id
        serializer = Category_Item_Category_Serializer(data=request.data, category_id=respective_category_id)
        if serializer.is_valid():
            instance = serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


    if request.method == 'DELETE':  # ? Este método borra toda la categoria y lo asociado con ella
        # respective_category_id = Category.objects.get(name=category).category_id
        queryset = Category.objects.get(name=category)
        queryset.delete()
        return Response({"message": "Deleted. The URL /"+category+"/ Do not exists any more"}, status=status.HTTP_202_ACCEPTED)


@api_view(["GET","PUT", "DELETE"])
def get_put_delete_category_item_category(request, category, item_category):


    if request.method == 'GET':
        queryset = Item_Category.objects.get(name=item_category)
        serializer = Item_Category_Serializer(queryset)
        return Response(serializer.data, status=status.HTTP_200_OK)


    if request.method == 'PUT':
        queryset = Item_Category.objects.get(name=item_category)
        serializer = Item_Category_Serializer(data=request.data)
        if serializer.is_valid():
            serializer.update(instance=queryset, validate_data=serializer.data)
            return Response(serializer.data, status=status.HTTP_200_OK)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


    if request.method == 'DELETE': # ? Este método borra todo lo asociado con el item category
        respective_category_id = Category.objects.get(name=category).category_id
        queryset = Item_Category.objects.get(name=item_category)
        # serializer = Item_Category_Serializer(queryset)
        print(queryset.category_id)
        print(respective_category_id)
        if queryset.category_id == respective_category_id:
            # Eliminar
            return Response(serializer.data, status=status.HTTP_202_ACCEPTED)
        else:
            # No eliminar
            return Response({"message": "Not allowes"}, status=status.HTTP_401_UNAUTHORIZED)

