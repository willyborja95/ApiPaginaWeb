# Local imports
from core.models import (Role,
                         User,
                         Person,
                         Person_Role)


"""
En este docuemento se crearan funciones que se puedan usasr en otras partes del proyecto
"""

def get_role_id_by_name(role_name):
    """
    Función para obtener el id del rol superadmin
    """
    queryset = Role.objects.get(name=role_name)
    return queryset.role_id

def get_person_role_by_id(person_id, role_id):
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
    


