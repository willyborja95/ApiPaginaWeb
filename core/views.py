# Django imports
from django.views.decorators.csrf import csrf_exempt
# ? from django.shortcuts import render, get_object_or_404
# ? from django_filters.rest_framework import DjangoFilterBackend
# ? from django.contrib.auth.models import User as Users
# ? from django.http import StreamingHttpResponse
from django.views.generic.list import ListView
# ? from django.http import HttpResponse


# Rest_framework imports
from rest_framework.decorators import action, api_view, permission_classes
from rest_framework import generics, status
from rest_framework.viewsets import ModelViewSet
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import permissions
from rest_framework_simplejwt import authentication # Para que valide los tokens
from rest_framework.permissions import AllowAny, IsAuthenticatedOrReadOnly

# Local project imports
from core.models import (User,
                          Category,
                          Content,
                          Content_Media,
                          Event,
                          Group,
                          Group_Contact,
                          Group_Event,
                          Item_Category,
                          Menu_Item,
                          Person,
                          Person_Contact,
                          Person_Media,
                          Person_Role,
                          Person_Section,
                          Role,
                          Section,
                          Subject_Matter,
                          Requirement)

from core.serializers import (Category_Serializer,
                               Content_Media_Serializer,
                               Content_Serializer,
                               Event_Serializer,
                               Group_Contact_Serializer,
                               Group_Event_Serializer,
                               Group_Serializer,
                               Item_Category_Serializer,
                               Menu_Item_Serializer,
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
                               Category_Item_Category_Serializer,
                               User_Serializer,
                               User_Update_Serializer)
from login.permissions import IsSuperadmin


# Other imports
# ? from wsgiref.util import FileWrapper
# ? import mimetypes

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


class Category_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo Category
    """

    authentication_classes = [authentication.JWTAuthentication]
    permission_classes = [IsSuperadmin]


    queryset           = Category.objects.all()
    serializer_class   = Category_Serializer

    # def create():
    #     post_get_put_category(request, *args, **kwargs)


class Item_Category_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo Item_Category
    """

    authentication_classes = [authentication.JWTAuthentication]
    permission_classes = [IsSuperadmin]

    queryset = Item_Category.objects.all()
    serializer_class = Item_Category_Serializer


class Person_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo Person
    """

    authentication_classes = [authentication.JWTAuthentication]
    permission_classes = [IsSuperadmin]

    queryset = Person.objects.all()
    serializer_class = Person_Serializer


class Section_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo Section
    """

    authentication_classes = [authentication.JWTAuthentication]
    permission_classes = [IsSuperadmin]

    queryset = Section.objects.all()
    serializer_class = Section_Serializer


class Person_Section_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo Person_Section
    """

    authentication_classes = [authentication.JWTAuthentication]
    permission_classes = [IsSuperadmin]

    queryset = Person_Section.objects.all()
    serializer_class = Person_Section_Serializer


class Role_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo Role
    """

    authentication_classes = [authentication.JWTAuthentication]
    permission_classes = [IsSuperadmin]

    queryset = Role.objects.all()
    serializer_class = Role_Serializer


class Subject_Matter_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo de Subject_Matter
    """

    authentication_classes = [authentication.JWTAuthentication]
    permission_classes = [IsSuperadmin]

    queryset = Subject_Matter.objects.all()
    serializer_class = Subject_Matter_Serializer


class Person_Role_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo Person_Role
    """

    authentication_classes = [authentication.JWTAuthentication]
    permission_classes = [IsSuperadmin]

    queryset = Person_Role.objects.all()
    serializer_class = Person_Role_Serializer


class Person_Media_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo Person_Media
    """

    authentication_classes = [authentication.JWTAuthentication]
    permission_classes = [IsSuperadmin]

    queryset = Person_Media.objects.all()
    serializer_class = Person_Media_Serializer


class Person_Contact_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo Person_Contact
    """

    authentication_classes = [authentication.JWTAuthentication]
    permission_classes = [IsSuperadmin]

    queryset = Person_Contact.objects.all()
    serializer_class = Person_Contact_Serializer




class Requirement_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo Requirement
    """
    
    authentication_classes = [authentication.JWTAuthentication]
    permission_classes = [IsSuperadmin]

    queryset = Requirement.objects.all()
    serializer_class = Requirement_Serializer


class Content_Media_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo Content_Media
    """

    authentication_classes = [authentication.JWTAuthentication]
    permission_classes = [IsSuperadmin]

    queryset = Content_Media.objects.all()
    serializer_class = Content_Media_Serializer


class Event_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo Event
    """

    authentication_classes = [authentication.JWTAuthentication]
    permission_classes = [IsSuperadmin]

    queryset = Event.objects.all()
    serializer_class = Event_Serializer


class Menu_Item_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo Menu_Item
    """
    # ? Desportoeger
    authentication_classes = [authentication.JWTAuthentication]
    permission_classes = [IsAuthenticatedOrReadOnly]

    queryset = Menu_Item.objects.all()
    serializer_class = Menu_Item_Serializer


class Group_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo Group
    """

    authentication_classes = [authentication.JWTAuthentication]
    permission_classes = [IsSuperadmin]

    queryset = Group.objects.all()
    serializer_class = Group_Serializer


class Group_Contact_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo Group_Contact
    """

    authentication_classes = [authentication.JWTAuthentication]
    permission_classes = [IsSuperadmin]

    queryset = Group_Contact.objects.all()
    serializer_class = Group_Contact_Serializer


class Group_Event_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo Group_Event
    """

    authentication_classes = [authentication.JWTAuthentication]
    permission_classes = [IsSuperadmin]

    queryset = Group_Event.objects.all()
    serializer_class = Group_Event_Serializer


class Content_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo Group_Event
    """

    authentication_classes = [authentication.JWTAuthentication]
    permission_classes = [IsSuperadmin]

    queryset = Content.objects.all()
    serializer_class = Content_Serializer


class User_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo Group_Event
    """

    authentication_classes = [authentication.JWTAuthentication]
    permission_classes = [IsSuperadmin]

    queryset = User.objects.all()
    serializer_class = User_Serializer

    def get_serializer_class(self):
        if self.action == 'update':
            return User_Update_Serializer
        else:
            return User_Serializer

    #@action(detail=True, methods=['PUT']):



@csrf_exempt
@api_view(["POST"])
@permission_classes((permissions.AllowAny,))
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
@permission_classes((permissions.AllowAny,))
def usuario(request):
    if request.method == 'GET':
        users = models.Users.objects.all()
        serializer = serializers.RegistrationSerializer(users, many=True)
        return Response(serializer.data)



