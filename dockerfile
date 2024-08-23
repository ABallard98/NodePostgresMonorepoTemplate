FROM node:18-bullseye-slim
WORKDIR /code

CMD ["/bin/bash"]

# install various useful system tools
RUN apt update && apt install -y \
  apt-transport-https \
  ca-certificates \
  curl \
  g++ \
  gcc \
  git \
  gnupg \
  jq \
  lsb-release \
  make \
  net-tools \
  postgresql-client \
  procps \
  python3 \
  python3-pip \
  tree \
  vim \
  wget \
  unzip \
  coreutils \
  dnsmasq

# install docker cli
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg && \
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null && \
  apt update && apt install -y docker-ce-cli

RUN npm config set cache /code/.npm --global
RUN npm config set prefer-offline true --global
RUN npm config set fund false --global
RUN npm install -g npm@9.9.0

# create directories to keep artifacts from bleeding into host
RUN mkdir node_modules && \
  mkdir .nx_cache && \
  mkdir dist && \
  mkdir tmp

# copy files
COPY ./.npm* ./
COPY ./package.json ./package-lock.json ./
RUN export PUPPETEER_SKIP_DOWNLOAD=true
RUN npm ci --include=optional
