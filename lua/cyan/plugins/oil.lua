return {
  'stevearc/oil.nvim',
  cmd = 'Oil',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  keys = {
    {
      '-',
      '<CMD>Oil<cr>',
      desc = 'Open parent directory',
    },
  },
  opts = {
    default_file_explorer = false,
    skip_confirm_for_simple_edits = true,
    keymaps = {
      ['<C-v>'] = { 'actions.select', opts = { vertical = true }, desc = 'Open the entry in a vertical split' },
      ['q'] = 'actions.close',
      ['<C-s>'] = false,
      ['<C-h>'] = false,
      ['<C-t>'] = false,
    },
  },
}
