########################
9 - Función *borrar*
########################

Explicación
============

Este script lista todos los usuarios del sistema web y pide al usuario que indique qué usuario desea borrar. 

Comprueba si el usuario introducido realmente existe, si existe realiza una serie de acciones:

* Deshabilita el usuario introducido. 
* Programa la eliminación del usuario en 30 días. 
* Deshabilita los sitios web del usuario, tanto el estático como el WordPress y recarga Apache. 
* Elimina los privilegios sobre las base de datos.
* Programa la eliminación de los datos de las webs y la base de datos en 30 días. ç

Pide al usuario que pulse cualquier tecla y vuelve al menú. 

Código
========


.. raw:: html

    <div style="position: relative; margin: 2em; padding-bottom: 5%; height: 0; overflow: hidden; max-width: 100%; height: auto;">
        <script src="https://gist.github.com/gonzaleztroyano/b6fc1ba2ac6f0d6e2cdc84a4dca81e36.js"></script>
    </div>

.. note::

    Si estás utilizando la versión en PDF, puedes acceder al archivo desde `este enlace <https://github.com/gonzaleztroyano/ASIR2-IAW-SCRIPT/blob/main/borrar.sh>`_.