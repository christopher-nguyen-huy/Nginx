#/bin/sh

sudo mkdir /etc/nginx/ssl
cd /etc/nginx/ssl
sudo openssl genrsa -des3 -out server.key 4096
sudo openssl req -new -key server.key -out server.csr
# Common Name: 192.168.1.202
sudo cp server.key server.key.org
sudo openssl rsa -in server.key.org -out server.key
sudo openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt