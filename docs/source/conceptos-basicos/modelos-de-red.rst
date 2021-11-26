###############
Modelos de red
###############


Las primeras redes de ordenadores se diseñaban pensando en el hardware que se iba a usar en cada momento. Los ingenieros no estaban pendientes de la posible evolución ni de cuestiones tales como la interconexión o compatibilidad con desarrollos futuros. A medida que avanzaba la tecnología y se extendían las instalaciones, se fue contrastando la necesidad de reescribir los programas de comunicaciones; frente a un hardware nuevo, la poca modularidad del software existente impedía su aprovechamiento.

El problema comenzó a resolverse cuando los fabricantes pensaron en organizar en módulos la arquitectura de red que usaban. De esta forma, cuando se cambiara algún componente hardware, solo la función o el módulo afectado tendrían que ser sustituidos. 

La primera arquitectura de redes comercial se denominó **SNA** (Systems Network Architecture) y fue presentada por IBM en 1974. SNA se basa en la definición de una serie de capas o niveles; cada uno de estos niveles ofrece sus servicios al siguiente. El modelo de capas que utiliza SNA ha sido la base de todas las arquitecturas de redes en uso.

Las ideas básicas del modelo de capas son las siguientes:
* Una capa **ofrece** una serie de servicios a la capa siguiente; ésta, a su vez, los puede usar para implementar los suyos propios.
* Los elementos activos de cada capa se denominan **entidades**. Una entidad puede ser de software (como un proceso) o de hardware (un componente electrónico). Puede haber varias entidades en cada capa.
* A las entidades que componen la misma capa en dos sistemas se las denomina entidades pares.
* Las acciones llevadas a cabo por las entidades de las diferentes capas en el emisor, las **deshacen** sus entidades pares en recepción en sentido inverso.
* La comunicación entre entidades pares se efectúa de acuerdo a una serie de **reglas y parámetros** conocidos como protocolo de capa.
* En un mismo sistema, la comunicación entre dos capas adyacentes se realiza a través de una interfaz que define qué servicios ofrece una capa a su siguiente.
* Una arquitectura de red queda perfectamente definida a través de sus capas, interfaces y protocolos.

.. image :: ../images/conceptos-generales/cp-1.png
   :width: 500
   :align: center
   :alt: Estructura básica de modelos.
|br|


Modelo OSI
============

A partir de 1977 la Organización Internacional de Estándares (ISO) fue definiendo la arquitectura de redes OSI con el fin de promover la creación de una serie de estándares que especificaran un conjunto de protocolos independientes de cualquier fabricante.

Nivel 1
---------
**Nivel 1: Físico.** Este nivel se corresponde con el cableado, las señales, los conectores, etc. Establece unas reglas que regulan cómo debe ser la conexión física delterminal a la red.

Nivel 2
---------

**Nivel 2: Enlace.**  La capa de enlace tiene dos funciones claramente diferenciadas: por un lado, se encarga de la construcción de tramas de bits; por el otro, se encarga del control de acceso al medio de transmisión. Por este motivo, la capa de enlace se divide en dos subniveles:

* **LLC (Logical Link Control)**: encargado de la confección de tramas. A la hora de construir una trama, se incluirán los bits de control necesarios para la verificación y/o posible corrección de errores así como para el control de flujo (petición de retransmisión de una trama).

* **MAC (Medium Access Control)**: define quién y porqué puede hacer uso de la red cuando múltiples dispositivos intentan acceder simultáneamente.

Nivel 3
----------

**Nivel 3: Red.** Realiza las funciones de direccionamiento y encaminamiento estableciendo la mejor ruta a seguir por los paquetes.


Nivel 4
--------
**Nivel 4: Transporte.** Su función básica es, en caso necesario, fragmentar los mensajes en unidades más pequeñas, y pasar éstas al siguiente nivel, asegurando que todos los fragmentos lleguen al otro extremo de la forma más eficiente. Para ello, debe introducir diferentes informaciones de control, como son: mensaje al que pertenecen los fragmentos, número total de fragmentos y orden que ocupa el fragmento dentro del mensaje.

Nivel 5
--------

**Nivel 5: Sesión.** Es el nivel encargado de establecer la conexión entre el emisor y el receptor. Realiza la transferencia del mensaje de forma sincronizada y cuando termina libera la conexión.


Nivel 6
---------

**Nivel 6: Presentación.** Establece las reglas de presentación de la información para que pueda ser comprendida por cualquier programa que cumpla el estándar. Dentro de sus tareas específicas se encuentran: Traducción (de códigos), Encriptación y Compresión


Nivel 7
---------

**Nivel 7: Aplicación.** Permite al usuario acceder a la red, proporcionando interfaces de usuario y las aplicaciones soporte para servicios tales como correo electrónico, transferencia de archivos, administración de bases de datos compartidas y otros tipos de servicios distribuidos.



.. image :: ../images/conceptos-generales/cp-3.png
   :width: 500
   :align: center
   :alt: Estructura básica de modelos.
|br|

TCP/IP
=======


En 1969 la Agencia Norteamericana de Proyectos de Investigación Avanzada (ARPA) recibió el encargo de proyectar un sistema de interconexión de ordenadores que debía poder resistir la destrucción de parte de su infraestructura (por ej. a causa de un ataque nuclear), de forma que dos nodos cualesquiera pudieran seguir comunicados siempre que hubiera una ruta que los uniera.

Poco a poco, las empresas y universidades participantes fueron creando lo que se denominó ARPANet, una red altamente fiable y robusta.


Los diseñadores de TCP/IP actuaron de manera más práctica que los del modelo OSI. Mientras que en el caso de OSI se emplearon varios años en definir con sumo cuidado una arquitectura de capas donde la función y los servicios de cada una estaban perfectamente definidos, y sólo después se planteó desarrollar los protocolos para cada una de las capas, en el caso de TCP/IP la operación fue a la inversa; primero se especificaron los protocolos y luego se definió el modelocomo una simple descripción de los protocolos ya existentes.


Por este motivo el modelo TCP/IP es más simple que OSI. No obstante, OSI es una especificación más coherente y académica por lo que se utiliza a menudo para describir otras arquitecturas.

En el modelo TCP/IP se pueden distinguir cuatro capas: la capa host-red (capas física y de enlace de OSI), la capa interred (red de OSI), la capa de transporte (transporte de OSI) y la capa de aplicación (sesión, presentación y aplicación de OSI).


.. image :: ../images/conceptos-generales/cp-4.png
   :width: 200
   :align: center
   :alt: Estructura básica de modelos.
|br|


Comparativa
============

En la siguiente imagen podemos ver una comparativa entre ambos modelos:

.. image :: ../images/conceptos-generales/cp-2.png
   :width: 200
   :align: center
   :alt: Estructura básica de modelos.
|br|


.. note::

    Fuente de las imaǵenes: Wikipedia y redesteleco.com
    Fuente de la información: Apuntes de Redes de SMR

.. |br| raw:: html

   <br />
