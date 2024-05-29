# Use the latest Ubuntu image
FROM ubuntu:latest

ENV CC_MOUNT_DOCKER_SOCKET=true
ENV CC_DOCKER_FIXED_CIDR_V6=true
ENV CC_MOUNT_DOCKER_SOCKET=true
ENV CC_WORKER_RESTART=no

# Update and install required packages
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip htop wget curl sudo nano adb

# Set the working directory
WORKDIR /app

# Install JupyterLab
RUN pip3 install jupyterlab

# Expose port 8080
EXPOSE 8080

# Start JupyterLab on port 8080 without authentication
CMD ["python3", "-m", "http.server", "8080"]
