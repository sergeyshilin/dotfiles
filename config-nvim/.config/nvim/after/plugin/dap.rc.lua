local status, dap_python = pcall(require, "dap-python")
if (not status) then return end


dap_python.setup("~/.pyenv/versions/neovim/bin/python")


local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap("n", "<F5>", "<cmd>lua require('dap').continue()<CR>", opts)
vim.api.nvim_set_keymap("n", "<F6>", "<cmd>lua require('dap').step_over()<CR>", opts)
vim.api.nvim_set_keymap("n", "<F7>", "<cmd>lua require('dap').step_into()<CR>", opts)
vim.api.nvim_set_keymap("n", "<F8>", "<cmd>lua require('dap').step_out()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>b", "<cmd>lua require('dap').toggle_breakpoint()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>B", "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>lp", "<cmd>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>dr", "<cmd>lua require('dap').repl.open()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>dl", "<cmd>lua require('dap').run_last()<CR>", opts)
