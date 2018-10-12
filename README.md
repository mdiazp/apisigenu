Steps for install in ubuntu 18.04 container

* Install nginx
* Install postgresql -----
* Copy this directory in /etc/
* Open /etc/apisigenu/nginx.server.conf and make your changes
* Open /etc/apisigenu/postgrest.conf and make your changes
* decompress /etc/apisigenu/postgrest/postgrest-v0.5.0.0-ubuntu.tar.xz
* chmod +x /etc/apisigenu/postgrest.sh
* ./etc/apisigenu/postgrest.sh

Logs
* /var/log/postgrest/postgrest.log

About swagger ui
* Download de swagger specification of postgrest api, convert json to yaml and
put the file in /etc/apisigenu/apisigenu_doc/swagger.yaml# apisigenu
