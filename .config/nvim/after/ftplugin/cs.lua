vim.opt.colorcolumn = '120'

vim.keymap.set({"n", "v"},  "<leader>f", "<cmd>FormatWrite<cr>" )

vim.cmd([[ 
    augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost * FormatWrite
    augroup END 
]])

local dap = require('dap')

dap.adapters.coreclr = {
  type = 'executable',
  command = '/home/jaco/code/netcoredbg/netcoredbg',
  args = {'--interpreter=vscode'}
}

dap.configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
        return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
    end,
  },
}

vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
vim.keymap.set("n", "<leader><F1>", dap.step_back)
vim.keymap.set("n", "<leader>i", dap.step_into)
vim.keymap.set("n", "<leader>v", dap.step_over)
vim.keymap.set("n", "<leader>u", dap.step_out)
vim.keymap.set("n", "<leader>c", dap.continue)


