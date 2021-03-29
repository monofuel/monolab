FROM linuxserver/code-server

# TODO use github.com/monofuel/monoboot scripts

# TODO set passwd / sudo

# Setup dev environment
RUN apt update
RUN apt install -y apt-transport-https gnupg2 curl lsb-release
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN curl https://baltocdn.com/helm/signing.asc | apt-key add -
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
RUN echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list
RUN echo "deb https://baltocdn.com/helm/stable/debian/ all main" | tee /etc/apt/sources.list.d/helm-stable-debian.list
RUN echo "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list
RUN apt update

RUN apt install -y ansible build-essential terraform packer python-pip nmap tmux vim lua5.3 wget fish liblua5.3-dev liblua5.3 unzip sudo kubectl helm

# TODO aws shell
# pip install aws-shell

RUN usermod -l monofuel abc
RUN groupmod -n monofuel abc
RUN gpasswd -a monofuel sudo

# HACK not great, but it's probably fine (tm)
# TODO should set SUDO_PASSWORD_HASH instead
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN chsh -s /bin/bash monofuel
RUN sed -i 's/abc/monofuel/g' /etc/cont-init.d/10-adduser
RUN sed -i 's/abc/monofuel/g' /etc/cont-init.d/30-config
# -R was very very very very slow
RUN sed -i 's/chown -R/chown /g' /etc/cont-init.d/30-config
RUN sed -i 's/abc/monofuel/g' /etc/services.d/code-server/run
