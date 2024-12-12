# Dockerfile for Nginx web server - using Alpine Linux version
FROM nginx:alpine

# Copy the index.html file to the default Nginx web server directory
COPY index.html /usr/share/nginx/html/index.html

# Configure Nginx to listen on port 8002 as required for the test
RUN sed -i 's/listen       80;/listen       8002;/g' /etc/nginx/conf.d/default.conf

# Expose port 8002
EXPOSE 8002

