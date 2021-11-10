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
    mkdir /var/www/manuel/ficheros/logs
        # También se podría con:
        # mkdir -p /var/www/manuel/ficheros/logs
        # mkdir /var/www/manuel/www
    adduser --no-create-home --home /var/www/manuel --shell /bin/false manuel
    chmod 755 /var/www/manuel/
    chown -R manuel:manuel /var/www/manuel/
    chown root:root /var/www/manuel/
    chmod -R 770 /var/www/manuel/*


Con los siguientes comandos, crearemos los directorios para el usuario. 

Después, crearemos el usuario. Con la opción ``--no-create-home`` indicamos que NO queremos utilizar la ruta por defecto en ``/home/`` ni copiar desde ``/etc/skel`` los archivos para poblarlo. Indicamos también que su shell (intérprete de comandos) será ``/bin/false``, que es una shell inexistente que no permite el inicio SSH. 

A continuación, con los directorios creados debemos configurar los permisos de estos. 

.. important::

    *This path, and all its components, must be root-owned directories that are not writable by any other user or group. After the chroot, sshd(8) changes the working directory to the user's home directory.*

    No solo el propio directorio donde enjaularemos al usuario, sino todos los componentes de la ruta deben ser propiedad de root para que chroot funcione. 

    Fuente: `Manual de sshd_config. <https://linux.die.net/man/5/sshd_config>`_

También cambiaremos la propiedad de los ficheros y directorios. La raiz del directorio *chrooteado* será de root, y los subdirectorios y archivos del usuario. 


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

Por defecto nos conectamos a nuestro ``home``, pero podemos navegar por todo el directorio. Esto es justo lo que queremos evitar. El usuario solo debe poder ver, conocer la existencia, de sus archivos. 

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

        ServerAdmin manuel@iaw.com
        DocumentRoot /var/www/manuel/web

        ErrorLog /var/www/manuel/ficheros/logs/manuel-error.log
        CustomLog /var/www/manuel/ficheros/logs/manuel-access.log combined
        AssignUserID manuel manuel
 
    </VirtualHost>


Activamos el sitio y recargamos el servicio:

.. code-block:: console

    a2ensite manuel.conf    
    systemctl reload apache2


Gestión de permisos y chroot
============================

En el archivo ``/etc/ssh/sshd_config`` cambiamos/activamos:

.. code-block::

    Match User *
    Include /etc/ssh/sshd_config.d/*

Crearemos un archivo nuevo en ``sshd_config.d/manuel.conf``, donde incluiremos:

.. code-block::

    #TODO: #1 ¿aquí no hace falta un Match?
        ChrootDirectory %h
        ForceCommand internal-sftp -u 0027
        PasswordAuthentication yes

.. note::

    Normalmente añadiríamos una directiva *Include* y en el directorio indicado crearíamos los archivos de configuración (presumiblemente uno para usuario). 
    
    Lamentablemente la versión de SSH que viene instalada en Ubuntu 20.04 (el SO que estamos utilizando) tiene un bug que hace que los Include/Match no funcionen correctamente 

    Fuente: `Incidencia 3122 de OpenSSH <https://bugzilla.mindrot.org/show_bug.cgi?id=3122>`_

Reiniciamos el servicio:

.. code-block:: console

    systemctl restart ssh

Acceso y comprobación
=======================

Utilizando el programa FileZilla, o cualquier otro compatible con SFTP el usuario podrá subir y gestionar sus ficheros:

.. image :: ../images/servidor-web/web-15.png
   :width: 500
   :align: center
   :alt: Filezilla Chrooteado
|br|

.. important::

    Debemos añadir ``sftp://`` antes del host para conectarnos. 

Después de haber subido los archivos, podremos acceder a la web utilizando el navegador:

.. image :: ../images/servidor-web/web-14.png
   :width: 500
   :align: center
   :alt: index de manuel
|br|

.. |br| raw:: html

   <br />





