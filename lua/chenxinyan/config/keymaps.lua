-- Set <space> as the leader key
-- See `:help mapleader`
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic/todo keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>xx', vim.diagnostic.open_float, { desc = 'Show diagnostic Error messages' })
vim.keymap.set('n', '<leader>xq', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

--  deleting/paste without yanking the deleted text into the register
vim.keymap.set('x', '<leader>p', '"_dP')
vim.keymap.set('n', 'x', '"_x')
vim.keymap.set('x', 'x', '"_x')

-- Open/Close buildin terminal
vim.keymap.set('n', '<C-t>', ':split<CR>:terminal<CR>', { desc = 'Open [T]erminal' })
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal' })
vim.keymap.set('t', '<C-c>', '<C-c><C-d>', { desc = 'Kill terminal' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Move selection up and down
vim.keymap.set('x', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('x', 'K', ":m '<-2<CR>gv=gv")

-- Keep cursor always in the middle when scrolling
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Yanking/deleting selection into system clipboard
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('x', '<leader>y', '"+y')
vim.keymap.set('x', '<leader>d', '"+d')
vim.keymap.set('n', '<leader>p', '"+p')

-- toggle spellcheck
vim.keymap.set('n', '<leader>ts', ':set invspell<CR>', { desc = '[T]oggle [S]pell check' })

-- Save and clear all buffers
vim.keymap.set('n', '<leader>bC', ':%bd<CR>', { desc = '[C]lear buffers and save' })

-- Split windows
vim.keymap.set('n', '<leader>dh', '<C-w><C-s>', { desc = 'Split [D]ocument [H]orizontally' })
vim.keymap.set('n', '<leader>dv', '<C-w><C-v>', { desc = 'Split [D]ocument [V]ertically' })
