call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" Sonokai (Monokai-inspired) theme
Plug 'sainnhe/sonokai'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Initialize plugin system
call plug#end()

" Important!!
if has('termguicolors')
  set termguicolors
endif

" The configuration options should be placed before `colorscheme sonokai`.
let g:sonokai_style = 'default'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1
colorscheme sonokai
