from django.contrib import admin
from . import models

admin.site.register(models.Persons)
admin.site.register(models.Users)