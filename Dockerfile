# Use the official Ubuntu base image
FROM ubuntu:latest

# Define an ARG with a default value of .
ARG HOST_DIR_PATH=.

# Update the package list, install necessary tools, and Nano
RUN apt-get update && apt-get install -y \
    nano \
    git \
    cmake \
    build-essential \
    curl

# Clone the OpenCV repository
RUN git clone https://github.com/opencv/opencv.git

# Build and install OpenCV in the environment
RUN mkdir -p opencv/build && \
    cd opencv/build/ && \
    cmake .. && \
    make -j4 && \
    make install

# Download an image
RUN curl https://www.python.org/static/apple-touch-icon-144x144-precomposed.png > image.png

# Create a directory in the container to copy host directory content
RUN mkdir -p /app

# Copy the content of the host directory into the container
COPY $HOST_DIR_PATH /app/

# Start a shell when the container runs
CMD ["bash"]
