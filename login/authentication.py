# Simple_jwt imports
from rest_framework_simplejwt import authentication

# Rest framework imports
from rest_framework import permissions

class CustomerAccessPermission(permissions.BasePermission):
    message = 'Adding customers not allowed.'

    def has_permission(self, request, view):
         ...




class JWTTokenUserAuthentication(authentication.JWTAuthentication):
    pass