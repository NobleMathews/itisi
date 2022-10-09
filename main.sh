if ! [ -x "$(command -v sudo)" ]
then
# Get SUDO in docker root
apt-get update && apt-get install -y sudo git
# Get git plugin working in docker instance
git config --global --add safe.directory '*'
fi
# Install ZSH and make it default
sudo apt-get install -y git curl zsh tmux
chsh -s /usr/bin/zsh
# Install oh-my-zsh
yes | sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
# Get plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
sed -i 's/^plugins=(/plugins=(zsh-autosuggestions zsh-syntax-highlighting /g' ~/.zshrc
# Conda setup and create
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
chmod +x ~/miniconda.sh
~/miniconda.sh -b
source ~/miniconda3/bin/activate
conda init zsh
# Git SSH Auth
mkdir ~/.ssh
yes "" | ssh-keygen -t ed25519 -C "55821103+NobleMathews@users.noreply.github.com" -N "" >&- 2>&-
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
clear
echo "Copy key below into https://github.com/settings/keys as an SSH Key make sure to remove once it is not required anymore!"
cat ~/.ssh/id_ed25519.pub
#source ~/.zshrc
/usr/bin/zsh