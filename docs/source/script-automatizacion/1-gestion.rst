##########################
1 - Script *gestion.sh*
##########################

Explicación
============

Este es el script que carga todas las funciones (con ``source <Ruta-a-fichero>``) para posteriomente utilizarlas durante la ejecución. 

Además, comprueba que se está ejecutando con el usuario root (UID = 0). De no ser así, avisa al usuario y termina la ejecución. 

Si todo ha ido bien, llama a la función *menu*. 

Código
========

.. code-block:: console

    #!/bin/bash

    source borrar.sh
    source config_wp.sh
    source crear_apache.sh
    source crear_usuario.sh
    source crear_wp.sh
    source envio_email.sh
    source menu.sh
    source modificar.sh
    source listar.sh

    if [ "$EUID" -ne 0 ]
    then echo "Este script de gestión solo puede ser ejecutado por el usuario root"
    exit
    fi

    menu