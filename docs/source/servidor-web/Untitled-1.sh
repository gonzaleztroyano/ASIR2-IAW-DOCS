#!/bin/bash

echo "Creando usaurio" + $1

read -p "Pulsa cualquier tecla para continuar"


    mkdir /var/www/$1/
    mkdir /var/www/$1/web
    mkdir /var/www/$1/ficheros
    mkdir /var/www/$1/ficheros/logs
    adduser --no-create-home --home /var/www/$1 --shell /bin/false $1
    chmod -R 755 /var/www/$1/
    chown -R root:root /var/www/$1/

printf "<VirtualHost *:80> \n         ServerName $1.iaw.com \n         ServerAdmin webmaster@localhost \n         DocumentRoot /var/www/$1/web \n        ErrorLog ${APACHE_LOG_DIR}/$1-error.log \n         CustomLog ${APACHE_LOG_DIR}/$1-access.log combined \n         AssignUserID $1 $1 \n     </VirtualHost>" > /etc/apache2/sites-available/$1.conf

echo "CONFIGURACIÓN DEL SITIO AÑADIDO"

a2ensite $1.conf
systemctl reload apache2

printf " 

Match User $1 
        ChrootDirectory /var/www/$1
        ForceCommand internal-sftp 
        X11Forwarding no 
        AllowTcpForwarding no 
        PasswordAuthentication yes

        "
