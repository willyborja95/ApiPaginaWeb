# Django imports

# Rest framework imports
from rest_framework import serializers

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

# Others imports
from rest_auth.registration.serializers import RegisterSerializer
# ? from allauth.account import app_settings as allauth_settings
# ? from allauth.account.adapter import get_adapter


class RegistrationSerializer(RegisterSerializer):
    """
    Agregar documentacion de para que se usa esta clase
    """
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


class Menu_Item_Serializer(serializers.ModelSerializer):
    """
    Serializador del modelo Menu_Item
    """
    class Meta:
        model = Menu_Item
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



class User_Serializer(serializers.ModelSerializer):
    """
    Serializador customizado para el modelo 'User'
    """
    class Meta:
        model = User
        fields = "__all__"


    def create(self, validated_data):
        instance = User()

        instance.username = validated_data.get('username')
        instance.email = validated_data.get('email')
        if(validated_data.get('is_admin')):
            instance.is_admin = validated_data.get('is_admin')
        else:
            instance.is_admin = False

        if(validated_data.get('is_superuser')):
            instance.is_superuser = validated_data.get('is_superuser')
        else:
            instance.is_superuser = False

        if(validated_data.get('is_active')):
            instance.is_active = validated_data.get('is_active')
        else:
            instance.is_active = True

        if(validated_data.get('is_staff')):
            instance.is_staff = validated_data.get('is_staff')
        else:
            instance.is_staff = False


        instance.person_id = validated_data.get('person_id')

        instance.set_password(validated_data.get('password'))

        instance.save()
        return instance


    def validate_username(self, data):
        users = User.objects.filter(username = data)
        if len(users) != 0:
            message = "This username it is already on use by another user: "+str(data)
            raise serializers.ValidationError(message)
        else:
            return data

    def get_person_instance_by_id(self, id):
        try:
            pk = int(id)
        except:
            message = "That it is not a valid person_id primary key: "+ str(id)
            raise serializers.ValidationError(message)

        try:
            person = Person.objecst.get(persosn_id=id)
            return person
        except:
            message = "We could not find a person with that id: "+ str(id)
            raise serializers.ValidationError(message)


class User_Update_Serializer(serializers.ModelSerializer):

    class Meta:
        model = User
        fields = '__all__'
        read_only_fields = ('user_id', 'person_id')

    def update(self, instance, validated_data):

        if(validated_data.get('username')):
            instance.username = validated_data.get('username')

        if(validated_data.get('email')):
            instance.email = validated_data.get('email')

        if(validated_data.get('is_admin')):
            instance.is_admin = validated_data.get('is_admin')

        if(validated_data.get('is_superuser')):
            instance.is_superuser = validated_data.get('is_superuser')

        if(validated_data.get('is_active')):
            instance.is_active = validated_data.get('is_active')

        if(validated_data.get('is_staff')):
            instance.is_staff = validated_data.get('is_staff')

        if(validated_data.get('person_id')):
            instance.person_id = validated_data.get('person_id')

        instance.save()


        try:
            instance.set_password(validated_data.get('password'))
        except:
            pass

        instance.save()

        return instance


# ? Talvez debería ir en otra app
class Category_Item_Category_Serializer(serializers.Serializer):
    """
    Serializador personalizado para los serivicos de tipo {:category_name/:item_category_name}
    """

    def __init__(self, category_id, *args, **kwargs):
        self.respective_category_id = category_id
        super(Category_Item_Category_Serializer, self).__init__(*args, **kwargs)


    item_category_id = serializers.ReadOnlyField()
    name = serializers.CharField()
    active = serializers.BooleanField()
    category_id = serializers.CharField(required=False)


    def create(self, validate_data, **kwargs):
        print("This serializer must be deprecated for future versions")
        instance = Item_Category()
        instance.name = validate_data.get('name')
        queryset = Category.objects.get(category_id=self.respective_category_id)
        instance.category_id = queryset
        instance.save()
        return instance

    def update(self, instance, validate_data):
        print("This serializer must be deprecated for future versions")
        instance = instance

        if(validate_data.get('name')):
            instance.name = validate_data.get('name')


        if(validate_data.get('active')):
            instance.active = validate_data.get('active')


        if(validate_data.get('category_id')):
            instance.category_id = validate_data.get('category_id')


        instance.save()
        return instance




