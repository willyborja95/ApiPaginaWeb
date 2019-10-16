from rest_framework.decorators import action, api_view, permission_classes
from rest_framework.permissions import AllowAny
from django.views.decorators.csrf import csrf_exempt
from django.shortcuts import render, get_object_or_404
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import viewsets, generics
from rest_framework.permissions import IsAuthenticated
from .models import *
from django.contrib.auth.models import User as Users
from .serializers import *
from .filters import *
import mimetypes
from wsgiref.util import FileWrapper
from django.http import StreamingHttpResponse

class Category(viewsets.ModelViewSet):
    queryset           = Category.objects.all()
    serializer_class   = CategorySerializer
    filter_fields      = ('idCategory','nameCategory','active')
    filter_class       = CategoryFilter
    filterset_fields   = ('nameCategory')

    def get_object(self):
            queryset = self.get_queryset()
            obj      = get_object_or_404(
                queryset,
                pk = self.kwargs['pk'],
            )
            return obj

class ItemCategory(viewsets.ModelViewSet):
    queryset           = ItemCategory.objects.all()
    serializer_class   = ItemCategorySerializer
    filter_fields      = ('idItemCategory','nameItemCategory','active','category')
    filter_class       = ItemCategoryFilter
    filterset_fields   = ('nameItemCategory','category')    
    def get_object(self):
            queryset = self.get_queryset()
            obj      = get_object_or_404(
                queryset,
                pk = self.kwargs['pk'],
            )
            return obj

class Persons(viewsets.ModelViewSet):
    queryset           = Persons.objects.all()
    serializer_class   = PersonsSerializer
    filter_fields      = ('person_id','first_name','second_name','first_last_name','second_last_name')
    def get_object(self):
            queryset = self.get_queryset()
            obj      = get_object_or_404(
                queryset,
                pk = self.kwargs['pk'],
            )
            return obj

class Persons_departaments(viewsets.ModelViewSet):
    queryset           = Persons_departaments.objects.all()
    serializer_class   = Persons_depaSerializer
    filter_fields      = ('persons_departaments_id','persons_id','item_category_id','first_last_name','universitycareer')
    def get_object(self):
            queryset = self.get_queryset()
            obj      = get_object_or_404(
                queryset,
                pk = self.kwargs['pk'],
            )
            return obj

class Persons_role(viewsets.ModelViewSet):
    queryset           = Persons_role.objects.all()
    serializer_class   = Persons_roleSerializer
    filter_fields      = ('persons_role_id','item_category_id','persons_id')
    def get_object(self):
            queryset = self.get_queryset()
            obj      = get_object_or_404(
                queryset,
                pk = self.kwargs['pk'],
            )
            return obj

class Persons_media(viewsets.ModelViewSet):
    queryset           = Persons_media.objects.all()
    serializer_class   = Persons_mediaSerializer
    filter_fields      = ('persons_media_id','path','item_category_id','persons_id')
    def get_object(self):
            queryset = self.get_queryset()
            obj      = get_object_or_404(
                queryset,
                pk = self.kwargs['pk'],
            )
            return obj

class Persons_Contacts(viewsets.ModelViewSet):
    queryset           = Persons_Contacts.objects.all()
    serializer_class   = Persons_ContactSerializer
    filter_fields      = ('contact_info_id','contact','item_category_id','persons_id')
    def get_object(self):
            queryset = self.get_queryset()
            obj      = get_object_or_404(
                queryset,
                pk = self.kwargs['pk'],
            )
            return obj

class Subject_matter(viewsets.ModelViewSet):
    queryset           = Subject_matter.objects.all()
    serializer_class   = Subject_matter_Serializer
    filter_fields      = ('subject_matter_id','name_subject_matter','universitycareer')
    def get_object(self):
            queryset = self.get_queryset()
            obj      = get_object_or_404(
                queryset,
                pk = self.kwargs['pk'],
            )
            return obj

class Pre_requirements(viewsets.ModelViewSet):
    queryset           = Pre_requirements.objects.all()
    serializer_class   = Pre_requirements_Serializer
    filter_fields      = ('pre_requirements_id','subject_matter_id_id','subject_matter_requeriment_id')
    def get_object(self):
            queryset = self.get_queryset()
            obj      = get_object_or_404(
                queryset,
                pk = self.kwargs['pk'],
            )
            return obj

class Info_site(viewsets.ModelViewSet):
    queryset           = Info_site.objects.all()
    serializer_class   = Info_site_Serializer
    filter_fields      = ('info_site_id','description','type_info','info_site_universitycareer')
    filter_class       = InfoSiteFilter
    filterset_fields   = ('type_info','info_site_universitycareer')    
    def get_object(self):
            queryset = self.get_queryset()
            obj      = get_object_or_404(
                queryset,
                pk = self.kwargs['pk'],
            )
            return obj

class Content(viewsets.ModelViewSet):
    queryset           = Content.objects.all()
    serializer_class   = Content_Serializer
    filter_fields      = ('content_id','title','description','update_time','create_time','type_event','academic_period','content_universitycareer')
    def get_object(self):
            queryset = self.get_queryset()
            obj      = get_object_or_404(
                queryset,
                pk = self.kwargs['pk'],
            )
            return obj

class Content_media(viewsets.ModelViewSet):
    queryset           = Content_media.objects.all()
    serializer_class   = Content_media_Serializer
    filter_fields      = ('content_media_id','path','item_category_item_category_id','content_content_id')
    def get_object(self):
            queryset = self.get_queryset()
            obj      = get_object_or_404(
                queryset,
                pk = self.kwargs['pk'],
            )
            return obj

class Content_info(viewsets.ModelViewSet):
    queryset           = Content_info.objects.all()
    serializer_class   = Content_info_Serializer
    filter_fields      = ('content_info_id','date','place','link_form','url','content_content_id')
    def get_object(self):
            queryset = self.get_queryset()
            obj      = get_object_or_404(
                queryset,
                pk = self.kwargs['pk'],
            )
            return obj

class Menu(viewsets.ModelViewSet):
    queryset           = Menu.objects.all().order_by('orden')
    serializer_class   = Menu_Serializer
    filter_fields      = ('menu_id','name','url','orden','item_category_item_category_id')
    def get_object(self):
            queryset = self.get_queryset()
            obj      = get_object_or_404(
                queryset,
                pk = self.kwargs['pk'],
            )
            return obj

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