set number
set encoding=utf-8
set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.
set shiftwidth=4    " Indents will have a width of 4
set softtabstop=4   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces

" Set python provider
let g:python3_host_prog = '~/.pyenv/versions/neovim/bin/python3'
let g:loaded_python_provider = 0 " disable python2 support


call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" Theme
Plug 'sainnhe/sonokai' " monokai-inspired theme

" Environment
Plug 'nvim-lualine/lualine.nvim' " status bar
Plug 'kyazdani42/nvim-web-devicons' " icons in the status bar
Plug 'vifm/vifm.vim' " file manager
Plug 'tpope/vim-fugitive' " Git basics with :Git and more
Plug 'justinmk/vim-sneak' " Multi-line navigation
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'nvim-telescope/telescope.nvim' " Fuzzy finder and grep
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'norcalli/nvim-colorizer.lua' " css color highlighter

" LSP
Plug 'neovim/nvim-lspconfig' " Collection of configurations for built-in LSP client
Plug 'hrsh7th/nvim-cmp' " Autocompletion plugin
Plug 'hrsh7th/cmp-buffer' " Cmp for buffer words
Plug 'hrsh7th/cmp-path' " Cmp for filesystem paths
Plug 'hrsh7th/cmp-cmdline' " Cmp for vim's cmdline
Plug 'hrsh7th/cmp-nvim-lsp' " LSP source for nvim-cmp
Plug 'saadparwaiz1/cmp_luasnip' " Snippets source for nvim-cmp
Plug 'L3MON4D3/LuaSnip' " Snippets plugin
Plug 'onsails/lspkind-nvim' " Icons in autocompletion popus
Plug 'windwp/nvim-autopairs' " Autocomplete brackets and arguments
Plug 'ray-x/lsp_signature.nvim' " Function arguments hints

" Coding
Plug 'mhartington/formatter.nvim' " Easy code formatting
Plug 'numToStr/Comment.nvim' " Toggle comment/uncomment
Plug 'mfussenegger/nvim-dap' " Debugging
Plug 'mfussenegger/nvim-dap-python' " Debugging - python adapter

" Other plugins
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
call plug#end()

" Enable yanked highlighting
lua require('highlight-yanked')

" Important!!
if has('termguicolors')
  set termguicolors
endif

" The configuration options should be placed before `colorscheme sonokai`.
let g:sonokai_style = 'default'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1
colorscheme sonokai

" Sneak settings
let g:sneak#label = 1

" Use vifm as default file viewer instead of netrw
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
let g:vifm_replace_netrw = 1
let g:vifm_embed_term = 1
let g:vifm_embed_split = 1
nnoremap <silent> \v <cmd>rightbelow horizontal 30TabVifm<cr>
