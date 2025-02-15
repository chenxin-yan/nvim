return {
  'olexsmir/gopher.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  build = function()
    vim.cmd.GoInstallDeps()
  end,
  cmd = { 'GoTagAdd', 'GoIfErr', 'GoCmt', 'GoInstallDeps' },
  keys = {
    {
      '<leader>cgj',
      '<CMD>GoTagAdd json<CR>',
      desc = 'Gopher: Add json tag',
      ft = 'go',
      buffer = 0,
    },
    {
      '<leader>cgy',
      '<CMD>GoTagAdd yaml<CR>',
      desc = 'Gopher: Add yaml tag',
      ft = 'go',
      buffer = 0,
    },
    {
      '<leader>cge',
      '<CMD>GoIfErr<CR>',
      desc = 'Gopher: Generate if error',
      ft = 'go',
      buffer = 0,
    },
    {
      '<leader>cgd',
      '<CMD>GoCmt<CR>',
      ft = 'go',
      desc = 'Gopher: Generate biolerplate doc comment',
      buffer = 0,
    },
  },
  ---@type gopher.Config
  opts = {},
}
