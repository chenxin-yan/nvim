return {
  'MeanderingProgrammer/markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' },
  opts = {
    file_types = { 'markdown' },
    code = {
      enabled = false,
    },
    heading = {
      enabled = false,
    },
    bullet = {
      enabled = false,
    },
  },
  ft = { 'markdown' },
}
