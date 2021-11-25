##################
Configuración SSH
##################

En nuestro caso durante la instalación del servidor hemos seleccionado la opción de instalar de forma automática el servidor SSH. Si no lo hubiéramos hecho deberíamos ejecutar los siguientes comandos:

.. code-block:: console

    # Actualizamos los paquetes disponibles en los repositorios
    sudo apt update # o sin "sudo" si estamos trabajando con root

    # Instalamos el paquete necesario
    sudo apt install openssh-server

Cambiar el puerto por defecto
===============================

Por seguridad, es altamente recomendable cambiar el puerto en que aceptaremos conexiones SSH. De esta manera obligamos a los malos a descubrir más detalles a la hora de intentar un ataque de fuerza bruta.

El fichero que debemos modificar es el ``/etc/ssh/sshd_config``. Editaremos las siguientes opciones:

.. code-block::

    Port 22822

Realizando este cambio seleccionamos este puerto para las conexiones SSH. 

Debemos reiniciar el servicio para que los cambios surtan efecto:

.. code-block:: console

    service sshd restart

Si ahora intentamos acceder mediante SSH debemos indicar el puerto de conexión:

.. image :: ../images/introduccion/ssh-1.png
   :width: 500
   :align: center
   :alt: Imagen en la que se pueden ver los discos virtuales conectados a la máquina
|br|


.. |br| raw:: html

   <br />


¿Meter sudo?
=============

Sí, vamos a mantener instalado y configurada la función pues es más cómodo para los usuarios solo conocer una contraseña. 

PasswordAuthentication y ChallengeResponseAuthentication
==========================================================

Editamos el archivo /etc/ssh/sshd_conf de la siguiente manera:

.. code-block:: console

    PasswordAuthentication no
    PermitEmptyPasswords no
    ChallengeResponseAuthentication yes
    # Debemos comprobar también que PAM está activado:
    UsePAM yes


Archivos de registro
=====================

Editamos el archivo para que las siguientes configuraciones permitan el envío de logs, registros, al archivo /var/log/auth.log

.. code-block:: console

    SyslogFacility AUTH
    LogLevel INFO

Comprobaciones
================

Reiniciamos el servicio y realizaremos las siguientes pruebas:

* Login con usuario válido
* 3 login con password erróneo
* 3 login con usuario que no existe
* Login con root


En el `siguiente video <https://www.loom.com/embed/685a5ac214a5427ba986964b2a16beca>`_ podemos ver el resultado de las pruebas.


.. raw:: html

    <div style="position: relative; margin: 2em; padding-bottom: 5%; height: 0; overflow: hidden; max-width: 100%; height: auto;">
        <div style="position: relative; padding-bottom: 61.1328125%; height: 0;"><iframe src="https://www.loom.com/embed/685a5ac214a5427ba986964b2a16beca" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;"></iframe></div>
    </div>

Generar contraseñas seguras
============================

Podemos generar contraseñas seguras utilizando el siguiente comando:

.. code-block:: console

    openssl rand -base64 32


Autenticación SSH con 2FA
===========================

Es altamente recomendable uilizar la autenticación en 2 factores (2FA) en virtualmente cualquier servicio online. SSH, por tanto, no es menos. 

En `este enlace <https://ubuntu.com/tutorials/configure-ssh-2fa#1-overview>`_ se puede consultar la guía completa. 

El resultado sobre un servidor (mi propio *home-lab*, para ser exactos) sería el siguiente:

.. image :: ../images/introduccion/ssh-2.png
   :width: 500
   :align: center
   :alt: 2FA SSH login
|br|