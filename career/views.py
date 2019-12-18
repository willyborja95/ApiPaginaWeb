# Django imports
# ...

# Rest_framework imports
from rest_framework.decorators import action, api_view, permission_classes
from rest_framework import generics, status
from rest_framework.viewsets import ModelViewSet
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import permissions
from rest_framework_simplejwt import authentication # Para que valide los tokens

# Local project imports
from core.models import (User,
                          Category,
                          Content,
                          Content_Media,
                          Event,
                          Group,
                          Group_Contact,
                          Group_Event,
                          Item_Category,
                          Menu,
                          Person,
                          Person_Contact,
                          Person_Media,
                          Person_Role,
                          Person_Section,
                          Role,
                          Section,
                          Subject_Matter,
                          Requirement)

from core.serializers import (Category_Serializer,
                               Content_Media_Serializer,
                               Content_Serializer,
                               Event_Serializer,
                               Group_Contact_Serializer,
                               Group_Event_Serializer,
                               Group_Serializer,
                               Item_Category_Serializer,
                               Menu_Serializer,
                               Person_Contact_Serializer,
                               Person_Media_Serializer,
                               Person_Role_Serializer,
                               Person_Section_Serializer,
                               Person_Serializer,
                               RegisterSerializer,
                               RegistrationSerializer,
                               Requirement_Serializer,
                               Role_Serializer,
                               Section_Serializer,
                               Subject_Matter_Serializer,
                               Category_Item_Category_Serializer,
                               User_Serializer,
                               User_Update_Serializer)




# Todo: Nuevos servicios especiales
# * Revisar requerimientos en
# * https://docs.google.com/document/d/1IiG_CNBphDfpb6rUOB2aWbkNQ8svdVebe-cin1Mvs_4/edit

# * Servicio de Servicio de universityCareer (CRUD) en general (Category - ItemCategory)   # CRUD = POST GET PUT DELETE
# Url de ejemplo http://iphost/api/career/1/
@api_view(["GET","POST", "PUT", "DELETE"])
def post_get_put_category(request, category):

    if request.method == 'GET':
        respective_category_id = Category.objects.get(name=category).category_id
        queryset = Item_Category.objects.filter(category_id=respective_category_id)
        serializer = Item_Category_Serializer(queryset, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)

    if request.method == 'POST':
        respective_category_id = Category.objects.get(name=category).category_id
        serializer = Category_Item_Category_Serializer(data=request.data, category_id=respective_category_id)
        if serializer.is_valid():
            instance = serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


    if request.method == 'DELETE':  # ! Este método borra toda la categoria y lo asociado con ella
        # respective_category_id = Category.objects.get(name=category).category_id
        queryset = Category.objects.get(name=category)
        queryset.delete()
        return Response({"message": "Deleted. The URL /"+category+"/ Do not exists any more"}, status=status.HTTP_202_ACCEPTED)


# Url de ejemplo http://iphost/api/career/1/
@api_view(["GET","PUT", "DELETE"])
def get_put_delete_category_item_category(request, category, item_category):


    if request.method == 'GET':
        queryset = Item_Category.objects.get(name=item_category)
        serializer = Item_Category_Serializer(queryset)
        return Response(serializer.data, status=status.HTTP_200_OK)


    if request.method == 'PUT':
        queryset = Item_Category.objects.get(name=item_category)
        serializer = Item_Category_Serializer(data=request.data)
        if serializer.is_valid():
            serializer.update(instance=queryset, validate_data=serializer.data)
            return Response(serializer.data, status=status.HTTP_200_OK)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


    if request.method == 'DELETE': # ! Este método borra todo lo asociado con el item category
        respective_category_id = Category.objects.get(name=category).category_id
        queryset = Item_Category.objects.get(name=item_category)
        # serializer = Item_Category_Serializer(queryset)
        print(queryset.category_id)
        print(respective_category_id)
        if queryset.category_id == respective_category_id:
            # Eliminar
            return Response(serializer.data, status=status.HTTP_202_ACCEPTED)
        else:
            # No eliminar
            return Response({"message": "Not allowes"}, status=status.HTTP_401_UNAUTHORIZED)

