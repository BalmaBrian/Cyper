FROM ubuntu:18.04

# Adding ppa & Installing basic tools
RUN apt-get update && apt-get -y upgrade && apt-get install -y sudo bash software-properties-common
RUN add-apt-repository ppa:neovim-ppa/stable
RUN apt-get update

# Adding user
RUN adduser --disabled-password --gecos '' cyper
RUN adduser cyper sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Setting user env
USER cyper
WORKDIR /home/cyper

# Installing tools
RUN sudo apt-get install -y build-essential ctags curl fuse gcc git make silversearcher-ag tmux unzip wget
RUN curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
RUN sudo apt-get install -y nodejs

# Installing Zsh with Half Life shell theme
RUN sudo sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.1/zsh-in-docker.sh)" -- \
    -t half-life

# Setting up nvim
RUN sudo apt-get install -y neovim
RUN mkdir .config
RUN mkdir .config/nvim
RUN curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
COPY src/init.vim /home/cyper/.config/nvim/
COPY src/coc-settings.json /home/cyper/.config/nvim/
