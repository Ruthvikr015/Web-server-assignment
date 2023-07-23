
# Use the official Apache HTTPD image from Docker Hub
FROM httpd:latest

# Copy the SSL certificate and key to the container
COPY server.crt /usr/local/apache2/conf/server.crt
COPY server.key /usr/local/apache2/conf/server.key

# Enable SSL module
RUN sed -i '/#LoadModule ssl_module/s/^#//g' /usr/local/apache2/conf/httpd.conf

# Enable SSL virtual host
RUN echo "Include conf/extra/httpd-ssl.conf" >> /usr/local/apache2/conf/httpd.conf

# Enable mod_socache_shmcb module
RUN echo "LoadModule socache_shmcb_module modules/mod_socache_shmcb.so" >> /usr/local/apache2/conf/httpd.conf

# Copy the static HTML file to the container's document root
COPY index.html /usr/local/apache2/htdocs/
