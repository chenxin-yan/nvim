return {
  'AckslD/nvim-neoclip.lua',
  event = { 'TextYankPost', 'RecordingLeave' },
  dependencies = {
    { 'kkharji/sqlite.lua', module = 'sqlite' },
    { 'nvim-telescope/telescope.nvim' },
  },
  keys = {
    { '<leader>sc', '<cmd>Telescope neoclip<cr>', desc = '[C]lipboard' },
    { '<leader>sm', '<cmd>Telescope macroscope<cr>', desc = '[M]acro' },
  },
  config = function()
    require('neoclip').setup {
      enable_persistent_history = true,
      keys = {
        telescope = {
          i = {
            paste_behind = '<c-s-p>',
          },
        },
      },
    }
  end,
}
