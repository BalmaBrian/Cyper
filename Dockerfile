# This version of Cyper will just zsh and spacevim installed

FROM ubuntu:18.04

# Updating & Upgrading
RUN apt-get -y update
RUN apt-get -y upgrade

# Installing dependencies 
RUN apt install -y wget curl git tmux bash ctags unzip vim

# Installing Zsh
RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.1/zsh-in-docker.sh)" -- \
    -t half-life
