#######################################
Instalación de un tema en WordPress
#######################################

Cargar tema nuevo
====================

Se prodecerá a la instalación del tema "FlatSome", proporcionado por el profesor. 

Se ha intenado subir mediante la interfaz gráfica de WordPress pero a pesar de haber añadido las directivas en el archivoi ``php.ini`` no ha funcionado. 

Estas son las directivas que hay que añadir/modificar para permitir la subida de archivos de más de 2MB (que es el valor por defecto):

.. code-block:: php

    upload_max_filesize = 40M
    post_max_size = 40M

En cualquier caso, subiendo por **SFTP** el resultado es el mismo. Una vez hecho (importante: hay que subir el contenido del ZIP del tema, no el contenido completo del ZIP proporcionado por el profesor).

Una vez subido, lo tendremos disponible en la galería de temas:

.. image :: ../images/trim-2/wc-6.png
   :width: 500
   :align: center
   :alt: Tema en la galería de temas
|br|

Utilizar tema nuevo
====================

Para usarlo, basta con hacer clic en activar el tema desde la galería. Podremos también previsualizarlo utilizando el botón de *Vista Previa*. En nuestro caso, el tema quedaría de la siguiente manera:

.. image :: ../images/trim-2/wc-7.png
   :width: 500
   :align: center
   :alt: Tema instalado
|br|



.. |br| raw:: html

   <br />