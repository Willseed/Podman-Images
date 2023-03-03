# base on redhat 8 Linux
FROM registry.access.redhat.com/ubi8/ubi:latest

# upgrade package and install curl tool
RUN dnf -y upgrade && dnf -y install curl

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

# install jdk
RUN dnf install -y java-17-openjdk.x86_64

# install maven
RUN dnf install -y maven
