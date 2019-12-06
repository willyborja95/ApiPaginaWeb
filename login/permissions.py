# Simple_jwt imports
# ...

# Rest framework imports
from rest_framework import permissions

# Local imports
from core.models import (Role,
                         User,
                         Person,
                         Person_Role)


class IsSuperadmin(permissions.BasePermission):
    """
    Clase que sirve para proteger las vistas
    Solo permite acceder a los usuarios con un rol asociado de superadmin
    """

    def has_permission(self, request, view):
        """
        Sobreescribimos este método para que verifique si el usuario que trata de acceder es superadmin o no
        Devuelve 'True' si es que si lo es y 'False', si no lo es
        """
        superadmin_id = self.get_superadmin_id()                    # Obtnemos el id del superadmin

        try:
            user_person_id = request.user.person_id.person_id           # Obtenemos el id de la persona asociada a la usuario
            respective_person_role = self.get_person_role_by_id(person_id=user_person_id, role_id=superadmin_id)    # Obtenemos el person_role (Tabla de muchos a muchos)
        except:
            return False


        if(respective_person_role != None):
            if (respective_person_role.role_id.role_id == superadmin_id):
                # Si es superadmin devolvemos True
                return True
            else:
                # Si no lo es dedvolvemos False
                return False
        else:
            return False

    def get_superadmin_id(self):
        """
        Función para obtener el id del rol superadmin
        """
        queryset = Role.objects.get(name='superadmin')
        return queryset.role_id

    def get_person_role_by_id(self, person_id, role_id):
        """
        Función para buscar si la persona está asociada con un rol
        """
        try:
            queryset = Person_Role.objects.get(role_id=role_id, person_id=person_id)
            return queryset
        except:
            message = "The user has not a role asociate"
            print(message)
            return None

