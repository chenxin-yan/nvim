return {
  'antonk52/markdowny.nvim',
  ft = 'markdown',
  config = function()
    require('markdowny').setup { filetypes = { 'markdown' } }
  end,
}
