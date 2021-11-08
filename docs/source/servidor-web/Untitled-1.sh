#!/bin/bash

echo "Creando usuario" + $1

read -p "Pulsa cualquier tecla para continuar"


    mkdir /var/www/$1/
    mkdir /var/www/$1/web
    mkdir /var/www/$1/ficheros
    mkdir /var/www/$1/ficheros/logs
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
    ErrorLog /var/log/apache2/$1-error.log
    CustomLog $/var/log/apache2/$1-access.log combined
    AssignUserID $1 $1
</VirtualHost>" > /etc/apache2/sites-available/$1.conf

echo "CONFIGURACIÓN DEL SITIO AÑADIDO"

a2ensite $1.conf
systemctl reload apache2

printf " 

# En /etc/ssh/sshd_config añadimos:
#   Include /etc/ssh/sshd.d/*.conf


Match User $1
        ChrootDirectory %h
        ForceCommand internal-sftp -u 0027
        PasswordAuthentication yes
        " >> /etc/ssh/sshd.d/$1.conf

Match User pepito
        ChrootDirectory %h
        ForceCommand internal-sftp -u 0027
        PasswordAuthentication yes

