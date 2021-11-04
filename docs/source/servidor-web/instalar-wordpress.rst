#########################
Instalación de Wordpress
#########################


Si no lo hemos hecho, habilitamos en el Firewall Apache:

.. code-block:: console
    sudo ufw allow in "Apache Full"


Instalamos los paquetes necesarios:

.. code-block:: console

    apt install -y php libapache2-mod-php php-mysql php-cli mariadb-server mariadb-client php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip


En mysql creamos la base de datos y el usuario para WordPres:

.. code-block:: 

    #Lanzamos MySQL
    mysql -u root -p

    #Dentro de MySQL, ejecutamos:
    CREATE DATABASE miprimerwp;
    CREATE USER 'pepi'@localhost IDENTIFIED BY 'usuario';
    GRANT ALL ON miprimerwp.* TO 'pepi'@'localhost' IDENTIFIED BY 'usuario';
    
Crear el sitio virtual:

.. code-block:: console

    echo -e "<VirtualHost *:80> \n ServerAdmin webmaster@localhost \n ServerName wp.iaw.com \n DocumentRoot /var/www/wordpress/ \n ErrorLog /var/log/apache2/wp.iaw.com \n CustomLog /var/log/c-wp.iaw.com combined \n </VirtualHost> \n" > /etc/apache2/sites-available/wp.conf

Activar módulos y sitios en Apache:

.. code-block:: console

    a2enmod rewrite
    a2ensite wp.conf
    sudo systemctl restart apache2

Descargar WordPress:

.. code-block:: console

    wget https://wordpress.org/latest.tar.gz
    tar xvzf latest.tar.gz
    mkdir /var/www/wordpress
    mv wordpress/ /var/www/wordpress
    chmod -R 770 /var/www/wordpress
    chown -R www-data:www-data /var/www/wordpress