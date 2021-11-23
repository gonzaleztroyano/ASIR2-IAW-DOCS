########################
8 - Función *envio_email*
########################

Explicación
============

Este archivo utilza el comando *mail* para enviar un correo electrónico a la dirección indicada. 

El comando mail utilza la configuración de postfix, previamente instalado y configurado para utilizar el relay de `sendinblue <https://es.sendinblue.com/>`_ para el envío de los correos. 

Este es un ejemplo del correo recibido:

.. image :: ../images/ejemplo_mail_newuser.png
   :width: 500
   :align: center
   :alt: Imagen con un correo de ejemplo recibido por el usuario.
|br|


.. |br| raw:: html

   <br />


Este es la última de las funciones que se utilizando durante el proceso de creación del usuario. Una ves completado, pide al usuario que pulse cualquier tecla y retorna al menú.


Código
========


.. raw:: html

    <div style="position: relative; margin: 2em; padding-bottom: 5%; height: 0; overflow: hidden; max-width: 100%; height: auto;">
        <script src="https://gist.github.com/gonzaleztroyano/11cbeaf116d7e508824d39552526d9fd.js"></script> 
    </div>

.. note::

    Si estás utilizando la versión en PDF, puedes acceder al archivo desde `este enlace <https://github.com/gonzaleztroyano/ASIR2-IAW-SCRIPT/blob/main/envio_email.sh>`_.