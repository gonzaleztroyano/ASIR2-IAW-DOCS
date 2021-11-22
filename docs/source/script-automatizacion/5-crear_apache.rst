########################
5 - Función *crear_apache*
########################

Explicación
============

Esta función descarga una plantilla de la configuación del sitio y utiliza el *sed* para cambiar la cadena arbitraria "USER-TO-CHANGE" por la variable $1, que es el nombre del usuario. 

También crea un sencillo archivo *index.html* en su *DocumentRoot*, que contiene su nombre, para facilitar la comprobación del funcionamiento. 

Activa el sitio, reinicia el servicio de Apache y ajusta SSH (para SFTP). 


Código
========

.. raw:: html

    <div style="position: relative; margin: 2em; padding-bottom: 5%; height: 0; overflow: hidden; max-width: 100%; height: auto;">
        <script src="https://gist.github.com/gonzaleztroyano/b8ecd9c3a0a67ab434d58a06fadf0f0a.js"></script>
    </div>

.. note::

    Si estás utilizando la versión en PDF, puedes acceder al archivo desde `este enlace <https://github.com/gonzaleztroyano/ASIR2-IAW-SCRIPT/blob/main/crear_apache.sh>`_.