if vim.g.vscode then
  return {}
end
return {
  'MeanderingProgrammer/markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' },
  keys = {
    {
      '<leader>tr',
      '<cmd>RenderMarkdown toggle<cr>',
      desc = '[T]oggle markdown [R]ender',
      ft = 'markdown',
    },
  },
  opts = {
    file_types = { 'markdown' },
    code = {
      sign = false,
      width = 'block',
      right_pad = 1,
    },
    heading = {
      sign = false,
      icons = {},
    },
    bullet = {
      enabled = false,
    },
  },
  ft = { 'markdown' },
}
