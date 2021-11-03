#######################
Configuración Fail2Ban
#######################

Instalamos el paquete, desde los repositorios oficiales:

.. code-block:: console

    sudo apt update -y
    sudo apt install fail2ban -y

Creamos una copia del fichero ``/etc/fail2ban/jail.conf`` y lo guardamos como ``jail.local``.

Aquí modificamos el archivo por si fuera necesario adaptarlo a nuestro entorno.

En este archivo podremos ver la siguiente configuración por defecto:

.. code-block::

    [sshd]

    port    = ssh
    logpath = %(sshd_log)s
    backend = %(sshd_backend)s

    bantime  = 604800 #  ; 1 week
    findtime = 86400 #   ; 1 day
    maxretry = 5

En este archivo deberíamos, por ejemplo, modificar el puerto para adaptarse al puerto utilizado en el servidor SSH (22822).

También sería recomendable ajustar los tiempos de bloqueo y los intentos máximos a nuestro entorno. 

Como referencia, Fail2Ban se organiza de la siguiente manera:

.. code-block:: 

    pablo@server:/etc/fail2ban# tree -L 1
    .
    ├── action.d
    ├── fail2ban.conf
    ├── fail2ban.d
    ├── filter.d
    ├── jail.conf
    ├── jail.d
    ├── jail.local #Este es el fichero que hemos creado.
    ├── paths-arch.conf
    ├── paths-common.conf
    ├── paths-debian.conf
    └── paths-opensuse.conf


Para verificar el estado del servicio, así como saber si hemos cometido algún error en la edición de los ficheros de configuración. 


Pruebas fail2ban
=================

Hemos intentado conectarnos varias veces mediante SSH, como vemos en la siguiente imagen, hemos sido bloqueados después de varios intentos fallidos:

.. image :: ../images/seguridad/fail2ban-2.png
   :width: 500
   :align: center
   :alt: Inicios de sesión fallidos
|br|

Si vemos los logs en el servidor observamos que la IP ha sido bloqueada:

.. image :: ../images/seguridad/fail2ban-3.png
   :width: 500
   :align: center
   :alt: Registro de servidor
|br|

Aquí vemos como nuestro equipo ha sido bloqueado:

.. image :: ../images/seguridad/fail2ban-4.png
   :width: 500
   :align: center
   :alt: Registro de servidor
|br|

Comandos File2Ban
===================

Para listar las "jaulas" y ver su estado:

.. code-block::
    
    fail2ban-client status

Para ver las IPs en una jaula dada:

.. code-block::

    fail2ban-client status <JAIL-NAME>

Para desbloquear una IP en una jaula dadda:

.. code-block::

    fail2ban-client set <JAIL-NAME> unbanip <IP-ADDRESS>

Para bloquer una IP en una jaula dada:

.. code-block::

    fail2ban-client set <JAIL-NAME> banip <IP-ADDRESS>

.. |br| raw:: html

   <br />