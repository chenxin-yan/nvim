local vtsls = require 'vtsls'

vim.keymap.set('n', '<leader>co', function()
  vtsls.commands['organize_imports'](0)
end, { desc = 'vtsls: [O]rganize imports' })
vim.keymap.set('n', '<leader>cf', '<cmd>EslintFixAll<CR>', { desc = 'eslint: Estlint [F]ix all', buffer = 0 })
