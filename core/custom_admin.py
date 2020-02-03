# Django imports
from django.contrib import admin


#  Para poder filtar por categorias
class Item_Category_Admin(admin.ModelAdmin):
    list_display = ('item_category_id',
        'name',
        'active',
        'category_id')
    list_filter = ('category_id',)