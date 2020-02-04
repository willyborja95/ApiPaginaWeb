# Django imports
# ...

# Rest_framework imports
from rest_framework.decorators import action, api_view, permission_classes
from rest_framework import generics, status
from rest_framework.viewsets import ModelViewSet
from rest_framework.response import Response
from rest_framework import permissions
from rest_framework_simplejwt import authentication # Para que valide los tokens

# Local project imports
from core.models import (Category,
                        Item_Category,
                        Section,
                        Person_Section,
                        Person,
                        Person_Contact,
                        Person_Media,
                        Person_Role,
                        Role,
                        Content)

# Serializadores
from utils.serializers import (University_Career_Serializer, 
                            Contact_Type_Serializer,
                            Menu_Serializer,
                            Type_Content_Serializer,
                            Academic_Period_Serializer,
                            Media_Type_Serializer,
                            Detailed_Person_Serializer)
from core.serializers import (Item_Category_Serializer,
                            Content_Serializer)


from login.permissions import IsSuperadmin, IsCoordinator, IsRespectiveCoordinator



# * Views
class University_Career_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo Item_Category, siempre y cuando estos spertenezcan a la categoria de university_career
    """

    def get_queryset(self):
        category_name = 'Titulación'
        try:
            category_id = Category.objects.get(name=category_name).category_id
            final_queryset =  Item_Category.objects.filter(category_id=category_id)
            return final_queryset
        except:
            error_message = ('Category with name %s not found' %(category_name))
            print(error_message)
            return None

    #authentication_classes = [authentication.JWTAuthentication]
    #permission_classes = [IsRespectiveCoordinator]

    serializer_class = University_Career_Serializer


class Contact_Type_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo Item_Category, siempre y cuando estos spertenezcan a la categoria de contact_type
    """

    def get_queryset(self):
        category_name = 'Tipo de contacto'
        try:
            category_id = Category.objects.get(name=category_name).category_id
            final_queryset =  Item_Category.objects.filter(category_id=category_id)
            return final_queryset
        except:
            error_message = ('Category with name %s not found' %(category_name))
            print(error_message)
            return None

    #authentication_classes = [authentication.JWTAuthentication]
    #permission_classes = [IsRespectiveCoordinator]

    serializer_class = Contact_Type_Serializer


class Menu_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo Item_Category, siempre y cuando estos spertenezcan a la categoria de menu
    """

    def get_queryset(self):
        category_name = 'Menu'
        try:
            category_id = Category.objects.get(name=category_name).category_id
            final_queryset =  Item_Category.objects.filter(category_id=category_id)
            return final_queryset
        except:
            error_message = ('Category with name %s not found' %(category_name))
            print(error_message)
            return None



    #authentication_classes = [authentication.JWTAuthentication]
    #permission_classes = [IsRespectiveCoordinator]

    serializer_class = Menu_Serializer


class Type_Content_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo Item_Category, siempre y cuando estos spertenezcan a la categoria de type_content
    """

    def get_queryset(self):
        category_name = 'Tipo de contenido'
        try:
            category_id = Category.objects.get(name=category_name).category_id
            final_queryset =  Item_Category.objects.filter(category_id=category_id)
            return final_queryset
        except:
            error_message = ('Category with name %s not found' %(category_name))
            print(error_message)
            return None

    #authentication_classes = [authentication.JWTAuthentication]
    #permission_classes = [IsRespectiveCoordinator]

    serializer_class = Type_Content_Serializer


class Academic_Period_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo Item_Category, siempre y cuando estos spertenezcan a la categoria de academic_period
    """

    def get_queryset(self):
        category_name = 'Periodo Académico'
        try:
            category_id = Category.objects.get(name=category_name).category_id
            final_queryset =  Item_Category.objects.filter(category_id=category_id)
            return final_queryset
        except:
            error_message = ('Category with name %s not found' %(category_name))
            print(error_message)
            return None

    #authentication_classes = [authentication.JWTAuthentication]
    #permission_classes = [IsRespectiveCoordinator]

    serializer_class = Academic_Period_Serializer


class Media_Type_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo Item_Category, siempre y cuando estos spertenezcan a la categoria de media_type
    """

    def get_queryset(self):
        category_name = 'Tipo de contenido media'
        try:
            category_id = Category.objects.get(name=category_name).category_id
            final_queryset =  Item_Category.objects.filter(category_id=category_id)
            return final_queryset
        except:
            error_message = ('Category with name %s not found' %(category_name))
            print(error_message)
            return None

    #authentication_classes = [authentication.JWTAuthentication]
    #permission_classes = [IsRespectiveCoordinator]

    serializer_class = Media_Type_Serializer


# * Vista que devuelve las autoridades de una carrera
@api_view(['GET'])
def request_university_career_authorities(request, university_career_id):
    '''
    Vista que devuelve las autoridades de una carrera
    '''

    if request.method == 'GET':
        target_persons = [] # Lista de personas de las cuales vamos a devolver informacion

        # Obtenemos todas las secciones que tiene la carrera
        sections_queryset = Section.objects.filter(university_career_id=university_career_id)

        # Obtnemos las relaciones de la tabla muchos a muchos 'Person_Section'
        persons_section_queryset = Person_Section.objects.filter(section_id__in=sections_queryset).values('person_id')
        
        # Obtenemos tambiens las personass que no pertenezcan a ninguna seccion pero que tambien esten involucradas con la carrera
        involved_persons_queryset = Person_Role.objects.filter(university_career_id=university_career_id).values('person_id') 
        
        for result in persons_section_queryset:
            print(result)
            target_persons.append(result['person_id'])
        
        for result in involved_persons_queryset:
            print(result)
            target_persons.append(result['person_id'])

        # Eliminamos las id repetidas
        target_persons = set(target_persons)

        
        
        
        # Ahora buscamos todas las personas con sus id
        data = {"persons":[]}
        for id in target_persons:
            person_instance = Person.objects.get(person_id=id)
            print(person_instance)
            person_serializer = Detailed_Person_Serializer(person_instance)
            data['persons'].append(person_serializer.data)



        return Response(data, status=status.HTTP_200_OK)



@api_view(['GET'])
def find_item_category(request):
    if request.method == 'GET':
        if(request.GET.__contains__('name')):
            key = request.GET.get('name')
            try:
                queryset = Item_Category.objects.get(name__icontains=key)
            except:
                message = "To many coincidences"
                return Response({'Error': message}, status=status.HTTP_400_BAD_REQUEST)
        elif(request.GET.__contains__('item_category_id')):
            key = request.GET.get('item_category_id')
            try:
                key = int(key)
            except:
                message = "The id must be an integer"
                return Response({'Error': message}, status=status.HTTP_400_BAD_REQUEST)
            try:
                queryset = Item_Category.objects.get(item_category_id=key)
            except:
                message = "To many coincidences"
                return Response({'Error': message}, status=status.HTTP_400_BAD_REQUEST)
        else:
            message = "One of this param is required: 'name', 'item_category_id'"
            return Response({'Error': message}, status=status.HTTP_400_BAD_REQUEST)


        if(queryset):
            serializer = Item_Category_Serializer(queryset)
            return Response(serializer.data, status=status.HTTP_200_OK)

        else:
            message = "Item category not found"
            return Response({'Error': message}, status=status.HTTP_404_NOT_FOUND)



@api_view(['GET'])
def welcome_message(request):
    if request.method == 'GET':
        if(request.GET.__contains__('university_career_id')):
            key = request.GET.get('university_career_id')
            try:
                key = int(key)
            except:
                message = "The id must be an integer"
                return Response({'Error': message}, status=status.HTTP_400_BAD_REQUEST)
            try:
                # Hacemos la consulta
                queryset = Content.objects.get(
                university_career_id=key,
                content_type_id__name__icontains='mensaje')
            except:
                message = "Not found"
                return Response({'Error': message}, status=status.HTTP_400_BAD_REQUEST)
        else:
            message = "One of this param is required: 'name', 'item_category_id'"
            return Response({'Error': message}, status=status.HTTP_400_BAD_REQUEST)


        if(queryset):
            serializer = Content_Serializer(queryset)
            return Response(serializer.data, status=status.HTTP_200_OK)

        else:
            message = "Item category not found"
            return Response({'Error': message}, status=status.HTTP_404_NOT_FOUND)



# Todo path('university_career_sections/', utils_views.university_career_sections),