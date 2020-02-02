# Django imports

# Rest framework imports
from rest_framework import serializers

# Local project imports
from core.models import (Category,
                        Item_Category,
                        User,
                        Person_Contact,
                        Section,
                        Person_Section,
                        Person,
                        Person_Media,
                        Person_Role,
                        Role)
from core.serializers import (Person_Serializer,
                            Person_Media_Serializer,
                            Person_Contact_Serializer,
                            Role_Serializer)
from core import utils as usefull_queries

"""
universityCareer
contactType
menu
typeContent
academicPeriod
media_type
"""

class BaseItemFromKnewCategorySerializer(serializers.ModelSerializer):
    """
    Serializador del modelo Item_Category pertenecientes a la categoria conocida
    """
    class Meta:
        model = Item_Category
        fields = (
            'item_category_id',
            'name',
            'active')
        category_name = 'UKNOWN_CATEGORY'


    def create(self, validate_data):
        print(self.Meta.category_name)
        respective_category_id = Category.objects.get(name=self.Meta.category_name).category_id
        instance = Item_Category()
        instance.name = validate_data.get('name')
        queryset = Category.objects.get(category_id=respective_category_id)
        instance.category_id = queryset
        instance.save()
        return instance  


class University_Career_Serializer(BaseItemFromKnewCategorySerializer):
    """
    Serializador del modelo Item_Category pertenecientes a la categoria University_Career
    """

    class Meta:
        model = Item_Category
        fields = (
            'item_category_id',
            'name',
            'active')
        category_name = 'Titulacion'



class Contact_Type_Serializer(BaseItemFromKnewCategorySerializer):
    """
    Serializador del modelo Item_Category pertenecientes a la categoria Contact_Type
    """
    class Meta:
        model = Item_Category
        fields = (
            'item_category_id',
            'name',
            'active')
        category_name = 'Tipo de contacto'

class Menu_Serializer(BaseItemFromKnewCategorySerializer):
    """
    Serializador del modelo Item_Category pertenecientes a la categoria Menu
    """
    class Meta:
        model = Item_Category
        fields = (
            'item_category_id',
            'name',
            'active')
        category_name = 'Menu'


class Type_Content_Serializer(BaseItemFromKnewCategorySerializer):
    """
    Serializador del modelo Item_Category pertenecientes a la categoria Type_Content
    """
    class Meta:
        model = Item_Category
        fields = (
            'item_category_id',
            'name',
            'active')
        category_name = 'Tipo de contenido'


class Academic_Period_Serializer(BaseItemFromKnewCategorySerializer):
    """
    Serializador del modelo Item_Category pertenecientes a la categoria Academic_Period
    """
    class Meta:
        model = Item_Category
        fields = (
            'item_category_id',
            'name',
            'active')
        category_name = 'Periodo Académico'


class Media_Type_Serializer(BaseItemFromKnewCategorySerializer):
    """
    Serializador del modelo Item_Category pertenecientes a la categoria Media_Type
    """
    class Meta:
        model = Item_Category
        fields = (
            'item_category_id',
            'name',
            'active')
        category_name = 'Tipo de contenido media'


# * Serializador de un persona con todos los detallees y relaciones
class Detailed_Person_Serializer(serializers.BaseSerializer):
    """
    Serializador de un persona con todos los detallees y relaciones
    Ejemplo:
    {

        "person_id": 1,
        "first_name": "Medardo",
        "second_name": "Angel",
        "first_lasst_name": "Silva",
        "second_last_name": "Rodas",
        "username": "angel27",
        "email": "angel27@gmail.com",
        "roles": [
            {
                "role_id": 4
                "name": "Estudiante"
            }
        ],
        "person_media":{
            "person_media_id": 54,
            "path": "google.gfots/j394r79q9b3"
        }
        "person_contact":{
            "person_contact_id": 68,
            "contact": "contacto",
        }
    }
    """


    def to_representation(self, instance):
        data = {}

        personal_info = Person_Serializer(instance)
        data['personal_info'] = personal_info.data
        
        try:
            user_instance = User.objects.get(person_id=instance.person_id)
            user_info = Insensitive_User_Serializer(user_instance)
            data['user_info'] = user_info.data
        except:
            data['user_info'] = "null"

        try:
            person_contact_instance = Person_Contact.objects.get(person_id=instance.person_id)
            person_contact_info = Person_Contact_Serializer(person_contact_instance)
            data['person_contact_info'] = person_contact_info.data
        except:
            data['person_contact_info'] = "null"


        try:
            person_media_instance = Person_Media.objects.get(person_id=instance.person_id)
            person_media_info = Person_Media_Serializer(person_media_instance)
            data['person_media_info'] = person_media_info.data
        except:
            data['person_media_info'] = "null"


        roles_queryset = usefull_queries.get_all_roles_from_a_person(instance.person_id)
        roles_info = Role_Serializer(roles_queryset, many=True)
        data['roles_info'] = roles_info.data
        # data['roles_info'] = "null"
        

        return data
        


# * Serializador de un usuario, devuelve solo informacion no sensible
class Insensitive_User_Serializer(serializers.ModelSerializer):

    class Meta:
        model = User
        fields = ('username', 'email')
