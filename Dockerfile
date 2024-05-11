FROM node:latest AS development-environment


# Debian - Install Git (2024-05-02T07:27:57-07:00 Mattifesto)

RUN apt-get update
RUN apt-get install -y git
RUN git config --global pull.ff only
RUN git config --global core.editor "code --wait"


# Debian - Install Docker (2024-02-26)
# https://docs.docker.com/engine/install/debian/

# Add Docker's official GPG key:
RUN apt-get update
RUN apt-get install -y ca-certificates curl
RUN install -m 0755 -d /etc/apt/keyrings
RUN curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
RUN chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
RUN echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null
RUN apt-get update

RUN apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin


# Debian - Install ack (MC v1)

RUN apt-get update
RUN apt-get install -y ack


# Install ESLint (MC v1)

RUN npm install -g eslint
