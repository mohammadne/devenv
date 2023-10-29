FROM ubuntu:22.04

# Set the working directory inside the container
# Clone the current Git repository into the container
WORKDIR /opt/workspace/devenv
COPY . /opt/workspace/devenv

SHELL ["/bin/bash", "-c"]
