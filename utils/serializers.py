# Django imports

# Rest framework imports
from rest_framework import serializers

# Local project imports
from core.models import (Category,
                        Item_Category)

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



class Contact_Type_Serializer(serializers.ModelSerializer):
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

class Menu_Serializer(serializers.ModelSerializer):
    """
    Serializador del modelo Item_Category pertenecientes a la categoria Menu
    """
    class Meta:
        model = Item_Category
        fields = (
            'item_category_id',
            'name',
            'active')
        category_name = 'UKNOWN_CATEGORY'


class Type_Content_Serializer(serializers.ModelSerializer):
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


class Academic_Period_Serializer(serializers.ModelSerializer):
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


class Media_Type_Serializer(serializers.ModelSerializer):
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

