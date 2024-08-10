return {
  'stevearc/oil.nvim',
  cmd = 'Oil',
  event = { 'VimEnter */*,.*', 'BufNew */*,.*' },
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    {
      'chrishrb/gx.nvim',
      keys = { { 'gx', '<cmd>Browse<cr>', mode = { 'n', 'x' }, desc = 'Open link/file path under cursor' } },
      cmd = { 'Browse' },
      init = function()
        vim.g.netrw_nogx = 1 -- disable netrw gx
      end,
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = true, -- default settings
      submodules = false, -- not needed, submodules are required only for tests
    },
  },
  keys = {
    {
      '-',
      '<CMD>Oil<cr>',
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
