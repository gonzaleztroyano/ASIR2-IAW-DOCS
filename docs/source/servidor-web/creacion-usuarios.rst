###########################
Creación de usuarios web
###########################

Requisitos:

* La home del usuario será ``/var/www/<nombre_usuario>``
* No se podrá conectar por SSH


Ejemplo para el usuario ``manuel``:

.. code-block:: console

    mkdir /var/www/manuel/
    mkdir /var/www/manuel/web
    mkdir /var/www/manuel/ficheros
    adduser --no-create-home --home /var/www/manuel --shell /bin/false manuel
    chmod -R 770 /var/www/manuel/
    chown -R manuel:manuel /var/www/manuel/

Activar SFTP
==============

En el archivo ``/etc/ssh/sshd_config`` cambiamos/activamos:

.. code-block::

    Subsystem sftp internal-sftp

Reiniciamos el servicio:

.. code-block:: console

    systemctl restart ssh

Conexión SFTP
==============

Utilizando el FileZilla nos podremos conectar:

.. image :: ../images/servidor-web/web-12.png
   :width: 500
   :align: center
   :alt: Conexión FileZilla
|br|

Por defecto nos conectamos a nuestro ``home``:

.. image :: ../images/servidor-web/web-13.png
   :width: 500
   :align: center
   :alt: Conexión FileZilla con home listado
|br|


Permisos de Apache
===================

Necesitamos instalar un módulo de apache que nos permite configurar usuario y grupo para cada instancia del servidor apache.

De esta forma cada virtualhost, cada sitio, de apache será ejecutado con los permisos que le indiquemos. 

.. code-block:: console

    apt install libapache2-mpm-itk

El archivo de configuración del sitio será de la siguiente manera:

.. code-block:: 

    <VirtualHost *:80>

        ServerName manuel.iaw.com

        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/manuel/web

        ErrorLog ${APACHE_LOG_DIR}/manuel-error.log
        CustomLog ${APACHE_LOG_DIR}/manuel-access.log combined
        AssignUserID manuel manuel
 
    </VirtualHost>


Activamos el sitio y recargamos el servicio:

.. code-block:: console

    a2ensite manuel.conf    
    systemctl reload apache2


Gestión de permisos
=====================

En el archivo ``/etc/ssh/sshd_config`` cambiamos/activamos:

.. code-block::

    ForceCommand internal-sftp -u 0027

Reiniciamos el servicio:

.. code-block:: console

    systemctl restart ssh

Podremos acceder a la web utilizando el navegador:

.. image :: ../images/servidor-web/web-14.png
   :width: 500
   :align: center
   :alt: index de manuel
|br|

.. |br| raw:: html

   <br />


.. sudo usermod -a -G manuel root

sudo groupadd sftp_users
sudo usermod -a -G sftp_users manuel

En sshd_config:

Match User sftp_users 
        ChrootDirectory /var/www/user
        ForceCommand internal-sftp 
        X11Forwarding no 
        AllowTcpForwarding no 
        PasswordAuthentication yes


https://devanswers.co/configure-sftp-web-server-document-root/#5-method-two-better-security-and-sftp-user-management

chmod 755 /var/
chmod 755 /var/www/
chmod 755 /var/www/manuel

chown root:root /var/
chown root:root /var/www/
chown root:root /var/www/manuel


chown -R root:sftp_users /var/www/manuel/*
sudo find /var/www/manuel/ -type d -exec chmod 775 {} \;
sudo find /var/www/manuel/ -type d -exec chmod 775 {} \;
sudo find /var/www/manuel/ -type f -exec chmod 664 {} \;

sudo find /var/www/manuel -type d -exec chmod g+s {} \;


       cd /var/www/
   90  ls -lah
   91  cd manuel/
   92  ls -lah
   93  chmod 755 -R -
   94  chmod 755 -R .



Pruebas con "MARTA"

