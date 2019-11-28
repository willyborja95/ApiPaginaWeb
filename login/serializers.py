# Django importacions
# ? from django.contrib.auth.models import User # Esta importacion no creo que deberia usarse


# Rest framework importacions
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer
from rest_auth.registration.serializers import RegisterSerializer
from rest_framework import serializers

# Local project importaciones
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



# Other importacions
from allauth.account import app_settings as allauth_settings
from allauth.account.adapter import get_adapter


class RegistrationSerializer (RegisterSerializer):

    person_id = serializers.PrimaryKeyRelatedField(queryset=Person.objects.all())

    def _create_user(self, email, person_id, password, **extra_fields):
        """
        Creates and saves a User with the given email and password.
        """
        if not email:
            raise ValueError('The given email must be set')
        person_id = Person.objects.get(person_id=person_id)
        email = self.normalize_email(email)
        user = self.model(username = username, email = email, person_id = person_id)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def get_cleaned_data(self):
        return {
            'person_id': self.validated_data.get('person_id', ''),
            'email': self.validated_data.get('email', ''),
            'password': self.validated_data.get('password', ''),
        }

    def save(self, request):
        adapter = get_adapter()
        user = adapter.new_user(request.data)
        user.person_id = Person(person_id=request.data['person_id'])
        self.cleaned_data = self.get_cleaned_data()
        adapter.save_user(request, user, self)
        user.set_password(request.data['password1'])
        user.save()
        return user


class Category_Serializer(serializers.ModelSerializer):
    """
    Serializador del modelo Category
    """
    class Meta:
        model = Category
        fields = "__all__"


class Item_Category_Serializer(serializers.ModelSerializer):
    """
    Serializador del modelo Item_Category
    """
    class Meta:
        model = Item_Category
        fields = "__all__"


class Person_Serializer(serializers.ModelSerializer):
    """
    Serializador del modelo Person
    """
    class Meta:
        model = Person
        fields = "__all__"


class Person_Section_Serializer(serializers.ModelSerializer):
    """
    Serializador del modelo Person_Section
    """
    class Meta:
        model = Person_Section
        fields = "__all__"


class Role_Serializer(serializers.ModelSerializer):
    """
    Serializador del modelo Role
    """
    class Meta:
        model = Role
        fields = "__all__"


class Person_Role_Serializer(serializers.ModelSerializer):
    """
    Serializador del modelo Person_Role
    """
    class Meta:
        model = Person_Role
        fields = "__all__"


class Person_Media_Serializer(serializers.ModelSerializer):
    """
    Serializador del modelo Person_Media
    """
    class Meta:
        model = Person_Media
        fields = "__all__"


class Person_Contact_Serializer(serializers.ModelSerializer):
    """
    Serializador del modelo Person_Contact
    """
    class Meta:
        model = Person_Contact
        fields = "__all__"


class Subject_Matter_Serializer(serializers.ModelSerializer):
    """
    Serializador del modelo Subject_Matter
    """
    class Meta:
        model = Subject_Matter
        fields = "__all__"


class Section_Serializer(serializers.ModelSerializer):
    """
    Serializador del modelo Section
    """
    class Meta:
        model = Section
        fields = "__all__"


class Requirement_Serializer(serializers.ModelSerializer):
    """
    Serializador del modelo Requirement
    """
    class Meta:
        model = Requirement
        fields = "__all__"


class Content_Serializer(serializers.ModelSerializer):
    """
    Serializador del modelo Content
    """
    class Meta:
        model = Content
        fields = "__all__"



class Content_Media_Serializer(serializers.ModelSerializer):
    """
    Serializador del modelo Content_Media
    """
    class Meta:
        model = Content_Media
        fields = "__all__"


class Event_Serializer(serializers.ModelSerializer):
    """
    Serializador del modelo Event
    """
    class Meta:
        model = Event
        fields = "__all__"


class Menu_Serializer(serializers.ModelSerializer):
    """
    Serializador del modelo Menu
    """
    class Meta:
        model = Menu
        fields = "__all__"


class Group_Serializer(serializers.ModelSerializer):
    """
    Serializador del modelo Group
    """
    class Meta:
        model = Group
        fields = "__all__"


class Group_Contact_Serializer(serializers.ModelSerializer):
    """
    Serializador del modelo Group_Contact
    """
    class Meta:
        model = Group_Contact
        fields = "__all__"


class Group_Event_Serializer(serializers.ModelSerializer):
    """
    Serializador del modelo Group_Event
    """
    class Meta:
        model = Group_Event
        fields = "__all__"



class Category_Item_Category_Serializer(serializers.Serializer):
    """

    """
    def __init__(self, category_id, *args, **kwargs):
        self.respective_category_id = category_id
        super(Category_Item_Category_Serializer, self).__init__(*args, **kwargs)


    item_category_id = serializers.ReadOnlyField()
    name = serializers.CharField()
    active = serializers.BooleanField()
    category_id = serializers.CharField(required=False)


    def create(self, validate_data, **kwargs):
        instance = Item_Category()
        instance.name = validate_data.get('name')
        queryset = Category.objects.get(category_id=self.respective_category_id)
        instance.category_id = queryset
        instance.save()
        return instance

    def update(self, instance, validate_data):
        instance = instance
        instance.name = validate_data.get('name') or instance.name
        instance.active = validate_data.get('active') or instance.active
        instance.category_id = validate_data.get('category_id') or instance.category_id
        instance.save()
        return instance


"""
Probando los tokens
"""


class CustomTokenObtainPairSerializer(TokenObtainPairSerializer):

    @classmethod
    def get_token(cls, user):
        print(user.__class__)
        token = super().get_token(user)

        # * Add custom claims
        # Ejemplo: token['espacio'] = 'abcdefghijklmn'
        token['role_id'] = get_user_role(user)

        return token

def get_user_role(user):
    """
    Obtenemos el rol del usuario, si no tiene nunguno se devuelve los caracteres 0
    """
    person_id = user.person_id.person_id
    try:
        person_role = Person_Role.objects.get(person_id=person_id)
        role_id = person_role.role_id
        return role_id
    except:
        return 0

