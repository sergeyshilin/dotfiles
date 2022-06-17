echo "Enabling RPM Fusion free repo..."
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

echo "Installing base packages..."
sudo dnf install -y util-linux-user \
	ffmpeg \
	git \
	stow \
	htop \
	alacritty \
    vifm
