# Install dependencies:
sudo dnf install -y
    sway \
    waybar \
    playerctl \
    pavucontrol \
    blueman \
    brightnessctl \
    network-manager-applet \
    wtype

# Copy sway background
mkdir -p $HOME/Pictures/backgrounds
cp -p images/background.jpg $HOME/Pictures/backgrounds/
