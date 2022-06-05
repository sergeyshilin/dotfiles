# Creating a temp folder
TEMP_BOOTSTRAP_FOLDER=$HOME/.tmp/neovim
mkdir -p $TEMP_BOOTSTRAP_FOLDER

sudo dnf install neovim

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
    rust \
    cargo \
    nodejs \
    fzf \
    ripgrep \
    fd-find

sudo npm install -g \
    yarn \
    tree-sitter-cli \
    pyright \
    typescript \
    bash-language-server \
    vim-language-server \
    diagnostic-languageserver \
    typescript-language-server \
    svelte-language-server \
    prettier \
    prettier-plugin-svelte \
    prettier-plugin-tailwindcss \
    eslint

# Install neovim python environment
pyenv install 3.10.2
pyenv virtualenv 3.10.2 neovim
pyenv activate neovim
pip install pynvim flake8 black debugpy
sudo ln -s `which pyenv flake8` /usr/local/bin/flake8
sudo ln -s `which pyenv black` /usr/local/bin/black
pyenv deactivate

# Install neovim lua environment
curl -Lo $TEMP_BOOTSTRAP_FOLDER/lua-server.tar.gz https://github.com/sumneko/lua-language-server/releases/download/2.6.6/lua-language-server-2.6.6-linux-x64.tar.gz
mkdir -p $HOME/thirdparty/lua
tar -xzf $TEMP_BOOTSTRAP_FOLDER/lua-language-server.tar.gz -C $HOME/thirdparty/lua

# Cleanup
rm -rf $TEMP_BOOTSTRAP_FOLDER
