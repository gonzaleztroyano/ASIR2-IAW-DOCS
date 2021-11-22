########################
4 - Función *crear_usuario*
########################

Explicación
============

Esta es quizá la función más importante del script. 

Pide el nombre del usuario, transformándolo a minúsculas. Confirma con el ejecutor del script que el usuario es correcto. 

Crea las carpetas necesarias y configura los permisos; añadiendo de forma previa el usaurio al sistema. 

Una vez hecho esto, espera a que el usuario pulse cualquier tecla. Pide al usuario ejecutor un correo electrónico para enviar las credenciales al usuario y llama a las siguientes funciones, pasándoles las variables necesarias:

.. code-block:: console

    crear_apache $usuario_nuevo
    crear_wp $usuario_nuevo $password_generada
    config_wp $usuario_nuevo $password_generada

    read -p "Indique el correo electrónico del cliente: " correo_cliente
    envio_email $usuario_nuevo $password_generada $correo_cliente



Código
========


.. raw:: html

    <div style="position: relative; margin: 2em; padding-bottom: 5%; height: 0; overflow: hidden; max-width: 100%; height: auto;">
        <script src="https://gist.github.com/gonzaleztroyano/977ead872d497eadfdd6db5d27010bf5.js"></script>
    </div>

.. note::

    Si estás utilizando la versión en PDF, puedes acceder al archivo desde `este enlace <https://github.com/gonzaleztroyano/ASIR2-IAW-SCRIPT/blob/main/crear_usuario.sh>`_.