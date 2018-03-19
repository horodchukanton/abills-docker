a2enmod rewrite
a2enmod ssl
a2enmod cgi
service apache2 start
#service radiusd start
tail -f /var/log/httpd/abills-error.log
