FROM linuxserver/code-server

# TODO use github.com/monofuel/monoboot scripts

# TODO set passwd / sudo

# Setup dev environment
RUN apt update
RUN apt install -y apt-transport-https gnupg2 curl
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list
RUN apt update

RUN apt install -y ansible build-essential python-pip nmap tmux vim lua5.3 wget fish liblua5.3-dev liblua5.3 unzip sudo

RUN usermod -l monofuel abc
RUN groupmod -n monofuel abc
RUN gpasswd -a monofuel wheel

# HACK not great, but it's probably fine (tm)
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN chsh -s /bin/bash monofuel
RUN sed -i 's/abc/monofuel/g' /etc/cont-init.d/10-adduser
RUN sed -i 's/abc/monofuel/g' /etc/cont-init.d/30-config
RUN sed -i 's/abc/monofuel/g' /etc/services.d/code-server/run