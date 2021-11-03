####################################
SSH autenticado con clave pública
####################################


Desde el lado del cliente, generamos un par de claves nuevo, utilizando el comando ssh-keygen. 

Debemos introducir un nombre para la clave y una clave simétrica con la que encriptaremos la clave privada. 

Creamos  el archivo (en el servidor) donde guardaremos las claves permitidas;

.. code-block:: console

    touch ~/.ssh/authorized_keys

Copiamos la clave desde nuestro cliente al servidor utilizando el comando ``scp``

.. code-block:: console

    scp -P 22822 ./pablo.pub pablo@iaw.com:/home/pablo/.ssh/authorized_keys

