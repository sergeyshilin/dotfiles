#!/bin/bash

# Creating a temp folder
TEMP_BOOTSTRAP_FOLDER=$HOME/.tmp/zsh
mkdir -p $TEMP_BOOTSTRAP_FOLDER

sudo dnf install -y zsh

# Make zsh main shell
chsh -s $(which zsh)

# Download and install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install powerlevel10k as the main zsh theme
# -- Download MesloLGS NF fonts
mkdir -p $HOME/.fonts/
mkdir -p $HOME/.fonts/meslolgs-nf/
curl -Lo $TEMP_BOOTSTRAP_FOLDER/meslo-regular.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
curl -Lo $TEMP_BOOTSTRAP_FOLDER/meslo-bold.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
curl -Lo $TEMP_BOOTSTRAP_FOLDER/meslo-italic.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
curl -Lo $TEMP_BOOTSTRAP_FOLDER/meslo-bold-italic.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
mv $TEMP_BOOTSTRAP_FOLDER/*.ttf $HOME/.fonts/meslolgs-nf/

# -- Install powerlevel10k
POWER_LEVEL_10K=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
POWER_LEVEL_URL=https://github.com/romkatv/powerlevel10k.git 

if ! git clone --depth=1 "${POWER_LEVEL_URL}" "${POWER_LEVEL_10K}" 2>/dev/null && [ -d "${POWER_LEVEL_10K}" ] ; then
    echo "Clone skipped because powerlevel10k folder ${POWER_LEVEL_10K} exists"
fi

# Install oh-my-zsh plugins
# 1. Zsh-autosuggestions
ZSH_AUTOSUGGESTIONS=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
ZSH_AUTOSUGGESTIONS_URL=https://github.com/zsh-users/zsh-autosuggestions 

if ! git clone "${ZSH_AUTOSUGGESTIONS_URL}" "${ZSH_AUTOSUGGESTIONS}" 2>/dev/null && [ -d "${ZSH_AUTOSUGGESTIONS}" ] ; then
    echo "Clone skipped because zsh-autosuggestions folder ${ZSH_AUTOSUGGESTIONS} exists"
fi

# Cleanup
rm -rf $TEMP_BOOTSTRAP_FOLDER

touch ~/.zprofile-private
