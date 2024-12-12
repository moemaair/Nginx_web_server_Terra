# Dockerfile for Nginx web server - using Alpine Linux version
FROM nginx:alpine

# Copy the index.html file to the default Nginx web server directory
COPY index.html /usr/share/nginx/html/index.html

# Configure Nginx to listen on port 8002 as required for the test
RUN sed -i 's/listen       80;/listen       8002;/g' /etc/nginx/conf.d/default.conf

# Expose port 8002
EXPOSE 8002

# Health Check Configuration

# Install curl from (alpine package keeper) to use it for health check
RUN apk add --no-cache curl

# Copy the health check script to the container
COPY health-check-script.sh /health-check-script.sh
RUN chmod +x /health-check-script.sh


# Health check configuration 
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD /health-check-script.sh

# Expose port 8002
EXPOSE 8002