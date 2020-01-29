# Como migrar a docker el proyecto

## Paso 1
Hacer una copia de la base de datos en el servidor

## Paso 2
En el servidor crear los contenedores docker
`docker-compose build`

## Paso 3
Correr el servidor para verificar que todo vaya bien
`docker-compose up`

## Paso 4
Entrar al contendor de mysql con el comando:
`docker-compose exec db mysql -uroot -p`
La clave a ingresar sera `password`

Dentro de mysql se debera crear el usuario `dbAdmin` y darles los permisos necesarios, para ellos ejecuta los siguientes comandos:

`CREATE USER 'dbAdmin'@'localhost' IDENTIFIED BY 'password';`

`GRANT ALL PRIVILEGES ON * . * TO 'dbAdmin'@'localhost';`

`FLUSH PRIVILEGES;`

`exit;`

## Paso 5
Ahora si debes ejecutar el siguiente comando para restaurar la copia de seguridad:
`docker-compose exec -T db mysql -udbAdmin -ppassword paginaSistemas < db_backups/ *Ultima copia de seguridad* `


# Correr el servidor
`docker-compose up`