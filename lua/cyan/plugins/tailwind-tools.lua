return {
  'luckasRanarison/tailwind-tools.nvim',
  name = 'tailwind-tools',
  build = ':UpdateRemotePlugins',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-telescope/telescope.nvim', -- optional
  },
  keys = {
    { '<leader>cts', '<cmd>TailwindSort<cr>', desc = 'Tailwind Sort' },
  },
  opts = {}, -- your configuration
}
