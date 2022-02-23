local status, formatter = pcall(require, "formatter")
if (not status) then return end

formatter.setup({
  filetype = {
    python = {
      -- Configure for psf/black
      function ()
        return {
          exe = "black",
          args = { '-' },
          stdin = true,
        }
      end
    }
  }
})

local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>f', '<cmd>:Format<CR>', opts)

vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.py FormatWrite
augroup END
]], true)
