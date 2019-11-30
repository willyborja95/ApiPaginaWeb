"""
For the full list of settings and their values, see
https://docs.djangoproject.com/en/2.1/ref/settings/
"""

# * Importaciones necesarias
import os
from datetime import timedelta # For the settings of simple jwt

# * Se obtiene la direccion de la carepta raiz del proyecto
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

# ! Esta llave esta actualmente expuesta ya que estamos en fase de desarrollo
SECRET_KEY = '=%!0drg_7h^dlpe1@%es$wwqjzf%bqk=lh0#wn0q2uhornl*qh'

# * Permite ver los logs de los errores, se debe poner en False cuando se esta en produccion
DEBUG = True

# * Host permitidos: ["*"] Permite cualquier ip
ALLOWED_HOSTS = ["*"]

# * APlicaciones intaladas
INSTALLED_APPS = [
    # Aplicacions de django
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.sites',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',

    # Aplicaciones propias
    'core',   # App que contiene todos los modelos
    'login',  # App encargada del servicio de login

    # Aplicaciones de terceros
    'rest_framework',    # App que permite constuir los servicios de mejor manera
    'rest_framework.authtoken',
    'allauth',
    'allauth.account',
    'allauth.socialaccount',
    'rest_auth',
    'rest_auth.registration',
    'django_filters',
    'corsheaders',
    'rest_framework_simplejwt.token_blacklist', # App para generar una tabla con una lista negra de los token ya usados

]

SITE_ID = 1

EMAIL_BACKEND = 'django.core.mail.backends.console.EmailBackend'

MIDDLEWARE = [
    'corsheaders.middleware.CorsMiddleware',
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

CORS_ORIGIN_ALLOW_ALL = True
CORS_ALLOW_CREDENTIALS = True
CORS_ORIGIN_WHITELIST = (
    'localhost:4200',
)
CORS_ORIGIN_REGEX_WHITELIST = (
    'localhost:4200',
)

ROOT_URLCONF = 'backendProject.urls'

# * PLantillas (No las usamos ya que solo es un api rest, es decir no tenemos un sitio web)
TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

# * 
WSGI_APPLICATION = 'backendProject.wsgi.application'


# * COnfiguraciones de la base de datos
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'paginaSistemas',
        'USER': 'dbAdmin',
        'PASSWORD': 'password',
        'HOST': 'localhost',   # Or an IP Address that your DB is hosted on
        'PORT': '3306',
    }
}


# * Restricciones al momento de escribir passwords
AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/2.1/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_L10N = True

USE_TZ = True


# ACCOUNT_USERNAME_REQUIRED = False
# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/2.1/howto/static-files/
# Probablemente subamos los archivos estaticos a un servidor en la nube
STATIC_URL = '/static/'


# ! Customización del usuario por defecto de django
AUTH_USER_MODEL = 'core.User'

REST_AUTH_REGISTER_SERIALIZERS = {
    'REGISTER_SERIALIZER': 'core.serializers.RegistrationSerializer'
}


# * Configuraciones de rest framework
REST_FRAMEWORK = {
    'DEFAULT_FILTER_BACKENDS': (
        'django_filters.rest_framework.DjangoFilterBackend',
    )
}
"""
# * Configuraciones de rest framework
REST_FRAMEWORK = {
    'DEFAULT_PERMISSION_CLASSES': (
       'rest_framework_simplejwt.authentication.JWTTokenUserAuthentication',  # Permite la automatizacion en la verifcacion de tokens
    ),
    'DEFAULT_FILTER_BACKENDS': (
        'django_filters.rest_framework.DjangoFilterBackend',
    )
}
"""


"""
Configuraciones del token.
Puedes encontrar la docuemtnacion en el README del proyecto simple_jwt
https://github.com/davesque/django-rest-framework-simplejwt
"""
SIMPLE_JWT = {
    'ACCESS_TOKEN_LIFETIME': timedelta(minutes=5),
    'REFRESH_TOKEN_LIFETIME': timedelta(days=1),
    'ROTATE_REFRESH_TOKENS': False,
    'BLACKLIST_AFTER_ROTATION': True,

    'ALGORITHM': 'HS256',
    'SIGNING_KEY': SECRET_KEY,
    'VERIFYING_KEY': None,
    'AUDIENCE': None,
    'ISSUER': None,

    'AUTH_HEADER_TYPES': ('Bearer',),
    'USER_ID_FIELD': 'id',
    'USER_ID_CLAIM': 'user_id',

    'AUTH_TOKEN_CLASSES': ('rest_framework_simplejwt.tokens.AccessToken',),
    'TOKEN_TYPE_CLAIM': 'token_type',

    'JTI_CLAIM': 'jti',

    'SLIDING_TOKEN_REFRESH_EXP_CLAIM': 'refresh_exp',
    'SLIDING_TOKEN_LIFETIME': timedelta(minutes=5),
    'SLIDING_TOKEN_REFRESH_LIFETIME': timedelta(days=1),
}