return {
  'stevearc/oil.nvim',
  cmd = 'Oil',
  event = { 'VimEnter */*,.*', 'BufNew */*,.*' },
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  keys = {
    {
      '-',
      '<CMD>Oil<CR>',
      desc = 'Open parent directory',
    },
  },
  config = function()
    require('oil').setup {
      default_file_explorer = true,
      skip_confirm_for_simple_edits = true,
      keymaps = {
        ['<C-|>'] = { 'actions.select', opts = { vertical = true }, desc = 'Open the entry in a vertical split' },
        ['<C-h>'] = false,
        ['<C-t>'] = false,
      },
    }
  end,
}
