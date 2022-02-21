local status, lsp_signature = pcall(require, "lsp_signature")
if (not status) then return end

lsp_signature.setup({
  debug = false,
  hint_enable = false,
  handler_opts = { border = "single" },
  max_width = 80,
})

