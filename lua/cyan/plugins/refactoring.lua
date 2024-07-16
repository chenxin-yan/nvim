return {
  'ThePrimeagen/refactoring.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  keys = {
    {
      '<leader>cR',
      function()
        require('telescope').extensions.refactoring.refactors()
      end,
      desc = '[C]ode [R]efactoring',
    },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    ---@diagnostic disable-next-line: missing-parameter
    require('refactoring').setup()
    -- load refactoring Telescope extension
    require('telescope').load_extension 'refactoring'
  end,
}
