#  RUN IN POWERSHELL:
#  A. RESET YOUR LINUX DISTRO
wsl --unregister Ubuntu ; wsl --install -d Ubuntu

#  B. OPEN YOUR LINUX DISTRO
wsl -d Ubuntu

#  C. INSTALL A FRESH COPY OF THIS SETUP
git clone https://brunoitconsultant@github.com/brunoitconsultant/dotfiles.git ~/dotfiles \
    && cd ~/dotfiles \
    && chmod +x install.sh \
    && ./install.sh

#  RUN IN BASH
#  A. OPEN IDE (aka: wsl and tmux alredy istalled)
cd ~/dotfiles \
    && ./ide.sh

#  B. DETACH FROM IDE (aka: tmux: (Ctr + B + d)
detach Tmux
