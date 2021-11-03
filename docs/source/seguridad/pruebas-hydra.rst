##################
Pruebas con Hydra
##################

1. Crear usuario
=================

.. code-block:: console

    sudo adduser fuerzabruta


2. Instalar Hydra
==================

Vamos a utilizar para este paso otra máquina virtual en la que sí podemos instalar paquetes. 

Para la configuración de la red, creamos una red NAT nueva, que nos permitirá realizar más pruebas en un futuro. Se elige este tipo de red al ser autoconfigurable mediante DHCP y permitir la conexión entre equipos conectados a la misma. 
Apagamos la máquina, añadimos la interfaz; que también añadimos a un cliente ubuntu.
Al arrancarlo, debemos editar el netplan para que obtenga la IP mediante DHCP. En esta YAML añadimos:

.. code-block::

    enp0s9:
    dhcp4: true

Al hacer ejecutar el comando ``netplan apply`` obtendremos IP, que comprobaremos con el comando ``ip a``. 

Actualizamos los paquetes disponibles en los repositorios e instalamos hydra:

.. code-block:: console

    sudo apt update -y
    sudo apt install hydra -y

3. Ataque con hydra
=====================

Descargamos la lista de contraseñas desde la web proporcionada por el profesor y será la que usemos para lanzar el ataque. 

.. code-block:: console

    hydra -l fuerzabruta -p lista.txt 100.20.5 -s 22822 -t 4 ssh

Como podemos ver en la siguiente imagen, la sesión ha sido cerrada por el servidor al necesitar autenticarse mediante clave:


.. image :: ../images/seguridad/hydra-1.png
   :width: 500
   :align: center
   :alt: Ataque fallido con Hydra
|br|


En los registros del servidor tenemos la siguiente línea:

.. code-block::

    Sep 30 13:55:21 iaw sshd[1481]: Disconnected from authenticating user fuerzabruta 10.0.20.4 port 48484 [preauth]



.. |br| raw:: html

   <br />