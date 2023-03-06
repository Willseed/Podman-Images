# base on redhat 8 Linux
FROM registry.access.redhat.com/ubi8/ubi:latest

# upgrade package and install curl tool
RUN dnf -y upgrade && \
    dnf -y install curl && \
    dnf -y install wget

# set ll command
RUN echo "alias ll='ls -l --color=auto'" >> /etc/bashrc

# set node version environment
ENV NODE_VERSION=18.14.2

# clone nvm install shellscript
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

# set workdir
ENV NVM_DIR=/root/.nvm

# install nodejs
RUN . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION}

# set node environment variable
ENV PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"

# upgrade package
RUN npm install -g npm@latest

# check node version
RUN node --version

# check npm version
RUN npm --version

# get openjdk 17
RUN wget https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.6%2B10/OpenJDK17U-jdk_x64_linux_hotspot_17.0.6_10.tar.gz

# unzip tar.gz
RUN tar zxvf OpenJDK17U-jdk_x64_linux_hotspot_17.0.6_10.tar.gz

# set java home
ENV JAVA_HOME=/jdk-17.0.6+10

# set java environment variable
ENV PATH=$PATH:/jdk-17.0.6+10/bin
