# Creating a temp folder
TEMP_BOOTSTRAP_FOLDER=$HOME/.tmp/neovim
mkdir -p $TEMP_BOOTSTRAP_FOLDER

sudo dnf install -y neovim

# Making a symlink for vim to point to neovim
sudo rm -f /usr/local/bin/vim
sudo ln -s $(which nvim) /usr/local/bin/vim

# Install pyenv-pyright for a neovim support
PYENV_PYRIGHT_URL=https://github.com/alefpereira/pyenv-pyright.git
PYENV_PYRIGHT=$(pyenv root)/plugins/pyenv-pyright

if ! git clone "${PYENV_PYRIGHT_URL}" "${PYENV_PYRIGHT}" 2>/dev/null && [ -d "${PYENV_PYRIGHT}" ] ; then
    echo "Clone skipped because pyenv-pyright folder ${PYENV_PYRIGHT} exists"
fi

# Configure neovim: install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

sudo dnf install -y \
    glibc-static \
    libstdc++-static \
    gcc-c++ \
    rust \
    cargo \
    nodejs \
    fzf \
    ripgrep \
    fd-find

# Install neovim python environment
pyenv install 3.10.2
pyenv virtualenv 3.10.2 neovim
NEOVIM_PYENV_ROOT=${PYENV_ROOT}/versions/neovim
${NEOVIM_PYENV_ROOT}/bin/pip install pynvim flake8 black debugpy
sudo rm -f /usr/local/bin/flake8
sudo rm -f /usr/local/bin/black
sudo ln -s ${NEOVIM_PYENV_ROOT}/bin/flake8 /usr/local/bin/flake8
sudo ln -s ${NEOVIM_PYENV_ROOT}/bin/black /usr/local/bin/black

# Install neovim lua environment
curl -Lo $TEMP_BOOTSTRAP_FOLDER/lua-language-server.tar.gz https://github.com/sumneko/lua-language-server/releases/download/2.6.6/lua-language-server-2.6.6-linux-x64.tar.gz
mkdir -p $HOME/thirdparty/lua
tar -xzf $TEMP_BOOTSTRAP_FOLDER/lua-language-server.tar.gz -C $HOME/thirdparty/lua

# Cleanup
rm -rf $TEMP_BOOTSTRAP_FOLDER
