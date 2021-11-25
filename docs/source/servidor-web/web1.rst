###########################
Web1 en Apache Web Server
###########################

Habilitar PHP
==============

Instalaremos PHP y la librería de Apache para este:

.. code-block:: console

    apt update
    apt install php7.4
    apt install libapache2-mod-php


En el archivo ``index.php`` añadimos:

.. code-block:: 

    <html>
        <head>
            <link rel="stylesheet" href="css/estilo.css">
            <script src="js/prog.js"></script>
        <!--Comentario-->
        </head>
        <body>
            <h1>Esto es un título</h1>
            <p>Esto es un párrafo</p>

            <pre>
                Ejecuta php -S localhost:9000
                visital con tu navegador
            </pre>

            <?php
                echo "Esto lo escribe <b>PHP</b>";
                echo "Versión 2";
            ?>
        </body>
    </html>

En el archivo ``prog.js``:

.. code-block::

    alert("Hola mundo")


En el archivo ``estilo.css``:

.. code-block::

    body{ background-color: black;
    color: white;}

Demostración
===============

Al desplegarlo (en la imagen vemos una instancia de CloudShell, no la máquina virtual, pero el resultado es el mismo) vemos como efectivamente se están aplicando los cambios:

.. image :: ../images/servidor-web/web-16.png
   :width: 500
   :align: center
   :alt: Alert de JS
|br|

En tanto al CSS y el código PHP, podemos comprobar como que también se está aplicando:

.. image :: ../images/servidor-web/web-17.png
   :width: 500
   :align: center
   :alt: CSS y PHP probe
|br|

.. |br| raw:: html

   <br />