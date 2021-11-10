#!/bin/bash

#Función LISTAR
function listar(){

}

#FUNCION 

#Función CREAR
function crear(){
    echo "Creando usuario" + $1
    read -p "Pulsa cualquier tecla para continuar"
    mkdir /var/www/$1/
    mkdir /var/www/$1/web
    mkdir /var/www/$1/ficheros
    mkdir /var/www/$1/ficheros/logs

    password_generada=$(openssl rand -base64 12)

    # TODO: #2 que no pida introducir la contraseña, confirmación ni datos adicionales
    useradd -M --home /var/www/$1 --shell /bin/false -p (perl -e'print crypt($password_generada, "aa")') $1
    chmod 755 /var/www/$1/
    chown -R $1:$1 /var/www/$1/
    chown root:root /var/www/$1/
    chmod -R 770 /var/www/$1/*


    echo "Usuario " + $1 + " creado"
    echo "===============ANOTE================"
    echo "||         LA CONTRASEÑA          ||"
    echo "||                                ||"
    echo "||                                ||"
    echo "||  $password_generada ||"
    echo "||                                ||"
    echo "||                                ||"
    echo "===================================="

    chmod 755 /var/www/$1/
    chown -R $1:$1 /var/www/$1/
    chown root:root /var/www/$1/
    chmod -R 770 /var/www/$1/*

    read -n1 -p "¿Crear el sitio de Apache utilizando la configuración por defecto? [s/n]: " apache_defecto

    case $apache_defecto in
        n|N) crear_apache($1);;
        *) read -p "URL para el sitio (se añadirá .iaw.com)" url_sitio
           crear_apache_mod($1);;
    asec
}

#Función BORRAR
function borar(){
    
}

#Función MODIFICAR
function modificar (){
    
}


select=$0

while $select !=5; do
    echo "1. Listar usuarias"
    echo "2. Crear usuarios"
    echo "3. Borrar usuarias"
    echo "4. Modificar usuarios"
done

echo "Creando usuario" + $1

read -p "Pulsa cualquier tecla para continuar"

    mkdir /var/www/$1/
    mkdir /var/www/$1/web
    mkdir /var/www/$1/ficheros
    mkdir /var/www/$1/ficheros/logs

# TODO: que no pida introducir la contraseña, confirmación ni datos adicionales
    adduser --no-create-home --home /var/www/$1 --shell /bin/false $1
    chmod 755 /var/www/$1/
    chown -R $1:$1 /var/www/$1/
    chown root:root /var/www/$1/
    chmod -R 770 /var/www/$1/*



printf "
<VirtualHost *:80>
    ServerName $1.iaw.com
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/$1/web
    ErrorLog /var/www/$1/ficheros/logs/$1-error.log
    CustomLog /var/www/$1/ficheros/logs/$1-access.log combined
    AssignUserID $1 $1
</VirtualHost>
" > /etc/apache2/sites-available/$1.conf

echo "CONFIGURACIÓN DEL SITIO AÑADIDO"

a2ensite $1.conf
systemctl reload apache2


printf "ChrootDirectory /var/www/$1" >> /etc/ssh/sshd_config.d/$1.conf



#El script debe:
# Listar usuarios
# Crear usuarios
# Borrar usuarios
# Modificar usuarios

#La web debe:
# /web
# /blog
# /blog
# /files

#<usuario>.iaw.com
#blog.<usuario>.iaw.com

# REFERENCIAS:
# https://devhints.io/bash