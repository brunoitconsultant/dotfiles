#!/bin/bash
# wsl --unregister Ubuntu ; wsl --install -d Ubuntu

git config --global credential.helper 'cache --timeout=900' \
    && git clone https://brunoitconsultant@github.com/brunoitconsultant/learning_c.git ~/learning_c \
    && git clone https://brunoitconsultant@github.com/brunoitconsultant/dotfiles.git ~/dotfiles \
    && cd ~/dotfiles \
    && chmod +x install.sh \
    && ./install.sh

# detach Tmux => (Ctr + B + d)	
