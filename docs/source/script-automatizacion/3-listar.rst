########################
3 - Función *listar*
########################

Explicación
============

Para listar los usuarios se hace uso del fichero ``/etc/passswd``, que contiene los datos de los usuarios del sistema. 

Se pregunta al usuario si desea utilizar algún filtro para la búsqueda de los usuarios, permitiendo acotar la búsqueda. Este filtro se añadirá a la instrucción en un *grep*. 

Se filtre o no, lo que hace es filtrar el archivo ``/etc/passswd`` para obtener solo los usuarios que contengan ``/var/www``, como home. Del resultado de esta operación, con el comando ``cut``, guarda solo el nombre de usuario, descartando el resto de información de la entrada en el archivo. 

Código
========


.. raw:: html

    <div style="position: relative; margin: 2em; padding-bottom: 5%; height: 0; overflow: hidden; max-width: 100%; height: auto;">
        <script src="https://gist.github.com/gonzaleztroyano/64e34df85a60b98c87ac272b066817b6.js"></script>
    </div>

.. note::

    Si estás utilizando la versión en PDF, puedes acceder al archivo desde `este enlace <https://github.com/gonzaleztroyano/ASIR2-IAW-SCRIPT/blob/main/listar.sh>`_.