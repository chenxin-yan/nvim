return {
  'lukas-reineke/indent-blankline.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  main = 'ibl',
  ---@module "ibl"
  ---@type ibl.config
  opts = {
    indent = { char = '▏', tab_char = '▏' },
    exclude = {
      filetypes = {
        'help',
        'alpha',
        'Trouble',
        'trouble',
        'lazy',
        'mason',
        'notify',
      },
    },
  },
}
