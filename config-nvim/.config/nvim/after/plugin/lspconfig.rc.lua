local lsp_cmp = require("cmp_nvim_lsp")

vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, { noremap = true, silent = true })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { noremap = true, silent = true })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { noremap = true, silent = true })
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, { noremap = true, silent = true })

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = lsp_cmp.default_capabilities(capabilities)

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local bufnr = event.buf
    local opts = { noremap = true, silent = true, buffer = bufnr }

    vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set("n", "<space>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<space>f", function()
      vim.lsp.buf.format({ async = true })
    end, opts)
  end,
})

local default_config = {
  capabilities = capabilities,
}

vim.lsp.config("pyright", vim.tbl_deep_extend("force", default_config, {
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true,
      },
    },
  },
}))

vim.lsp.config("lua_ls", vim.tbl_deep_extend("force", default_config, {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
}))

vim.lsp.config("ts_ls", default_config)
vim.lsp.config("svelte", default_config)
vim.lsp.config("vimls", default_config)
vim.lsp.config("bashls", default_config)
vim.lsp.config("rust_analyzer", default_config)

vim.lsp.enable({
  "pyright",
  "lua_ls",
  "ts_ls",
  "svelte",
  "vimls",
  "bashls",
  "rust_analyzer",
})
