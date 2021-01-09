# This builds a alpine container with a vim development enviorment
FROM alpine:latest
WORKDIR /root

# Updating and installing tools
RUN apk update
RUN apk add asciinema bash build-base ctags curl gcc gifsicle git imagemagick neovim nodejs npm openjdk11 openssh python3 py3-pip tmux wget zsh-vcs
RUN npm install -g npm@latest
RUN npm install -g import-js --unsafe-perm
RUN npm install -g asciicast2gif --unsafe-perm
RUN npm install -g eslint vscode-html-languageserver-bin neovim prettier remark remark-cli remark-stringify remark-frontmatter wcwidth typescript typescript-formatter
RUN pip install isort pylint yapf

# Installing zsh with half life theme
RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.1/zsh-in-docker.sh)" -- \
    -t half-life
COPY src/passwd /etc/
COPY src/.tmux.conf /root/

# Installing SpaceVim
RUN curl -sLf https://spacevim.org/install.sh | bash
COPY src/init.toml /root/.SpaceVim.d/
COPY src/vimproc_unix.so /root/.SpaceVim/bundle/vimproc.vim/lib/
COPY src/main.shada /root/.local/share/nvim/shada/
