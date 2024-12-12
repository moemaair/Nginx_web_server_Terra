#!/bin/sh

# Health check script for Nginx web server - terrasofthq COMPREHENSION TEST
# Checks root path for HTTP 200(go 👍🏽) OK response

# Perform HTTP request to localhost on configured port
RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:8002/)

# Check if response is successful (200 OK)
if [ "$RESPONSE" -eq 200 ]; then
    exit 0  # Healthy ✅
else
    exit 1  # Unhealthy 😩
fi