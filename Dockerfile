FROM debian

# Install services
RUN apt-get update && apt-get install -yq apache2 mysql-client

# Copy abills dir
ADD --chown=www-data /usr/abills /usr/abills
ADD config.pl /usr/abills/libexec/config.pl
RUN cp /usr/abills/misc/apache/abills_httpd.conf /etc/apache2/sites-enabled/; \
mkdir -p -m 755 /var/log/httpd/; \
apachectl configtest; \
/usr/abills/misc/perldeps.pl apt-get --batch;

EXPOSE 9443

ADD --chown=root init.sh /etc/init.d/init.sh
RUN chmod +x /etc/init.d/init.sh
CMD "/etc/init.d/init.sh"
