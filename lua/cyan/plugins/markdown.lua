if vim.g.vscode then
  return {}
end
return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' },
  keys = {
    {
      '<leader>ur',
      '<cmd>RenderMarkdown toggle<cr>',
      desc = '[T]oggle markdown [R]ender',
      ft = 'markdown',
    },
  },
  ft = { 'markdown', 'Avante' },
  opts = {
    file_types = { 'markdown', 'Avante' },
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
}
