# Install dependencies:
dnf install -y
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

# Copy sway backgroung
mkdir -p $HOME/Pictures/backgrounds
cp -p images/framework-bg-3x2.jpeg $HOME/Pictures/backgrounds/

# Configure neovim: install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Run stow to create symlinks for all configs

# Cleanup
rm -rf $TEMP_BOOTSTRAP_FOLDER
