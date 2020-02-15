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
                        Role,
                        Menu_Item,
                        Content,
                        Content_Media)
from core.serializers import (Person_Serializer,
                            Person_Media_Serializer,
                            Person_Contact_Serializer,
                            Role_Serializer,
                            Subject_Matter_Serializer,
                            Content_Serializer,
                            Content_Media_Serializer)
from core import utils as usefull_queries

"""
universityCareer
contactType
Menu_Item
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

class Menu_Item_Serializer(serializers.ModelSerializer):
    """
    Serializador del modelo Item_Category pertenecientes a la categoria Menu_Item
    """
    class Meta:
        model = Menu_Item
        fields = '__all__'



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



# * Serializador detallado de subject_matter
class Detailed_Subject_Matter_Serializer(serializers.BaseSerializer):
    """
    Serializador de un subject_matter con todos los detalles y relaciones
    Ejemplo:
    {

        "subject_matter_id": 1,
        "name": "Desarrollo Epiritual 3",
        "semester": 3,
        "university_career_id": 1,
        "requirements": [
            {
                "subject_matter_id": 4
                "name": "Desarrollo Epiritual 2",
                "semester": 2,
                "university_career_id": 1,
            }
        ]
    }
    """


    def to_representation(self, instance):
        data = {}

        subject_matter_info = Subject_Matter_Serializer(instance)
        data['subject_matter_data'] = subject_matter_info.data
        
        target_requirements = usefull_queries.get_all_requirements_from_a_subject(instance)
        requirements_info = Subject_Matter_Serializer(target_requirements, many=True)

        data['requirements'] = requirements_info.data
        

        return data
        

# * Serializador detallado de content
class Detailed_Content_Serializer(serializers.BaseSerializer):
    """
    Serializador de un subject_matter con todos los detalles y relaciones
    Ejemplo:
    {
        "content_id": 6,
        "title": "Testimonio de una persona",
        "description": "Una día entré a la U y luego nunca pudo salir",
        "update_time": "2020-02-14T14:00:34Z",
        "create_time": "2020-02-14T14:00:34Z",
        "content_type_id": 31,
        "academic_period_id": null,
        "university_career_id": 1,
        "person_id": {
            (Datos de la persona)
        },
        "content_media": [
            {
                (Datos del contenido media)
            },
            {
                
            }
        ]
    }
    """


    def to_representation(self, instance):
        data = {}

        content_info = Content_Serializer(instance)
        data['content_info'] = content_info.data
        
        try:
            person_instance = Person.objects.get(person_id=instance.person_id.person_id)
            person_info = Person_Serializer(person_instance)
            data['person_info'] = person_info.data
        except:
            data['person_info'] = "null"

        try:
            content_media_instance = Content_Media.objects.get(content_id=instance.content_id)
            content_media = Content_Media_Serializer(content_media_instance, many=True)
            data['content_media_info'] = content_media_info.data
        except:
            data['content_media_info'] = "null"



        
        

        return data
