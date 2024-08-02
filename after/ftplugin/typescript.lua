local vtsls = require 'vtsls'

vim.keymap.set('n', '<leader>co', function()
  vtsls.commands['organize_imports'](0)
end, { desc = 'vtsls: [O]rganize imports' })
vim.keymap.set('n', '<leader>cc', function()
  vtsls.commands['goto_project_config'](0)
end, { desc = 'vtsls: Go to Project [C]onfig' })
vim.keymap.set('n', '<leader>cf', function()
  vtsls.commands['fix_all'](0)
end, { desc = 'vtsls: [F]ix all' })
vim.keymap.set('n', '<leader>cF', '<cmd>EslintFixAll<CR>', { desc = 'Eslint: [F]ix all', buffer = 0 })
