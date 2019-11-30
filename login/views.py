# Django imports
# ...

# Rest framework imports
from rest_framework_simplejwt.views import TokenObtainPairView


# Local project imports
from login.serializers import CustomTokenObtainPairSerializer

# Other imports
# ...



class CustomTokenObtainPairView(TokenObtainPairView):
    """
    Devuelve un token personalizado usando el serializador de login.serializers.CustomTokenObtainPairSerializer
    """
    serializer_class = CustomTokenObtainPairSerializer
