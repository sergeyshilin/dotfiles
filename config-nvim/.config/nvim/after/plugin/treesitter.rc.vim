if !exists('g:loaded_nvim_treesitter')
  echom "Treesitter is not loaded!"
  finish
endif

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {
      "html",
    },
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "bash",
    "css",
    "dockerfile",
    "html",
    "javascript",
    "json",
    "lua",
    "make",
    "markdown",
    "python",
    "rust",
    "svelte",
    "tsx",
    "typescript",
    "toml",
    "vim",
    "yaml",
  },
  autotag = {
    enable = true,
  }
}
EOF
