local ts = require("nvim-treesitter")

ts.setup({
  install_dir = vim.fn.stdpath("data") .. "/site",
})

ts.install({
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
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
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
    "typescript",
    "typescriptreact",
    "toml",
    "vim",
    "yaml",
  },
  callback = function()
    vim.treesitter.start()
  end,
})
