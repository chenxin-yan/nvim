return {
  'chentoast/marks.nvim',
  event = 'VeryLazy',
  opts = {
    default_mappings = false,
    mappings = {
      set = 'm',
      toggle = 'm\\',
      delete = 'dm',
      delete_line = 'dm=',
      delete_buf = 'dm<space>',
      preview = 'm:',
      next = 'm]',
      prev = 'm[',
    },
  },
  keys = {
    { '<leader>bm', '<cmd>MarksListAll<cr>', desc = 'Show all marks in current buffer' },
    { '<leader>bM', '<cmd>MarksListGlobal<cr>', desc = 'Show all global marks in current buffer' },
    { '<leader>tm', '<cmd>MarksToggleSigns<cr>', desc = '[T]oggle [M]arks signs' },
  },
}
