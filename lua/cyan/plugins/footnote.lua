local is_dev = true

if is_dev then
  return {
    dir = '~/dev/footnote.nvim/',
    ft = 'markdown',
    opts = {
      debug_print = true,
      keys = {
        new_footnote = '<C-f>',
        organize_footnotes = '<leader>cf',
        next_footnote = ']f',
        prev_footnote = '[f',
        footnote_all_occurrences = '<leader><C-f>',
      },
      organize_on_save = false,
      organize_on_new = false,
    },
  }
else
  return {
    'chenxin-yan/footnote.nvim',
    ft = 'markdown',
    opts = {
      keys = {
        new_footnote = '<C-f>',
        organize_footnotes = '<leader>cf',
        next_footnote = ']f',
        prev_footnote = '[f',
        footnote_all_occurrences = '<leader><C-f>',
      },
      organize_on_save = false,
      organize_on_new = false,
    },
  }
end
