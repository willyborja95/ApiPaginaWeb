# Simple_jwt imports
# ...

# Rest framework imports
from rest_framework import permissions

# Local imports
from core.models import (Role,
                         User,
                         Person,
                         Person_Role)
from core import utils # Trae algunas funcionalidaddes utiles

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
        # ? Dando permisos a los GET
        if(request.method in permissions.SAFE_METHODS):
            return True


        superadmin_id = utils.get_role_id_by_name('superadmin')                 # Obtnemos el id del superadmin

        try:
            user_person_id = request.user.person_id.person_id           # Obtenemos el id de la persona asociada a la usuario
            respective_person_role = utils.get_person_role_by_id(person_id=user_person_id, role_id=superadmin_id)    # Obtenemos el person_role (Tabla de muchos a muchos)
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




class IsCoordinator(permissions.BasePermission):
    """
    Clase que sirve para dar permiso a vistas, cuando el token pertenezca a un usuario
    con el rol asociado 'coordidnador'
    """
    message = 'This user it is not a coordinator'
    def is_coordinator(self, user_person_id):


        coordinator_role_id = Role.objects.get(name='coordidnador').role_id                # Obtnemos el id del coordinator rol

        try:
            respective_person_role = Person_Role.objects.get(role_id__role_id=coordinator_role_id, person_id__person_id=user_person_id)
            return True
        except:
            return False

    def has_permission(self, request, view):
        """
        Sobreescribimos este método para que verifique si el usuario que trata de acceder es coordinador o no
        Devuelve 'True' si es que si lo es y 'False', si no lo es
        """
        try:
            result = self.is_coordinator(user_person_id=request.user.person_id.person_id)
            return result
        except:
            return False







class IsRespectiveCoordinator(IsCoordinator):
    """
    Clase que sirve para dar permiso a vistas cuando el usuario sea cordinador y quiera accedere a contenido de una carrera específica
    con el rol asociado 'coordidnador'
    """
    message = 'This user it is not a coordinator or it is not the coordinator of this career'


    def is_valid_request(self, request):
        try:
            target_career_id = request.GET.__contains__('university_career_id')
            
        except:
            # 'Param "university_career_id" is required'
            return False

        try:
            user = request.user.person_id
            
        except:
            # Anonymus user has no role assignation
            return False

        return True

    def is_career_coordinator(self, user_person_id, career_id):

        coordinator_role = Role.objects.get(name='coordinador')                # Obtenemos el id del coordinator rol

        try:

            respective_person_role = Person_Role.objects.get(role_id__role_id=coordinator_role.role_id,
                                                             person_id__person_id=user_person_id,
                                                             university_career_id__item_category_id=career_id)
            return True
        except:
            return False



    def has_permission(self, request, view):
        """
        Sobreescribimos este método para que verifique si el usuario que trata de acceder es coordinador o no
        Devuelve 'True' si es que si lo es y 'False', si no lo es
        """

        print(request.GET.get('university_career_id'))

        if(self.is_valid_request(request) == False):
            return False


        try:
            result = self.is_career_coordinator(user_person_id=request.user.person_id.person_id, career_id=request.GET.get('university_career_id'))
            return result
        except:
            return False


