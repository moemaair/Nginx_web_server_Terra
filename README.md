# Terrasoftworks Devops Comprehensive Test

A containerized Nginx web server implementation running on port 8002 with integrated health monitoring capabilities.

## Overview

This project provides a Docker container running an Nginx web server with custom health check mechanisms. The container is configured to run on port 8002 and includes automated health monitoring to ensure service reliability.

## Prerequisites

- Docker installed on your system
- Basic understanding of Docker commands
- Port 8002 available on your host machine

## Quick Start


Build the Docker image:
```bash
docker build -t nginx-custom .
```

## Run the container

```bash
docker run -d -p 8002:8002 --name nginx-terra nginx-custom
```

Access the web server at http://localhost:8002

## Health Check Monitoring
The container includes automated health checks configured to monitor the web server's availability. Health checks run every 30 seconds and verify that the server responds correctly on port 8002.

### To monitor container health status:

```bash
docker inspect --format='{{.State.Health.Status}}' nginx-terra
```

### To view detailed health check logs:

```bash
docker inspect nginx-terra | grep -A 10 "Health"
```

## Container Management
### Stop the container:

```bash
docker stop nginx-terra
```

### Remove the container:

```bash
docker rm nginx-terra

```

### Rebuild and restart (after making changes):

```bash

docker stop nginx-terra
docker rm nginx-terra
docker build -t nginx-custom .
docker run -d -p 8002:8002 --name nginx-terra nginx-custom
```

## Project Structure

1. Dockerfile: Container configuration and build instructions
2. health-check-script.sh: Health monitoring script
3. index.html: Default web page content

## Troubleshooting
If health checks are failing:

1. Verify the container is running: docker ps
2. heck container logs: docker logs nginx-terra
3. Test web server directly: curl -v http://localhost:8002
4. Inspect health status: docker inspect nginx-terra | grep -A 10 "Health"