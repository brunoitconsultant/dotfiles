#!/bin/bash
echo "1/4: Installing premium workspace tools..."
sudo apt update && sudo apt install -y tmux eza build-essential clang vim git

echo "2/4: Configuring global Git identity settings..."
git config --global user.email "bruno.itconsultant@gmail.com"
git config --global user.name "brunoitconsultant"
git config --global init.defaultBranch main

echo "3/4: Linking configuration profiles..."
ln -sf ~/dotfiles/bashrc ~/.bashrc
ln -sf ~/dotfiles/vimrc ~/.vimrc
ln -sf ~/dotfiles/tmux.conf ~/.tmux.conf

echo "4/4: Setting up development environment..."
chmod +x ~/dotfiles/ide.sh

if ! grep -q "alias ide=" ~/dotfiles/bashrc; then
    echo "alias ide='~/dotfiles/ide.sh'" >> ~/dotfiles/bashrc
    echo "Global shortcut 'ide' added to your dotfiles profile!"
fi

echo "Workspace successfully restored! Launching layout..."
~/dotfiles/ide.sh
