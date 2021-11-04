#################
Instalar Apache
#################

Ejecutamos los siguientes comandos para actualizar los paquetes disponibles en los repositorios e  instalar Apache. También instalaremos tree para ver el contenido de los directorios de forma tabulada.

.. code-block:: console

    sudo apt update -y
    sudo apt install apache2 tree


Si en este momento listamos el directorio por defecto de Apache, veremos como ha creado una serie de carpetas y archivos. 
Posteriormente veremos para qué sirve cada uno.


.. image :: ../images/servidor-web/web-1.png
   :width: 500
   :align: center
   :alt: Directorios de Apache
|br|


Primer sitio
===============

Si iniciamos el servicio con service apache2 start y accedemos desde un navegador (ya sea utilizando iaw.com o la dirección IP, 192.168.56.10) veremos la página de inicio de apache. Esto nos indica que está funcionando correctamente y listo para aceptar peticiones.


.. image :: ../images/servidor-web/web-2.png
   :width: 500
   :align: center
   :alt: Página principal de Apache
|br|

Creación de más sitios web
===========================


Se han ejecutado los siguientes comandos:

.. code-block:: console

    cd /etc/apache2
    sudo su
    mkdir /var/www/web1
    mkdir /var/www/web2
    echo "Web1" > /var/www/web1/index.html
    echo "Web2" > /var/www/web2/index.html
    cd /etc/apache2/
    cp sites-available/000-default.conf sites-available/001.conf
    nano sites-available/001.conf  
        #Ver referencia de archivos a continuación
    cp sites-available/001.conf sites-available/002.conf
    nano sites-available/002.conf  
        #Ver referencia de archivos a continuación
    a2ensite 001.conf
    a2ensite 002.conf
    systemctl reload apache2 


En tanto al archivo ``sites-available/001.conf``, este tiene el siguiente contenido:

.. code-block::

    [...]
    ServerName web1.iaw.com

    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/web1

    ErrorLog ${APACHE_LOG_DIR}/001-error.log
    CustomLog ${APACHE_LOG_DIR}/001-access.log combined
    [...]

En tanto al archivo ``sites-available/002.conf``, este tiene el siguiente contenido:

.. code-block::

    [...]
    ServerName web2.iaw.com

    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/web2

    ErrorLog ${APACHE_LOG_DIR}/002-error.log
    CustomLog ${APACHE_LOG_DIR}/002-access.log combined
    [...]


Si ahora accedemos a los sites veremos los respectivos index.html:

.. image :: ../images/servidor-web/web-5.png
   :width: 500
   :align: center
   :alt: Web1
|br|

.. image :: ../images/servidor-web/web-6.png
   :width: 500
   :align: center
   :alt: Web1
|br|

.. |br| raw:: html

   <br />