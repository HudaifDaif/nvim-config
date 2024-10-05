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

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
