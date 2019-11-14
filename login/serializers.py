from rest_framework import serializers
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
from django.contrib.auth.models import User
from rest_auth.registration.serializers import RegisterSerializer
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


class Item_Category_Serializer(serializers.ModelSerializer):
    """
    Serializador del modelo Item_Cateogry
    """
    class Meta:
        model = Category
        fields = "__all__"


class Category_Serializer(serializers.ModelSerializer):
    """
    Serializador del modelo Item_Cateogry
    """
    class Meta:
        model = Category
        fields = "__all__"


class Person_Serializer(serializers.ModelSerializer):
    """
    Serializador del modelo Item_Cateogry
    """
    class Meta:
        model = Person
        fields = "__all__"


class Person_Serializer(serializers.ModelSerializer):
    """
    Serializador del modelo Item_Cateogry
    """
    class Meta:
        model = Person
        fields = "__all__"


class Person_Section_Serializer(serializers.ModelSerializer):
    """
    Serializador del modelo Item_Cateogry
    """
    class Meta:
        model = Person_Section
        fields = "__all__"


class Role_Serializer(serializers.ModelSerializer):
    """
    Serializador del modelo Item_Cateogry
    """
    class Meta:
        model = Role
        fields = "__all__"


class Person_Role_Serializer(serializers.ModelSerializer):
    """
    Serializador del modelo Item_Cateogry
    """
    class Meta:
        model = Person_Role
        fields = "__all__"


class Person_Media_Serializer(serializers.ModelSerializer):
    """
    Serializador del modelo Item_Cateogry
    """
    class Meta:
        model = Person_Media
        fields = "__all__"


class Person_Contact_Serializer(serializers.ModelSerializer):
    """
    Serializador del modelo Item_Cateogry
    """
    class Meta:
        model = Person_Contact
        fields = "__all__"


class Subject_Matter_Serializer(serializers.ModelSerializer):
    """
    Serializador del modelo Item_Cateogry
    """
    class Meta:
        model = Subject_Matter
        fields = "__all__"
        

class Section_Serializer(serializers.ModelSerializer):
    """
    Serializador del modelo Item_Cateogry
    """
    class Meta:
        model = Section
        fields = "__all__"


class Requirement_Serializer(serializers.ModelSerializer):
    """
    Serializador del modelo Item_Cateogry
    """
    class Meta:
        model = Requirement
        fields = "__all__"


class Info_Site_Serializer(serializers.ModelSerializer):
    """
    Serializador del modelo Item_Cateogry
    """
    class Meta:
        model = Info_Site
        fields = "__all__"


class Site_Serializer(serializers.ModelSerializer):
    """
    Serializador del modelo Item_Cateogry
    """
    class Meta:
        model = Site
        fields = "__all__"


class Content_Serializer(serializers.ModelSerializer):
    """
    Serializador del modelo Item_Cateogry
    """
    class Meta:
        model = Content
        fields = "__all__"



class Content_Media_Serializer(serializers.ModelSerializer):
    """
    Serializador del modelo Item_Cateogry
    """
    class Meta:
        model = Content_Media
        fields = "__all__"


class Event_Serializer(serializers.ModelSerializer):
    """
    Serializador del modelo Item_Cateogry
    """
    class Meta:
        model = Event
        fields = "__all__"


class Menu_Serializer(serializers.ModelSerializer):
    """
    Serializador del modelo Item_Cateogry
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



