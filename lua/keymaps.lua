-- Open floating git status window (neo-tree)
vim.keymap.set('n', '<C-g>', function()
    vim.cmd 'Neotree float git_status <CR>'
end)
vim.keymap.set('n', '<C-b>', function()
    vim.cmd 'Neotree float buffers <CR>'
end)

-- Open new terminal session within nvim
vim.keymap.set('n', '<leader>cw', '<cmd>silent !kitty %:p:h<CR>', { desc = '[C]reate new terminal [W]indow' })

-- Reminders to use hjkl
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move left!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move right!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move up!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move down!!"<CR>')

-- Create and remove custom logs
require 'my-plugins.custom-logger'

vim.keymap.set('n', '<leader>cl', CustomLogger, { desc = '[C]reate [L]og' })
vim.keymap.set('n', '<leader>c ', RemoveCustomLogs, { desc = '[C]lear[ ]logs' })

-- Rename symbol under cursor
vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, { desc = '[C]urrent symbol [R]ename' })
