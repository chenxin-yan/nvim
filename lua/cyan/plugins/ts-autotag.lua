return {
  'windwp/nvim-ts-autotag',
  ft = {
    'html',
    'javascript',
    'javascriptreact',
    'json',
    'jsonc',
    'typescript',
    'typescriptreact',
  },
  config = function()
    require('nvim-ts-autotag').setup()
  end,
}
