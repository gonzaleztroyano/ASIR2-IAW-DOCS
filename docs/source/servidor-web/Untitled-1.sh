#!/bin/bash

#Función LISTAR
function listar(){

}

#FUNCION 

#Función CREAR
function crear(){

    read -p "Introduce el usuario a crear" usuario_nuevo

    echo "Creando usuario" + $usuario_nuevo
    read -p "Pulsa cualquier tecla para continuar"
    mkdir /var/www/$usuario_nuevo/
    mkdir /var/www/$usuario_nuevo/web
    mkdir /var/www/$usuario_nuevo/ficheros
    mkdir /var/www/$usuario_nuevo/ficheros/logs

    password_generada=$(openssl rand -base64 12)

    # TODO: #2 que no pida introducir la contraseña, confirmación ni datos adicionales
    useradd -M --home /var/www/$usuario_nuevo --shell /bin/false -p (perl -e'print crypt($password_generada, "aa")') $usuario_nuevo
    chmod 755 /var/www/$usuario_nuevo/
    chown -R $usuario_nuevo:$usuario_nuevo /var/www/$usuario_nuevo/
    chown root:root /var/www/$usuario_nuevo/
    chmod -R 770 /var/www/$usuario_nuevo/*


    echo "Usuario " + $usuario_nuevo + " creado"
    echo "===============ANOTE================"
    echo "||         LA CONTRASEÑA          ||"
    echo "||                                ||"
    echo "||                                ||"
    echo "||  $password_generada ||"
    echo "||                                ||"
    echo "||                                ||"
    echo "===================================="

    chmod 755 /var/www/$usuario_nuevo/
    chown -R $usuario_nuevo:$usuario_nuevo /var/www/$usuario_nuevo/
    chown root:root /var/www/$usuario_nuevo/
    chmod -R 770 /var/www/$usuario_nuevo/*

    #TODO: Permitir crear sitios con otros subdominios
    read -p "Pulsa cualquier tecla para continuar con la creación del sitio en Apache. Pulsa "C" para cancelar" con_apache

        case $con_apache in
        C|c) exit;;
        *) 
            #Creación del sitio de Apache
            wget -O /etc/apache2/sites-available/$usuario_nuevo.conf #AQUÍ VA EL ARCHIVO DESDE GH
            sed -i 's/USER-TO-CHANGE/$usuario_nuevo/g' /etc/apache2/sites-available/$usuario_nuevo.conf
            #TODO: COMPROBAR si dentro del sed se pueden usar variables.
            a2ensite $usuario_nuevo.conf
            systemctl reload apache2
            ;;
    asec

    #Configuración ChrootDirectory

        printf "ChrootDirectory /var/www/$usuario_nuevo" >> /etc/ssh/sshd_config.d/$usuario_nuevo.conf


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