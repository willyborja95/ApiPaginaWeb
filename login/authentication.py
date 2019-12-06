# Simple_jwt imports
from rest_framework_simplejwt import authentication

# Rest framework imports
from rest_framework import permissions

# Local imports
from core.models import (Role,
                         User,
                         Person,
                         Person_Role)


class CustomerAccessPermission(permissions.BasePermission):
    message = 'Adding customers not allowed.'

    def has_permission(self, request, view):
        
        superadmin_id = self.get_superadmin_id()
        user_person_id = request.user.person_id.person_id
        respective_person_role = self.get_person_role_by_id(person_id=user_person_id, role_id=superadmin_id)
        
        print(respective_person_role.role_id.role_id)
        print(superadmin_id)
        if (respective_person_role.role_id.role_id == superadmin_id):
            return True
        else:
            return False
    """
    Object-level permission to only allow owners of an object to edit it.
    Assumes the model instance has an `owner` attribute.
    """

    # def has_object_permission(self, request, view, obj):
    #     print("Llamada a funcion has object permission")
    #     # Read permissions are allowed to any request,
    #     # so we'll always allow GET, HEAD or OPTIONS requests.
    #     if request.method in permissions.SAFE_METHODS:
    #         return True

    #     # Instance must have an attribute named `owner`.
    #     return obj.owner == request.user

    def get_superadmin_id(self):
        queryset = Role.objects.get(name='superadmin')
        return queryset.role_id

    def get_person_role_by_id(self, person_id, role_id):
        print(person_id)
        print(role_id)
        try:
            queryset = Person_Role.objects.get(role_id=role_id, person_id=person_id)
            return queryset
        except:
            raise 


class JWTTokenUserAuthentication(authentication.JWTAuthentication):
    pass