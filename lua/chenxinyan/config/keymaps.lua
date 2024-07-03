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
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- delete and paste without yanking the deleted text into the register
vim.keymap.set('x', '<leader>p', '"-dP')

-- Close buildin terminal
vim.keymap.set('t', '<C-c>', '<C-\\><C-n>:q<CR>', { desc = '[C]lose terminal' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- open neovim builtin terminal
vim.keymap.set('n', '<C-t>', ':split<CR>:terminal<CR>', { desc = '[T]oggle [T]erminal' })

-- Move selection up and down
vim.keymap.set('x', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('x', 'K', ":m '<-2<CR>gv=gv")

-- Keep cursor always in the middle when scrolling
-- vim.keymap.set('n', '<C-d>', '<C-d>zz')
-- vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Yanking/deleting selection into system clipboard
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('x', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+Y')
vim.keymap.set('x', '<leader>d', '"+d')

-- 'x' not yanking to buffer
vim.keymap.set('n', 'x', '"_x')

-- Clear buffer
vim.keymap.set('n', '<C-c><C-b>', ':wa<CR>:%bd<CR>', { desc = '[C]lear [B]uffers' })

-- Tabs
vim.keymap.set('n', 'te', ':tabedit<CR>', { desc = '[T]able [E]dit' })
vim.keymap.set('n', '<Tab>', ':tabnext<CR>', { desc = '[T]able Next' })
vim.keymap.set('n', '<S-Tab>', ':tabpre<CR>', { desc = '[T]able Previous' })
vim.keymap.set('n', 'tw', ':tabclose<CR>', { desc = '[T]able [C]lose' })
