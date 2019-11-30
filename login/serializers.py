
# Django imports
# ? from django.contrib.auth.models import User # Esta importacion no creo que deberia usarse


# Rest framework imports
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer


# Local project imports
# ...

# Otras imports
# ...



class CustomTokenObtainPairSerializer(TokenObtainPairSerializer):
    """
    Usamos esta clase para devolver un token personalizado, enviamos además el id del rol del usuario
    """
    @classmethod
    def get_token(cls, user):
        """
        En esta función customizamos el token
        """
        token = super().get_token(user)

        # * Aqui agregamos lo que queremos eniar en el token. Ejemplo: token['informacion_util'] = 'admin'
        token['role_id'] = get_user_role(user) # Aquí agregamos el rol del usuario en el token

        return token

def get_user_role(user):
    """
    Obtenemos el rol del usuario, si no tiene ninguno se devuelve un 0
    """
    person_id = user.person_id.person_id
    try:
        person_role = Person_Role.objects.get(person_id=person_id)
        role_id = person_role.role_id
        return role_id
    except:
        return 0


