from django.db import models
from django.contrib.auth.models import AbstractBaseUser, PermissionsMixin, BaseUserManager
from django.utils import timezone
from django.utils.translation import ugettext_lazy as _


class Category (models.Model):
    """
    Modelo de Category

    Atributos:
        id INT
        name VARCHAR(255)
        active TINYINT
    """

    idCategory = models.AutoField(primary_key=True)
    nameCategory = models.CharField(max_length= 255)
    active = models.BooleanField(default=True)

    def __str__(self):
        return self.nameCategory


class ItemCategory (models.Model):
    """
    Modelo de Item_category

    Atributos:
        item_category_id INT
        name VARCHAR(255)
        active TINYINT
        category_category_id INT
    """
    idItemCategory = models.AutoField(primary_key=True) 
    nameItemCategory = models.CharField(max_length= 255)
    active = models.BooleanField(default=True)
    category = models.ForeignKey(Category, on_delete = models.CASCADE)
    
    def __str__(self):
        return self.nameItemCategory


class Persons(models.Model):
    """
    Modelo de Person

    Atributos:
        person_id INT
        first_name
        second_name
        first_last_name
        second_last_name
    """
    person_id = models.AutoField(primary_key=True)
    first_name = models.CharField(max_length=255)
    second_name = models.CharField(max_length=255)
    first_last_name = models.CharField(max_length=255)
    second_last_name = models.CharField(max_length=255)

    def __str__(self):
        return self.first_name +" "+ self.first_last_name


class Persons_departaments (models.Model):
    """
    ! Este modelo de datos ya no está en el diagrama actual 
    """
    persons_departaments_id = models.AutoField(primary_key=True)
    persons_id = models.ForeignKey(Persons, on_delete = models.CASCADE)
    item_category_id = models.ForeignKey(ItemCategory, on_delete = models.CASCADE,null=True, related_name="item_category_id")
    universitycareer = models.ForeignKey(ItemCategory, on_delete = models.CASCADE, null=True,related_name="universitycareer")


class Persons_role (models.Model):
    """
    Modelo de Person_role

    Atributos:
        person_role_id INT
        persons_person_id INT
        rolerole_id INT
        universitycareer INT
    """
    persons_role_id = models.AutoField(primary_key=True)
    item_category_id = models.ForeignKey(ItemCategory, on_delete = models.CASCADE)
    persons_id = models.ForeignKey(Persons, on_delete = models.CASCADE)


class Persons_media (models.Model):
    """
    Modelo de Persons_media

    Atributos:
        persons_media_id INT
        path VARHCAR(255)
        persons_person_id INT
        item_category_item_category_id INT
    """
    persons_media_id = models.AutoField(primary_key=True)
    path = models.CharField(max_length=255)
    item_category_id = models.ForeignKey(ItemCategory, on_delete = models.CASCADE)
    persons_id = models.ForeignKey(Persons, on_delete = models.CASCADE)


class Persons_Contacts (models.Model):
    """
    Modelo de Person_Contact

    Atributos:
        persons_contact_id INT
        contact_type INT
        person_id INT
        contact VARCHAR(45)
    """
    contact_info_id = models.AutoField(primary_key=True)
    contact = models.CharField(max_length=255, null=False)
    item_category_id = models.ForeignKey(ItemCategory, on_delete = models.CASCADE)
    persons_id = models.ForeignKey(Persons, on_delete = models.CASCADE)


class Subject_matter (models.Model):
    """
    Modelo de Subject_matter

    Atributos:
        subject_matter_id INT
        universitycareer INT
        name VARCHAR(45)
        semester INT
    
    """
    subject_matter_id = models.AutoField(primary_key=True)
    name_subject_matter = models.CharField(max_length=255)
    universitycareer = models.ForeignKey(ItemCategory, on_delete = models.CASCADE)

    def __str__(self):
        return self.name_subject_matter


class Pre_requirements (models.Model):
    """
    Modelo de Requirement

    Atributos:
        subejct_matter INT
        requirement INT
    """
    pre_requirements_id = models.AutoField(primary_key=True)
    subject_matter_id_id = models.ForeignKey('Subject_matter', on_delete=models.CASCADE, related_name='subject_matter_id_id')
    subject_matter_requeriment_id = models.ForeignKey('Subject_matter', on_delete=models.CASCADE, related_name='subject_matter_requeriment_id')


class Info_site(models.Model):
    """
    Modelo de Info_site

    Atributos
    
    """
    info_site_id = models.AutoField(primary_key=True)
    description = models.CharField(max_length=500, null=False)
    type_info =models.ForeignKey('ItemCategory', on_delete=models.CASCADE, related_name='type_info')
    info_site_universitycareer = models.ForeignKey('ItemCategory', on_delete=models.CASCADE, related_name='info_site_universitycareer')

# * NUevo modelo
class Site(models.Model):
    """
    Modelo para Site

    Atributos:
        site_id INT
        title VARCHAR(45)
        icon VARCHAR(45)
        favicon VARCHAR(45)
    """

class Content (models.Model):
    """
    Modelo de Content
    """
    content_id = models.AutoField(primary_key=True)
    title = models.CharField(max_length=255, null = False)
    description = models.CharField(max_length=500, null=False)
    update_time = models.DateTimeField(default=timezone.now, null=False, blank=False)
    create_time = models.DateTimeField(default=timezone.now, null=False, blank=False)
    type_event = models.ForeignKey('ItemCategory', on_delete=models.CASCADE, related_name='type_event')
    academic_period = models.ForeignKey('ItemCategory', on_delete=models.CASCADE, related_name='academic_period')
    content_universitycareer = models.ForeignKey('ItemCategory', on_delete=models.CASCADE, related_name='content_universitycareer')

    def __str__(self):
        return self.title


class Content_media (models.Model):
    """
    Modelo de Content_media

    Atributos:

    """
    content_media_id = models.AutoField(primary_key=True)
    path = models.CharField(max_length=500)
    item_category_item_category_id = models.ForeignKey(ItemCategory, on_delete = models.CASCADE)
    content_content_id = models.ForeignKey(Content, on_delete = models.CASCADE)


class Content_info (models.Model):
    """
    ! Este modelo noo se en donde se encuentra pero tiene los mismos atributos que Event
    """
    content_info_id = models.AutoField(primary_key=True)
    date = models.DateTimeField(default=timezone.now)
    place = models.CharField(max_length=255, null=False)
    link_form = models.CharField(max_length=255, null=False)
    url = models.CharField(max_length=255, null=False)
    content_content_id = models.ForeignKey(Content, on_delete = models.CASCADE)


class Menu (models.Model):
    """
    Modelo de Menu

    Atributos:
        menu_id
        name VARCHAR(45)
        order INT
        item_category_item_category_id INT
    """
    menu_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=255, null=False)
    url = models.CharField(max_length=500, null=False)
    orden = models.IntegerField(null=False)
    item_category_item_category_id = models.ForeignKey(ItemCategory, on_delete = models.CASCADE)


class UserManager(BaseUserManager):
    use_in_migrations = True

    def _create_user(self, email, person_id, password, **extra_fields):
        """
        Creates and saves a User with the given email and password.
        """
        if not email:
            raise ValueError('The given email must be set')
        person_id = Persons.objects.get(person_id=person_id)
        email = self.normalize_email(email)
        user = self.model(username = username, email = email, person_id = person_id)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_user(self, email, password=None, **extra_fields):
        extra_fields.setdefault('is_superuser', False)
        return self._create_user(email, password, **extra_fields)

    def create_superuser(self, person_id, username, email, password):
        person_id = Persons.objects.get(person_id=person_id)
        user = self.model(username = username, email = email, person_id = person_id)
        email = self.normalize_email(email)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def get_by_natural_key(self, username):
        return self.get(username=username)


class Users(AbstractBaseUser, PermissionsMixin):
    username = models.CharField(max_length=15, unique=True, null=False)
    email = models.EmailField(max_length=100, unique=True, null=False)
    is_admin = models.BooleanField(default=True)
    is_superuser = models.BooleanField(default=True)
    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=True)
    update_time = models.DateTimeField(default=timezone.now)
    create_time = models.DateTimeField(default=timezone.now)
    person_id = models.OneToOneField(Persons, on_delete = models.CASCADE)

    objects = UserManager()

    USERNAME_FIELD = 'username'
    REQUIRED_FIELDS = ['email','person_id']

    class Meta:
        verbose_name = _('user')
        verbose_name_plural = _('users')

    def has_perm(self, perm, obj=None):
        return True
        
    def has_module_perms(self, app_label):
        return True

    def is_staff(self):
        return self.is_staff

    def __str__(self):
        return self.email

# *
# * Nuevos modelos
# *
class Group_contact(models.Model): 
    """
    Modelo para Group contact

    Atributos:
        contact_type = INT
        group INT
        contact VARCHAR(45)
    """

    # * Atributos propios
    # * Atributos relacionales
    pass


class Group(models.Model):
    """
    Modelo para Group

    Atributos:
        id INT
        name VARCHAR(45)
        universitycareer INT
    """
    
    pass



"""
Podemos usar el que da por defecto django
Modelo para Group_event que será una tabala de muchos a muchos entre Group y Event

Atributos:
    event INT
    group INT

"""


class Event(models.Model):
    """
    Modelo para event
    
    Atributos: 
        content_info_id INT
        date DATE
        place VARCHAR(45)
        link_form VARCHAR(45)
        url_info VARCHAR(45)
        content_content_id INT
    """
    pass


class Content(models.Model):
    """
    Modelo para Content

    Atributos:
        content_id INT
        title VARCHAR(45)
        description VARCHAR(45)
        content_type INT
        create_time TIMESTAMP
        update_time TIMESTAMP
        academic_period INT
        universitycareer INT
    """
    pass



