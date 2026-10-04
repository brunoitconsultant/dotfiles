#!/bin/bash
echo "Installing your premium workspace tools..."
sudo apt update && sudo apt install -y tmux eza build-essential vim git

echo "Configuring global Git identity settings..."
git config --global user.email "bruno.itconsultant@gmail.com"
git config --global user.name "brunoitconsultant"
git config --global init.defaultBranch main

echo "Linking configuration profiles..."
ln -sf ~/dotfiles/bashrc ~/.bashrc
ln -sf ~/dotfiles/vimrc ~/.vimrc
ln -sf ~/dotfiles/tmux.conf ~/.tmux.conf

echo "Workspace successfully restored!"
