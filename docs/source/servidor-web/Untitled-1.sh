#!/bin/bash

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


En sshd_config
    Match User *
    Include /etc/ssh/sshd_config.d/*

En sshd_config.d/pepito.conf
            ChrootDirectory %h
        ForceCommand internal-sftp -u 0027
        PasswordAuthentication yes