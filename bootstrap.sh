# Install dependencies:
sudo dnf install -y
    sway \
    waybar \
    playerctl \
    pavucontrol \
    blueman \
    fontawesome-fonts \
    fontawesome-fonts-web \
    brightnessctl \
    network-manager-applet \
    wtype \
    git \
    zsh \
    neovim \
    vifm \
    stow \
    htop

sudo ln -s $(which nvim) /usr/local/bin/vim

# Pre-installation steps
TEMP_BOOTSTRAP_FOLDER = $HOME/temp-bootstrap
mkdir -p $TEMP_BOOTSTRAP_FOLDER

# Make zsh main shell
chsh -s /bin/zsh

# Download and install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install powerlevel10k as the main zsh theme
# 1. Download MesloLGS NF fonts
mkdir -p $HOME/.fonts/
mkdir -p $HOME/.fonts/meslolgs-nf/
curl -Lo $TEMP_BOOTSTRAP_FOLDER/meslo-regular.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
curl -Lo $TEMP_BOOTSTRAP_FOLDER/meslo-bold.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
curl -Lo $TEMP_BOOTSTRAP_FOLDER/meslo-italic.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
curl -Lo $TEMP_BOOTSTRAP_FOLDER/meslo-bold-italic.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
mv $TEMP_BOOTSTRAP_FOLDER/*.ttf $HOME/.fonts/meslolgs-nf/

# 2. Install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Install oh-my-zsh plugins
# 1. Zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Copy sway background
mkdir -p $HOME/Pictures/backgrounds
cp -p images/background.jpg $HOME/Pictures/backgrounds/

# Configure Pyenv
# 1. Install pyenv dependencies
dnf install \
    make \
    gcc \
    zlib-devel \
    bzip2 \
    bzip2-devel \
    readline-devel \
    sqlite \
    sqlite-devel \
    openssl-devel \
    tk-devel \
    libffi-devel \
    xz-devel

# 2. Install pyenv
curl https://pyenv.run | bash

# Configure neovim: install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

sudo dnf install -y \
    nodejs \
    fzf \
    ripgrep \
    fd-find

sudo npm install -g yarn
sudo npm install -g tree-sitter-cli
sudo npm install -g pyright

# Neovim: install python environment
pyenv install 3.10.2
pyenv virtualenv 3.10.2 neovim
pyenv activate neovim
pip install pynvim flake8 black
sudo ln -s `which pyenv flake8` /usr/local/bin/flake8
sudo ln -s `which pyenv black` /usr/local/bin/black
pyenv deactivate

# Run stow to create symlinks for all configs
stow config
stow git
stow zsh
stow bash

# Cleanup
rm -rf $TEMP_BOOTSTRAP_FOLDER
