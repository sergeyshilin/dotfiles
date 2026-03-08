local status, formatter = pcall(require, "formatter")
if (not status) then return end

local function venv_bin(name)
  local venv = os.getenv("VIRTUAL_ENV") or ".venv"
  return venv .. "/bin/" .. name
end


function RuffFormatter()
  return {
    exe = venv_bin("ruff"),
    args = { "format", "-" },
    stdin = true,
  }
end

function BlackFormatter()
  return {
    exe = venv_bin("black"),
    args = { '-' },
    stdin = true,
  }
end

function PythonFormatter()
  local ruff = venv_bin("ruff")
  local black = venv_bin("black")

  if vim.fn.executable(ruff) == 1 then
    return RuffFormatter()
  elseif vim.fn.executable(black) == 1 then
    return BlackFormatter()
  else
    error("Neither ruff nor black found in virtual environment")
  end
end

function PrettierFormatter()
  local local_bin = vim.fn.findfile("node_modules/.bin/prettier", ".;")
  return {
    exe = local_bin ~= "" and local_bin or "prettier",
    args = {
      "--stdin-filepath",
      '"' .. vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) .. '"',
      "--plugin-search-dir=."
    },
    stdin = true
  }
end


function RustFormatter()
  return {
    exe = "rustfmt",
    args = { "--emit=stdout" },
    stdin = true,
  }
end

formatter.setup({
  filetype = {
    python = {
      PythonFormatter
    },
    javascript = {
      PrettierFormatter
    },
    javascriptreact = {
      PrettierFormatter
    },
    typescript = {
      PrettierFormatter
    },
    typescriptreact = {
      PrettierFormatter
    },
    json = {
      PrettierFormatter
    },
    html = {
      PrettierFormatter
    },
    svelte = {
      PrettierFormatter
    },
    css = {
      PrettierFormatter
    },
    rust = {
      RustFormatter
    },
  }
})

local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>f', '<cmd>:Format<CR>', opts)

vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.py,*.json,*.html,*.js,*.jsx,*.mjs,*.cjs,*.css,*.ts,*.tsx,*.svelte,*.rs FormatWrite
augroup END
]], true)
