# Django import
from django.db.models.query import EmptyQuerySet

# Local imports
from core.models import (Role,
                         User,
                         Person,
                         Person_Role,
                         Subject_Matter,
                         Requirement)




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
    

def get_all_roles_from_a_person(person_id):
    """
    Funcion que devuelve todo los roles ded una persona
    """
    roles = []
    person_roles_queryset = Person_Role.objects.filter(person_id=person_id).select_related('role_id')
    for result in person_roles_queryset:
        roles.append(result.role_id)

    return roles



def get_all_requirements_from_a_subject(target_subject):
    """
    Funcion que devuelve todos los requerimeintos de una carrera
    La lista contendrá instancias de la clase Subject_Matter
    """
    requirements = []
           
    subject_matter_queryset = Requirement.objects.filter(subject_matter_id=target_subject).select_related('subject_matter_requirement_id')
    if(subject_matter_queryset):     
        for result in subject_matter_queryset:
            requirements.append(result.subject_matter_requirement_id)

    return requirements


# ! En proceso, aun no terminada 
# def validate_GET_params(function, *args, **kwargs):
#     """
#     Funcion decorador que se encarga de validar los parametros de un request con metodo GET
#     """
#     def wrapper():
#         # Validadmos que la petición tenga los parámetros solicitados

#         params = kwargs.get('params')
#         for param in params:
#             params_not_found = ' '
#             try:
#                 param_exists = request.GET.get(param) 
#             except:
#                 params_not_found += param + '| '
        
        
#         body_params = kwargs.get('body_params')
#         for param in params:
#                 body_params_not_found = ' '
#             try:
#                 param_exists = request.data.get(param)
#             except:
#                 body_params_not_found += param + '| '

        




#         if request.method == 'GET':
#             if(request.GET.__contains__('university_career_id')):
#                 key = request.GET.get('university_career_id')
#                 try:
#                     key = int(key)
#                 except:
#                     message = "The id must be an integer"
#                     return Response({'Error': message}, status=status.HTTP_400_BAD_REQUEST)
#             else:
#                 message = "One of this param is required: 'university_career_id'"
#                 return Response({'Error': message}, status=status.HTTP_400_BAD_REQUEST)                

#         else:
#             message = "Only allow GET method"
#             return Response({'Error': message}, status=status.HTTP_400_BAD_REQUEST)



#         # code before
#         result = function(**args)
#         # code after
#         return result
#     return wrapper
