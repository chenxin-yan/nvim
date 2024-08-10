if vim.g.is_dev then
  return {
    dir = '~/dev/footnote.nvim/',
    config = function()
      require('footnote').setup {
        keys = {
          new_footnote = '<C-f>',
          organize_footnotes = '<leader>cf',
          next_footnote = ']n',
          prev_footnote = '[n',
        },
        organize_on_save = false,
        organize_on_new = false,
      }
    end,
  }
else
  return {
    'chenxin-yan/footnote.nvim',
    ft = 'markdown',
    config = function()
      require('footnote').setup {
        keys = {
          new_footnote = '<C-f>',
          organize_footnotes = '',
          next_footnote = ']n',
          prev_footnote = '[n',
        },
        organize_on_new = true,
      }
    end,
  }
end
