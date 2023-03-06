# Use Red Hat 8 Linux UBI image as the base image
FROM registry.access.redhat.com/ubi8/ubi:latest

# Install curl and Java 17 development package
RUN dnf -y upgrade \
    dnf -y install curl \
    dnf -y install java-17-openjdk-devel

# Set alias for 'll' command to list files with more details
RUN echo "alias ll='ls -l --color=auto'" >> /etc/bashrc

# Set Node.js version environment variable
ENV NODE_VERSION=18.14.2

# Download and run NVM installation script
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

# Install Node.js and set default version
RUN . "/root/.nvm/nvm.sh" && \
    nvm install ${NODE_VERSION} && \
    nvm use v${NODE_VERSION} && \
    nvm alias default v${NODE_VERSION}

# Set Node.js environment variable to include its binary directory in the PATH
ENV PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"

# Upgrade npm package to the latest version
RUN npm install -g npm@latest

# Check Node.js and npm version
RUN node --version && npm --version
