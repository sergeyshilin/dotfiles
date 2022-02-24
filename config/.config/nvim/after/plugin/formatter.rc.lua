local status, formatter = pcall(require, "formatter")
if (not status) then return end

function BlackFormatter()
  return {
    exe = "black",
    args = { '-' },
    stdin = true,
  }
end

function PrettierFormatter()
  return {
    exe = "prettier",
    args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
    stdin = true
  }
end

formatter.setup({
  filetype = {
    python = {
      BlackFormatter
    },
    javascript = {
      PrettierFormatter
    },
    typescript = {
      PrettierFormatter
    },
    json = {
      PrettierFormatter
    },
    svelte = {
      PrettierFormatter
    },
  }
})

local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>f', '<cmd>:Format<CR>', opts)

vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.py,*.json,*.js,*.ts,*.tsx,*.svelte FormatWrite
augroup END
]], true)
