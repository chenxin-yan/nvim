-- Set <space> as the leader key
-- See `:help mapleader`
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- clear highlight search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<cr>')

-- Diagnostic/todo keymaps
vim.keymap.set('n', 'X', vim.diagnostic.open_float, { desc = 'Show diagnostic Error messages' })

--  deleting/paste without yanking the deleted text into the register
vim.keymap.set('x', '<leader>p', '"_dP', { desc = 'Paste in without yanking selected text' })
vim.keymap.set('n', 'x', '"_x', { desc = 'Delete without yanking' })
vim.keymap.set('x', 'x', '"_x', { desc = 'Delete without yanking' })

-- Open/Close buildin terminal
vim.keymap.set('n', '<C-t>', '<cmd>split<cr><cmd>terminal<cr>', { desc = 'Open [T]erminal' })
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

-- Yanking selection into system clipboard
vim.keymap.set({ 'n', 'x' }, '<leader>y', '"+y', { desc = 'Yank into system clipboard' })

-- toggle spellcheck
vim.keymap.set('n', '<leader>ts', '<cmd>set invspell<cr>', { desc = '[T]oggle [S]pell check' })

-- Split windows
vim.keymap.set('n', '<leader>_', '<C-w><C-s>', { desc = 'Horizontal Split' })
vim.keymap.set('n', '<leader>|', '<C-w><C-v>', { desc = 'Vertical Split' })

-- Tab operations
vim.keymap.set('n', '<leader><C-t>', '<cmd>tabnew<cr>', { desc = 'Create new tab' })
vim.keymap.set('n', ']T', '<cmd>tabn<cr>', { desc = '[N]ext tab' })
vim.keymap.set('n', '[T', '<cmd>tabp<cr>', { desc = '[P]revious tab' })
vim.keymap.set('n', '<leader><C-w>', '<cmd>tabc<cr>', { desc = 'Close current tab' })

-- replace $ and ^ with H and L
vim.keymap.set({ 'n', 'x' }, 'H', '^')
vim.keymap.set({ 'n', 'x' }, 'L', '$')

-- select all keymap
vim.keymap.set('n', '<leader><C-a>', 'gg<s-v>G', { desc = 'Select all' })
vim.keymap.set('n', '<leader>A', 'gg<s-v>G"+y', { desc = 'Select all and yank into system clipboard' })

-- coment above & below
vim.keymap.set('n', 'gco', 'o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>', { desc = 'Add Comment Below' })
vim.keymap.set('n', 'gcO', 'O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>', { desc = 'Add Comment Above' })

-- add endline caracter
vim.keymap.set('n', 'g,', 'm`A,<Esc>``', { desc = 'Add "," at the end of the line ' })
vim.keymap.set('n', 'g;', 'm`A;<Esc>``', { desc = 'Add ";" at the end of the line' })

-- switch between buffers
vim.keymap.set('n', '<S-Tab>', '<cmd>b#<cr>', { desc = 'Goto previously opened buffer' })

-- git operations
vim.keymap.set('n', '<leader>ga', ':!git add *', { desc = '[A]dd' })
vim.keymap.set('n', '<leader>gc', ':!git commit -m ""<left>', { desc = '[C]ommit' })
vim.keymap.set('n', '<leader>gA', ':!git commit --amend --no-edit', { desc = '[A]mend' })
vim.keymap.set('n', '<leader>gp', ':!git push', { desc = '[P]ush' })
vim.keymap.set('n', '<leader>gP', ':!git push --force', { desc = '[P]ush force' })
vim.keymap.set('n', '<leader>gu', ':!git reset HEAD *', { desc = '[U]nstage files' })
vim.keymap.set('n', '<leader>gr', ':!git reset --hard HEAD *', { desc = 'Hard [R]eset to last commit' })
vim.keymap.set('n', '<leader>gs', ':!git reset --hard HEAD *', { desc = 'Hard [R]eset to last commit' })

-- vim command shortcuts
vim.keymap.set('n', '<C-q>', '<cmd>qa!<cr>', { desc = 'Quit All' })

-- delete all buffers
vim.keymap.set('n', '<leader>bD', '<cmd>%bd<cr>', { desc = 'Delete all buffers' })
