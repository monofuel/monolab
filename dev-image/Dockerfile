FROM linuxserver/code-server

# TODO use github.com/monofuel/monoboot scripts

# TODO change default username
# TODO change default shell

# Setup dev environment
RUN apt update
RUN apt install -y ansible build-essential python-pip nmap tmux vim

RUN apt install -y lua5.3 wget fish liblua5.3-dev liblua5.3 unzip

RUN usermod -l monofuel abc
RUN groupmod -n monofuel abc
RUN chsh -s /bin/bash monofuel
RUN sed -i 's/abc/monofuel/g' /etc/cont-init.d/10-adduser
RUN sed -i 's/abc/monofuel/g' /etc/cont-init.d/30-config
RUN sed -i 's/abc/monofuel/g' /etc/services.d/code-server/run