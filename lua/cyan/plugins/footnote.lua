if vim.g.is_dev then
  return {
    dir = '~/dev/footnote.nvim/',
    config = function()
      require('footnote').setup {
        keys = {
          new_footnote = '<C-f>',
          organize_footnotes = '<leader>cf',
          next_footnote = ']f',
          prev_footnote = '[f',
        },
        organize_on_save = false,
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
          organize_footnotes = '<leader>cf',
          next_footnote = ']f',
          prev_footnote = '[f',
        },
        organize_on_save = false,
      }
    end,
  }
end
