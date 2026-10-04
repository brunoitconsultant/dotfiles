#!/bin/bash
echo "Installing your premium workspace tools..."
sudo apt update && sudo apt install -y tmux eza build-essential vim

echo "Linking configuration profiles..."
ln -sf ~/dotfiles/bashrc ~/.bashrc
ln -sf ~/dotfiles/vimrc ~/.vimrc
ln -sf ~/dotfiles/tmux.conf ~/.tmux.conf

cd ~

echo "Workspace successfully restored!"
echo "👉 To activate your custom theme, run: source ~/.bashrc"