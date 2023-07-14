# Fail on any command.
set -eux pipefail

# Update your software repositories.
sudo apt-get update
sudo apt-get upgrade

# Install exa (better "ls" command)
sudo apt install exa

# Install ZSH
sudo apt install -y git-core zsh curl
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install plug-ins (you can git-pull to update them later).
cd ~/.oh-my-zsh/custom/plugins && git clone https://github.com/zsh-users/zsh-syntax-highlighting
cd ~/.oh-my-zsh/custom/plugins && git clone https://github.com/zsh-users/zsh-autosuggestions

# Install font
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Meslo.zip
sudo apt install unzip
unzip Meslo.zip -d ~/.fonts
sudo apt install fontconfig
fc-cache -fv

# Install powerlevel10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Replace the configs with the saved one.
sudo cp ~/ubuntu-setup/terminal-config/.zshrc ~/.zshrc
sudo cp ~/ubuntu-setup/terminal-config/.p10k.zsh ~/.p10k.zsh

# Switch the shell.
chsh -s $(which zsh)
