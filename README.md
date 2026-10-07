##  RUN IN POWERSHELL:
### > RESET YOUR LINUX DISTRO
wsl --unregister Ubuntu ; wsl --install -d Ubuntu

### > OPEN YOUR LINUX DISTRO
wsl -d Ubuntu

##  RUN IN BASH
### > INSTALL A FRESH COPY OF THIS SETUP
git clone https://brunoitconsultant@github.com/brunoitconsultant/dotfiles.git ~/dotfiles ;
cd ~/dotfiles ;
chmod +x install.sh ;
./install.sh ;

### > OPEN IDE (aka: wsl and tmux alredy istalled)
cd ~/dotfiles ;
./ide.sh ;

### > DETACH FROM IDE (aka: tmux: (Ctr + B + d)
detach Tmux ;
