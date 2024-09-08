return {
  'stevearc/oil.nvim',
  event = { 'VimEnter */*,.*', 'BufNew */*,.*' },
  cmd = 'Oil',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  keys = {
    {
      '-',
      '<CMD>Oil --float<cr>',
      desc = 'Open parent directory',
    },
    -- {
    --   '<leader>e',
    --   '<CMD>Oil --float .<cr>',
    --   desc = 'Open current working directory',
    -- },
  },
  opts = {
    default_file_explorer = true,
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
