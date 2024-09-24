-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Automatically enter insert mode after terminal being opened
vim.api.nvim_create_autocmd('TermOpen', {
  pattern = { '*' },
  callback = function()
    if vim.opt.buftype:get() == 'terminal' then
      vim.cmd ':startinsert'
    end
  end,
})

-- Source ftplugin when open with harpoon
vim.api.nvim_create_autocmd({ 'BufEnter' }, {
  desc = 'Source ftplugin/$1.lua to override Issue #626',
  group = vim.api.nvim_create_augroup('Harpoon_Optlocal', { clear = true }),
  callback = function()
    local ft = vim.bo.filetype
    vim.cmd('silent! source $XDG_CONFIG_HOME/nvim/after/ftplugin/' .. ft .. '.lua')
  end,
})
