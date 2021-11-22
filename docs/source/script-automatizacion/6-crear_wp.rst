########################
6 - Función *crear_wp*
########################

Explicación
============

Esta función se encargará de crear el usuario en el sistema gestor de base de datos. También creará la base para su WordPress y otorgará los permisos necesarios. 

Crea el VirtualHost en Apache para el sitio de WordPress . Lo activa y reinicia el servicio de Apache. 

Descarga WordPress, extrae el contenido del .tar, lo mueve a la ruta de la web y configura los permisos. Elimina después los archivos temporales. 

Código
========


.. raw:: html

    <div style="position: relative; margin: 2em; padding-bottom: 5%; height: 0; overflow: hidden; max-width: 100%; height: auto;">
        <script src="https://gist.github.com/gonzaleztroyano/76cce493472e1504a8bf11edb444bb8d.js"></script>
    </div>

.. note::

    Si estás utilizando la versión en PDF, puedes acceder al archivo desde `este enlace <https://github.com/gonzaleztroyano/ASIR2-IAW-SCRIPT/blob/main/crear_wp.sh>`_.