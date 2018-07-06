#!/bin/sh -e
INSTALL_DIR="/etc/apisigenu"

#nginx
sudo rm -f /etc/nginx/sites-enabled/default
sudo rm -f /etc/nginx/sites-available/default
sudo rm -f /etc/nginx/conf.d/default.conf

sudo ln -s $INSTALL_DIR/nginx.server.conf /etc/nginx/conf.d/default.conf

#postgrest
#sudo tar --xz -xvf /etc/apisigenu/postgrest/postgrest-v0.5.0.0-ubuntu.tar.xz
sudo mv /etc/apisigenu/postgrest/postgrest /usr/local/bin/postgrest
sudo cp $INSTALL_DIR/postgrest/debian/postgrest-wrapper /usr/local/bin
sudo cp $INSTALL_DIR/postgrest/debian/postgrest.init.d /etc/init.d/postgrest

sudo chmod +x /usr/local/bin/postgrest
sudo chmod +x /etc/init.d/postgrest
sudo chmod +x /usr/local/bin/postgrest-wrapper

sudo update-rc.d postgrest defaults

sudo useradd -M postgrest --shell /bin/false
sudo usermod -L postgrest

sudo mkdir /var/log/postgrest
sudo chown postgrest.postgrest /var/log/postgrest
sudo chown postgrest.postgrest /usr/local/bin

sudo service postgrest start
sudo service nginx restart