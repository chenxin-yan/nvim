local is_dev = false

if is_dev then
  return {
    dir = '~/dev/footnote.nvim/',
    config = function()
      require('footnote').setup {
        debug_print = true,
        keys = {
          new_footnote = '<C-f>',
          organize_footnotes = '<leader>cf',
          next_footnote = ']x',
          prev_footnote = '[x',
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
          organize_footnotes = '<leader>cf',
          next_footnote = '',
          prev_footnote = '',
        },
        organize_on_save = false,
        organize_on_new = false,
      }
    end,
  }
end
