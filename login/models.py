from django.db import models
from django.contrib.auth.models import AbstractBaseUser, PermissionsMixin, BaseUserManager
from django.utils import timezone
from django.utils.translation import ugettext_lazy as _


class Category(models.Model):
    """
    Modelo de Category
    Atributos:
        id INT
        name VARCHAR(255)
        active TINYINT
    """

    category_id = models.AutoField(primary_key=True) #
    name = models.CharField(max_length= 255) 
    active = models.BooleanField(default=True)

    def __str__(self):
        return self.name


class Item_Category(models.Model):
    """
    Modelo de Item_category
    Atributos:
        item_category_id INT
        name VARCHAR(255)
        active TINYINT
        category_category_id INT
    """
    item_category_id = models.AutoField(primary_key=True) 
    name = models.CharField(max_length= 255)
    active = models.BooleanField(default=True)
    category_id = models.ForeignKey(Category, on_delete = models.CASCADE) #
    
    def __str__(self):
        return self.name


class Person(models.Model):
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


class Section(models.Model):
    section_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=255)
    university_career = models.ForeignKey(Item_Category, on_delete=models.CASCADE)


class Person_Section(models.Model):
    person_section_id = models.AutoField(primary_key=True) # cambio base de datos
    person_id = models.ForeignKey(Person, on_delete = models.CASCADE)  # cambio base de datos
    section_id = models.ForeignKey(Section, on_delete = models.CASCADE)  # cambio base de datos


class Role(models.Model):
    role_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=45)


class Person_Role(models.Model):
    """
    Modelo de Person_role
    Atributos:
        person_role_id INT
        Person_person_id INT
        rolerole_id INT
        universitycareer INT
    """
    person_role_id = models.AutoField(primary_key=True)
    university_career = models.ForeignKey(Item_Category, on_delete = models.CASCADE) #ev
    role_id = models.ForeignKey(Role, on_delete=models.CASCADE)
    person_id = models.ForeignKey(Person, on_delete=models.CASCADE)


class Person_Media(models.Model):
    """
    Modelo de Person_media
    Atributos:
        person_media_id INT
        path VARHCAR(255)
        persons_person_id INT
        item_category_item_category_id INT
    """
    person_media_id = models.AutoField(primary_key=True)
    path = models.CharField(max_length=255)
    item_category_id = models.ForeignKey(Item_Category, on_delete = models.CASCADE)
    person_id = models.ForeignKey(Person, on_delete = models.CASCADE)


class Person_Contact(models.Model):
    """
    Modelo de Person_Contact
    Atributos:
        Person_contact_id INT
        contact_type INT
        person_id INT
        contact VARCHAR(45)
    """
    person_contact_id = models.AutoField(primary_key=True)
    contact = models.CharField(max_length=255, null=False)
    contact_type = models.ForeignKey(Item_Category, on_delete=models.CASCADE) #revisar BD
    person_id = models.ForeignKey(Person, on_delete=models.CASCADE)


class Subject_Matter(models.Model):
    """
    Modelo de Subject_matter
    Atributos:
        subject_matter_id INT
        universitycareer INT
        name VARCHAR(45)
        semester INT
    
    """
    subject_matter_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=255)
    semester = models.IntegerField()
    university_career = models.ForeignKey(Item_Category, on_delete = models.CASCADE)

    def __str__(self):
        return self.name

class Requirement(models.Model):
    """
    Modelo de Requirement
    Atributos:
        subejct_matter INT
        requirement INT
    """
    requirement_id = models.AutoField(primary_key=True)
    subject_matter = models.ForeignKey('Subject_Matter', on_delete=models.CASCADE, related_name='subject_matter')
    subject_matter_requeriment = models.ForeignKey('Subject_Matter', on_delete=models.CASCADE, related_name='subject_matter_requeriment')


class Content(models.Model):
    """
    Modelo de Content
    """
    content_id = models.AutoField(primary_key=True)
    title = models.CharField(max_length=255, null = False)
    description = models.CharField(max_length=500, null=False)
    update_time = models.DateTimeField(default=timezone.now, null=False, blank=False)
    create_time = models.DateTimeField(default=timezone.now, null=False, blank=False)
    content_type = models.ForeignKey('Item_Category', on_delete=models.CASCADE, related_name='content_type')
    academic_period = models.ForeignKey('Item_Category', on_delete=models.CASCADE, related_name='academic_period')
    university_career = models.ForeignKey('Item_Category', on_delete=models.CASCADE, related_name='university_career')

    def __str__(self):
        return self.title


class Content_Media(models.Model):
    """
    Modelo de Content_media
    Atributos:
    """
    content_media_id = models.AutoField(primary_key=True)
    path = models.CharField(max_length=500)
    item_category_id = models.ForeignKey(Item_Category, on_delete = models.CASCADE)
    content_id = models.ForeignKey(Content, on_delete = models.CASCADE)


class Event(models.Model):
    """
    ! Este modelo noo se en donde se encuentra pero tiene los mismos atributos que Event
    """
    event_id = models.AutoField(primary_key=True)
    date = models.DateTimeField(default=timezone.now)
    place = models.CharField(max_length=255, null=False)
    link_form = models.CharField(max_length=255, null=False)
    url_info = models.CharField(max_length=255, null=False)
    content_id = models.ForeignKey(Content, on_delete = models.CASCADE)


class Menu(models.Model):
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
    order = models.IntegerField(null=False)
    item_category_id = models.ForeignKey(Item_Category, on_delete = models.CASCADE)


class Group(models.Model):
    """
    Modelo para Group
    Atributos:
        id INT
        name VARCHAR(45)
        universitycareer INT
    """
    group_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=255)
    university_career = models.ForeignKey(Item_Category, on_delete = models.CASCADE)


class Group_Contact(models.Model): 
    """
    Modelo para Group contact
    Atributos:
        contact_type = INT
        group INT
        contact VARCHAR(45)
    """
    group_contact_id = models.AutoField(primary_key=True)
    contact = models.CharField(max_length=255)
    contact_type_id = models.ForeignKey(Item_Category, on_delete=models.CASCADE)
    group_id = models.ForeignKey(Group, on_delete=models.CASCADE)


class Group_Event(models.Model):
    group_event_id = models.AutoField(primary_key=True)
    event_id = models.ForeignKey(Event, on_delete=models.CASCADE)
    group_id = models.ForeignKey(Group, on_delete=models.CASCADE)

class UserManager(BaseUserManager):
    use_in_migrations = True

    def _create_user(self, email, person_id, password, **extra_fields):
        """
        Creates and saves a User with the given email and password.
        """
        if not email:
            raise ValueError('The given email must be set')
        person_id = Person.objects.get(person_id=person_id)
        email = self.normalize_email(email)
        user = self.model(username = username, email = email, person_id = person_id)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_user(self, email, password=None, **extra_fields):
        extra_fields.setdefault('is_superuser', False)
        return self._create_user(email, password, **extra_fields)

    def create_superuser(self, person_id, username, email, password):
        person_id = Person.objects.get(person_id=person_id)
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
    person_id = models.OneToOneField(Person, on_delete = models.CASCADE)

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