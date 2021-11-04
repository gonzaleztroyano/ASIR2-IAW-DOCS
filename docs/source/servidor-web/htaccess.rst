###################
Archivo .htaccess
###################

.htaccess vs Archivos de configuración
=======================================

La mejor forma de modificar la configuración de Apache es utilizando los archivos de configuración y las directivas. Esta es, de hecho, la forma más eficiente y “limpia”.

Editar los archivos .htaccess puede ser útil en determinados entornos, aunque debemos tener en cuenta que Apache intentará leer en cada petición dicho archivo si lo tenemos habilitado para ese sitio (lo que conlleva unos pocos ms de retraso y puede sobrecargar el servidor en algunas situaciones).


Teniendo el archivo de configuración de sitio de la siguiente forma:

.. code-block::

    <Directory "/var/www/web1/docs">
        Options -Indexes
    </Directory>

El resultado de intentar listar es:

.. image :: ../images/servidor-web/web-3.png
   :width: 500
   :align: center
   :alt: Error Forbidden de Apache
|br|

En cambio, si cambiamos “-Indexes” por “+Indexes”:

.. image :: ../images/servidor-web/web-4.png
   :width: 500
   :align: center
   :alt: Error Forbidden de Apache
|br|

También podemos combinar en este archivo la declaración de dos directorios con políticas distintas:

.. code-block::

    <VirtualHost *:80>
    [...]
            <Directory "/var/www/web1/docs/">
                    Options -Indexes
            </Directory>
            <Directory "/var/www/web1/docs/docs2">
                    Option +Indexes
            </Directory>
    </VirtualHost>


Aunque es la configuración mostrada es la utilizada por defecto, podemos configurar con la política AllowOverride si se permiten .htaccess y en qué nivel:

.. code-block::

    <VirtualHost *:80>
    [...]
        <Directory "/var/www/web1">
            AllowOverride None
        </Directory>
    </VirtualHost>

.. |br| raw:: html

   <br />