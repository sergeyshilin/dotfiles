# Configure Pyenv
# 1. Install pyenv dependencies
sudo dnf install -y \
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
    xz-devel \
    perl-JSON-PP

# 2. Install pyenv
if [ ! -d ~/.pyenv ]; then
    curl https://pyenv.run | bash
fi

# Configure Pipx and Poetry
python3 -m pip install --user pipx
python3 -m pipx ensurepath
pipx install poetry
