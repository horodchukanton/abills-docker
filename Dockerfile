FROM ubuntu

EXPOSE 9443

# Install services
RUN apt-get update && \
  apt-get install -yq apache2 mysql-client \
  telnet skalibs-dev \
  build-essential git vim unzip

RUN mkdir /etc/s6
ADD scripts /etc/s6/
RUN ls -la /etc/s6
# skalibs installation for s6
WORKDIR /tmp
RUN git clone git://git.skarnet.org/skalibs
WORKDIR skalibs
RUN ./configure && make && make install

# execline installation for s6
WORKDIR /tmp
RUN git clone git://git.skarnet.org/execline
WORKDIR execline
RUN ./configure && make && make install

# s6 installation
WORKDIR /tmp
RUN git clone https://github.com/skarnet/s6.git
WORKDIR /tmp/s6
RUN ./configure && make && make install
ENTRYPOINT ["/bin/bash"]

# Copy abills dir
ADD --chown=www-data /usr/abills /usr/abills

# Copy configuration
ADD config.pl /usr/abills/libexec/config.pl

# Apache config, create log dir,
RUN cp /usr/abills/misc/apache/abills_httpd.conf /etc/apache2/sites-enabled/; \
  mkdir -p -m 755 /var/log/httpd/; \
  apachectl configtest; \
  a2enmod ssl; \
  a2enmod cgi;

# Install perl dependencies
RUN /usr/abills/misc/perldeps.pl apt-get --batch

# Copy apache certificates
ADD misc/Certs/* /usr/abills/Certs/

RUN rm -rf /tmp/s6
RUN rm -rf /tmp/execline
RUN rm -rf /tmp/skalibs

### END OF CLEANUP ###

ENTRYPOINT ["/bin/s6-svscan","/etc/s6"]
CMD []
