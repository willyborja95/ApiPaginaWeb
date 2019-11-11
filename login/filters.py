from django_filters import rest_framework as filters
from .models import *

class CategoryFilter(filters.FilterSet):
    class Meta:
        model = Category
        fields = ['nameCategory']

class ItemCategoryFilter(filters.FilterSet):
    class Meta:
        model = ItemCategory
        fields = ['nameItemCategory','category']

class InfoSiteFilter(filters.FilterSet):
    class Meta:
        model = Info_site
        fields = ['type_info','info_site_universitycareer']

