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
vim.keymap.set('n', 'X', vim.diagnostic.open_float, { desc = 'Show diagnostic Error messages' })
vim.keymap.set('n', '<leader>dq', vim.diagnostic.setloclist, { desc = 'Open [D]iagnostic [Q]uickfix list' })

--  deleting/paste without yanking the deleted text into the register
vim.keymap.set('x', '<leader>p', '"_dP', { desc = 'Paste in without yanking selected text' })
vim.keymap.set('n', 'x', '"_x')
vim.keymap.set('x', '<leader>x', '"_x', { desc = 'Delete without yanking' })

-- Open/Close buildin terminal
vim.keymap.set('n', '<C-t>', '<cmd>split<CR><cmd>terminal<CR>', { desc = 'Open [T]erminal' })
vim.keymap.set('t', '<C-c>', '<C-c><C-d>', { desc = 'Kill terminal' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Keep cursor always in the middle when scrolling
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Yanking/deleting selection into system clipboard
vim.keymap.set({ 'n', 'x' }, '<leader>y', '"+y', { desc = 'Yank into system clipboard' })
vim.keymap.set('x', '<leader>d', '"+d', { desc = 'Delete into system clipboard' })
vim.keymap.set('n', '<leader>p', '"+p', { desc = 'Paste from system clipboard' })

-- toggle spellcheck
vim.keymap.set('n', '<leader>ts', '<cmd>set invspell<CR>', { desc = '[T]oggle [S]pell check' })

-- Split windows
vim.keymap.set('n', '<leader>_', '<C-w><C-s>', { desc = 'Horizontal Split' })
vim.keymap.set('n', '<leader>|', '<C-w><C-v>', { desc = 'Vertical Split' })

-- workspace tab operations
vim.keymap.set('n', '<leader>wt', '<cmd>tabnew<CR>', { desc = '[W]orkspace [T]ab new' })
vim.keymap.set('n', ']T', '<cmd>tabn<CR>', { desc = '[N]ext tab' })
vim.keymap.set('n', '[T', '<cmd>tabp<CR>', { desc = '[P]revious tab' })
vim.keymap.set('n', '<leader>wd', '<cmd>tabc<CR>', { desc = '[W]orkspace tab [D]elete' })

-- replace $ and ^ with H and L
vim.keymap.set({ 'n', 'x' }, 'H', '^')
vim.keymap.set({ 'n', 'x' }, 'L', '$')

-- select all keymap
vim.keymap.set({ 'n', 'x' }, '<leader>A', 'gg<s-v>G', { desc = 'Select all' })

-- coment above & below
vim.keymap.set('n', 'gco', 'o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>', { desc = 'Add Comment Below' })
vim.keymap.set('n', 'gcO', 'O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>', { desc = 'Add Comment Above' })

-- add endline caracter
vim.keymap.set('n', 'g,', 'm`A,<Esc>``', { desc = 'Add "," at the end of the line ' })
vim.keymap.set('n', 'g;', 'm`A;<Esc>``', { desc = 'Add ";" at the end of the line' })
