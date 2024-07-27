local config = {
  cmd = { vim.fn.expand '~/.local/share/nvim/mason/bin/jdtls' },
  root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
}
require('jdtls').start_or_attach(config)

vim.keymap.set('n', '<leader>co', "<Cmd>lua require'jdtls'.organize_imports()<CR>", { desc = 'jdtls: [O]rganize Imports' })
vim.keymap.set('n', '<leader>co', "<Cmd>lua require('jdtls').organize_imports<CR>", { desc = 'jdtls: [O]rganize Imports' })
vim.keymap.set('n', '<leader>cev', "<Cmd>lua require('jdtls').extract_variable()<CR>", { desc = 'jdtls: Extract [V]ariable' })
vim.keymap.set('v', '<leader>cev', "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", { desc = 'jdtls: Extract [V]ariable' })
vim.keymap.set('n', '<leader>cec', "<Cmd>lua require('jdtls').extract_constant()<CR>", { desc = 'jdtls: Extract [C]onstant' })
vim.keymap.set('v', '<leader>cec', "<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>", { desc = 'jdtls: Extract [C]onstant' })
vim.keymap.set('v', '<leader>cem', "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", { desc = 'jdtls: Extract [M]ethod' })
