##########################
Comandos útiles para IAW
##########################

Es altemante recomendable conocer la existencia (y al menos las características básicas) de los siguientes comandos

* ``cp``, ``mv``, ``scp``
* ``chmod`` y ``chown``
* ``nsloopup`` y ``dig``; así como la edición del archivo ``/etc/hosts`` del equipo. 
* ``printf`` y ``echo``
* ``ncat`` también en la versión de SSL:

.. code-block::

    printf 'GET / HTTP/1.1\r\nHost: github.com\r\n\r\n' | ncat --ssl github.com 443

* ``read``, gestión de bucles y condicionales y ``if``, ``case``, etc.
* ``systemclt { reload | start | stop | restart } {nombre_servicio}``
* Gestión de funciones para creación de script
* Comando básicos de Apache ``a2ensite``, ``a2dissite``, ``a2enmod``, etc. 
* ``curl``, ``wget`` y similares para descargar archivos desde diversas fuentes. 
* ``tar``, ``zip``, etc para gestión de archivos comprimidos
* Todo lo relativo a git. 