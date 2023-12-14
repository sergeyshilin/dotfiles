local status, indents = pcall(require, "ibl")
if (not status) then return end

local hooks = require "ibl.hooks"

vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

indents.setup{}
