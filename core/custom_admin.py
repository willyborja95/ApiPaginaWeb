# Django imports
from django.contrib import admin


#  Para poder filtar por categorias los items
class Item_Category_Admin(admin.ModelAdmin):
    list_display = ('item_category_id',
        'name',
        'active',
        'category_id')
    list_filter = ('category_id',)


#  Para poder filtar por categorias las secciones
class Section_Admin(admin.ModelAdmin):
    list_display = ('section_id',
        'name',
        'university_career_id')
    list_filter = ('university_career_id',)

