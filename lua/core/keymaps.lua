-- General keybindings not specific to plugins

local keymap = vim.keymap.set

-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Clear search highlights
keymap('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic navigation
keymap('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Terminal mode exit
keymap('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Window navigation
keymap('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to left window' })
keymap('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to right window' })
keymap('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to lower window' })
keymap('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to upper window' })
