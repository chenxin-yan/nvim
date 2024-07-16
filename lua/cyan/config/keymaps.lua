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
vim.keymap.set({ 'n', 'x' }, '<leader>y', '"+y')
vim.keymap.set('x', '<leader>d', '"+d')
vim.keymap.set('n', '<leader>p', '"+p')

-- toggle spellcheck
vim.keymap.set('n', '<leader>ts', '<cmd>set invspell<CR>', { desc = '[T]oggle [S]pell check' })

-- Save and clear all buffers
vim.keymap.set('n', '<leader>bD', '<cmd>%bd<CR>', { desc = '[B]uffer [D]elete all' })

-- Split windows
vim.keymap.set('n', '<leader>d_', '<C-w><C-s>', { desc = 'Split [D]ocument Horizontally' })
vim.keymap.set('n', '<leader>d|', '<C-w><C-v>', { desc = 'Split [D]ocument Vertically' })

-- workspace tab operations
vim.keymap.set('n', '<leader>wt', '<cmd>tabnew<CR>', { desc = '[W]orkspace [T]ab new' })
vim.keymap.set('n', ']w', '<cmd>tabn<CR>', { desc = '[W]orkspace tab [N]ext' })
vim.keymap.set('n', '[w', '<cmd>tabp<CR>', { desc = '[W]orkspace tab [P]revious' })
vim.keymap.set('n', '<leader>wd', '<cmd>tabc<CR>', { desc = '[W]orkspace tab [D]elete' })

-- replace $ and ^ with H and L
vim.keymap.set({ 'n', 'x' }, 'H', '^')
vim.keymap.set({ 'n', 'x' }, 'L', '$')
