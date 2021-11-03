#############################
Creación de servidor en VM
#############################


Para el servidor hemos configurado Ubuntu 20.04 Server. Siendo el usuario *pablo* y su clave *Londres2012*. 

Como nota interna, el nombre de la máquina virtual será ``ASIR2.IAW.ServidorUb2004-2``

En tanto a la red el archivo netplan queda de la siguiente manera:

.. code-block::

    network:
    ethernets:
        enp0s3:
            addresses: [192.168.56.10/24]
            gateway4: 192.168.56.1
        enp0s8:
            dhcp4: true
    version: 2

Quedando el esquema de red de la siguiente  manera:

.. code-block::

    | Cliente XXX | -> Host-only <- | Server Ubuntu |
    -------------                   ---------------
            \_____________NAT______________/



Cambiar zona horaria
=====================

.. code-block:: console

    timedatectl set-timezone Europe/Madrid
    #No es necesario instalar NTP
    