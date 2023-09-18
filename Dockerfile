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
    libgl1-mesa-dev \
    libgtk2.0-dev \
    pkg-config \
    curl \
    wget \
    unzip

# # Clone the OpenCV repository
# RUN git clone https://github.com/opencv/opencv.git

# # Build and install OpenCV in the environment
# RUN mkdir -p opencv/build && \
#     cd opencv/build/ && \
#     cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_TBB=ON -D BUILD_NEW_PYTHON_SUPPORT=ON -D WITH_V4L=ON -D INSTALL_C_EXAMPLES=ON -D INSTALL_PYTHON_EXAMPLES=ON -D BUILD_EXAMPLES=ON -D WITH_QT=ON -D WITH_GTK=ON -D WITH_OPENGL=ON .. && \
#     make -j8 && \
#     make install

# Setup Qt5.12.9
RUN apt-get -y update && DEBIAN_FRONTEND=noninteractive apt-get -y install \
    git \
    cmake \
    python3 \
    python3-pip \
    build-essential \
    libdbus-1-3 \
    libpulse-mainloop-glib0

RUN pip3 install aqtinstall

ARG QT=5.12.9
ARG QT_MODULES=all
ARG QT_HOST=linux
ARG QT_TARGET=desktop
ARG QT_ARCH=
RUN aqt install --outputdir /opt/qt ${QT} ${QT_HOST} ${QT_TARGET} ${QT_ARCH} -m ${QT_MODULES}

ENV PATH /opt/qt/${QT}/gcc_64/bin:$PATH
ENV QT_PLUGIN_PATH /opt/qt/${QT}/gcc_64/plugins/
ENV QML_IMPORT_PATH /opt/qt/${QT}/gcc_64/qml/
ENV QML2_IMPORT_PATH /opt/qt/${QT}/gcc_64/qml/

# Create a directory in the container to copy host directory content
RUN mkdir -p /root/app

# Copy the content of the host directory into the container
COPY $HOST_DIR_PATH /root/app/

# Download an image
RUN curl https://www.python.org/static/apple-touch-icon-144x144-precomposed.png > /root/app/test/image.png

# Start a shell when the container runs
CMD ["bash"]
