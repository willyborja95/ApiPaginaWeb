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
from core.models import (User,
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

from core.serializers import (Category_Serializer,
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
                               Category_Item_Category_Serializer,
                               User_Serializer,
                               User_Update_Serializer)
from login.permissions import IsSuperadmin, IsCoordinator, IsRespectiveCoordinator




# Todo: Nuevos servicios especiales
# * Revisar requerimientos en
# * https://docs.google.com/document/d/1IiG_CNBphDfpb6rUOB2aWbkNQ8svdVebe-cin1Mvs_4/edit

# * Servicio de Servicio de universityCareer (CRUD) en general (Category - ItemCategory)   # CRUD = POST GET PUT DELETE
# Url de ejemplo http://iphost/api/career/1/
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


    if request.method == 'DELETE':  # ! Este método borra toda la categoria y lo asociado con ella
        # respective_category_id = Category.objects.get(name=category).category_id
        queryset = Category.objects.get(name=category)
        queryset.delete()
        return Response({"message": "Deleted. The URL /"+category+"/ Do not exists any more"}, status=status.HTTP_202_ACCEPTED)


# Url de ejemplo http://iphost/api/career/1/
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


    if request.method == 'DELETE': # ! Este método borra todo lo asociado con el item category
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



class Section_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo Section
    """

    def get_queryset(self):

        try:
            return Section.objects.filter(university_career_id=self.request.data.get('university_career_id'))
        except:
            return None


    authentication_classes = [authentication.JWTAuthentication]
    permission_classes = [IsRespectiveCoordinator]

    serializer_class = Section_Serializer


class Person_Section_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo Person
    """

    def get_queryset(self):
        try:
            sections_queryset = Section.objects.filter(university_career_id=self.request.data.get('university_career_id'))
            final_queryset =  Person_Section.objects.filter(section_id__in=setions_queryset)
            return final_queryset
        except:
            return None


    authentication_classes = [authentication.JWTAuthentication]
    permission_classes = [IsRespectiveCoordinator]

    serializer_class = Person_Section_Serializer


class Person_Role_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo Person_Role
    """

    def get_queryset(self):
        try:
            final_queryset =  Person_Role.objects.filter(university_career_id=self.request.data.get('university_career_id'))
            return final_queryset
        except:
            return None


    authentication_classes = [authentication.JWTAuthentication]
    permission_classes = [IsRespectiveCoordinator]

    serializer_class = Person_Role_Serializer


class Person_Media_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo Person_Media
    """

    def get_queryset(self):
        try:
            persons_role_queryset =  Person_Role.objects.filter(university_career_id=self.request.data.get('university_career_id')).select_related('person_id')
            persons = []
            for person_role in persons_role_queryset:
                persons.append(person_role.person_id)

            final_queryset = Person_Media.objects.filter(person_id__in=persons)
            return final_queryset
        except:
            return None

    authentication_classes = [authentication.JWTAuthentication]
    permission_classes = [IsRespectiveCoordinator]

    queryset = Person_Media.objects.all()
    serializer_class = Person_Media_Serializer


class Subject_Matter_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo de Subject_Matter
    """

    def get_queryset(self):
        try:
            final_queryset = Subject_Matter.objects.filter(university_career_id=self.request.data.get('university_career_id'))
            return final_queryset
        except:
            return None

    authentication_classes = [authentication.JWTAuthentication]
    permission_classes = [IsRespectiveCoordinator]

    queryset = Subject_Matter.objects.all()
    serializer_class = Subject_Matter_Serializer


class Requirement_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo Requirement
    """

    def get_queryset(self):
        try:
            subject_matters_queryset = Subject_Matter.objects.filter(university_career_id=self.request.data.get('university_career_id'))
            final_queryset = Requirement.objects.filter(subject_matter_id__in=subject_matters_queryset)
            return final_queryset
        except:
            return None


    authentication_classes = [authentication.JWTAuthentication]
    permission_classes = [IsRespectiveCoordinator]

    queryset = Requirement.objects.all()
    serializer_class = Requirement_Serializer


class Group_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo Group
    """

    def get_queryset(self):
        try:
            final_queryset = Group.objects.filter(university_career_id=self.request.data.get('university_career_id'))
            return final_queryset
        except:
            return None

    authentication_classes = [authentication.JWTAuthentication]
    permission_classes = [IsRespectiveCoordinator]

    queryset = Group.objects.all()
    serializer_class = Group_Serializer


class Group_Contact_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo Group_Contact
    """

    def get_queryset(self):
        try:
            groups_queryset = Group.objects.filter(university_career_id=self.request.data.get('university_career_id'))
            final_queryset = Group_Contact.objects.filter(group_id__in=groups_queryset)
            return final_queryset
        except:
            return None

    authentication_classes = [authentication.JWTAuthentication]
    permission_classes = [IsRespectiveCoordinator]

    queryset = Group_Contact.objects.all()
    serializer_class = Group_Contact_Serializer


class Content_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo Group_Event
    """

    def get_queryset(self):
        try:
            final_queryset = Content.objects.filter(university_career_id=self.request.data.get('university_career_id'))
            return final_queryset
        except:
            return None

    authentication_classes = [authentication.JWTAuthentication]
    permission_classes = [IsRespectiveCoordinator]

    queryset = Content.objects.all()
    serializer_class = Content_Serializer


class Event_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo Event
    """

    def get_queryset(self):
        try:
            contents_queryset = Content.objects.filter(university_career_id=self.request.data.get('university_career_id'))
            final_queryset = Event.objects.filter(content_id__in=contents_queryset)
            return final_queryset
        except:
            return None

    authentication_classes = [authentication.JWTAuthentication]
    permission_classes = [IsRespectiveCoordinator]

    queryset = Event.objects.all()
    serializer_class = Event_Serializer



class Group_Event_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo Group_Event
    """

    def get_queryset(self):
        try:
            groups_queryset = Group.objects.filter(university_career_id=self.request.data.get('university_career_id'))
            final_queryset = Event.objects.filter(group_id__in=groups_queryset)
            return final_queryset
        except:
            return None

    authentication_classes = [authentication.JWTAuthentication]
    permission_classes = [IsRespectiveCoordinator]

    queryset = Group_Event.objects.all()
    serializer_class = Group_Event_Serializer


class Content_Media_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo Content_Media
    """

    def get_queryset(self):
        try:
            contents_queryset = Content.objects.filter(university_career_id=self.request.data.get('university_career_id'))
            final_queryset = Content_Media.objects.filter(content_id__in=contents_queryset)
            return final_queryset
        except:
            return None

    authentication_classes = [authentication.JWTAuthentication]
    permission_classes = [IsRespectiveCoordinator]

    queryset = Content_Media.objects.all()
    serializer_class = Content_Media_Serializer


class Person_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo Person_Contact
    """

    def get_queryset(self):
        try:
            persons_role_queryset =  Person_Role.objects.filter(university_career_id=self.request.data.get('university_career_id')).select_related('person_id')
            persons = []
            for person_role in persons_role_queryset:
                persons.append(person_role.person_id)

            final_queryset = Person.objects.filter(person_id__in=persons)
            return final_queryset
        except:
            return None

    authentication_classes = [authentication.JWTAuthentication]
    permission_classes = [IsRespectiveCoordinator]

    queryset = Person.objects.all()
    serializer_class = Person_Contact_Serializer


class Person_Contact_Viewset(ModelViewSet):
    """
    Proporciona un CRUD completo del modelo Person_Contact
    """

    def get_queryset(self):
        try:
            persons_role_queryset =  Person_Role.objects.filter(university_career_id=self.request.data.get('university_career_id')).select_related('person_id')
            persons = []
            for person_role in persons_role_queryset:
                persons.append(person_role.person_id)

            final_queryset = Person_Contact.objects.filter(person_id__in=persons)
            return final_queryset
        except:
            return None

    authentication_classes = [authentication.JWTAuthentication]
    permission_classes = [IsRespectiveCoordinator]

    queryset = Person_Contact.objects.all()
    serializer_class = Person_Contact_Serializer

