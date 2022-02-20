if !exists('g:loaded_nvim_treesitter')
  echom "Treesitter is not loaded!"
  finish
endif

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "bash",
    "json",
    "markdown",
    "python",
    "toml",
    "yaml",
  },
  autotag = {
    enable = true,
  }
}
EOF
