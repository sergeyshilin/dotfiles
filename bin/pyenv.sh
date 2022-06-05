# Configure Pyenv
# 1. Install pyenv dependencies
sudo dnf install \
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
curl https://pyenv.run | bash

