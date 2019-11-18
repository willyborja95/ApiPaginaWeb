from django.contrib import admin
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


admin.site.register(Users)
admin.site.register(Category)
admin.site.register(Content)
admin.site.register(Content_Media)
admin.site.register(Event)
admin.site.register(Group)
admin.site.register(Group_Contact)
admin.site.register(Group_Event)
admin.site.register(Info_Site)
admin.site.register(Item_Category)
admin.site.register(Menu)
admin.site.register(Person)
admin.site.register(Person_Contact)
admin.site.register(Person_Media)
admin.site.register(Person_Role)
admin.site.register(Person_Section)
admin.site.register(Role)
admin.site.register(Section)
admin.site.register(Site)
admin.site.register(Subject_Matter)
admin.site.register(Requirement)