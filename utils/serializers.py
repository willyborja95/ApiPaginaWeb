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

class University_Career_Serializer(serializers.ModelSerializer):
    """
    Serializador del modelo Item_Category pertenecientes a la categoria University_Career
    """
    class Meta:
        model = Item_Category
        fields = (
            'item_category_id',
            'name',
            'active')


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


class Media_Type_Period(serializers.ModelSerializer):
    """
    Serializador del modelo Item_Category pertenecientes a la categoria Media_Type
    """
    class Meta:
        model = Item_Category
        fields = (
            'item_category_id',
            'name',
            'active')

