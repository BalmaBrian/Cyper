# Base image for the cyper editor is ubuntu since it is the most commently used linux distro amoung my peers
FROM ubuntu:latest

# Installing updates and dependencies
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y sudo ctags curl wget man gcc make git vim

# Creating the user Cyper
RUN adduser --disabled-password --gecos '' cyper
RUN adduser cyper sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Seting up enviorment as Cyper
USER cyper
WORKDIR /home/cyper
RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.1/zsh-in-docker.sh)" -- \
    -t half-life
RUN git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
RUN sh ~/.vim_runtime/install_awesome_vimrc.sh
