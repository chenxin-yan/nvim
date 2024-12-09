-- == Global Variables ==
vim.g.is_transparent = true

-- == disable provider ==
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

-- == load configs ==
if vim.g.neovide then
  require 'cyan.config.neovide'
end

require 'cyan.config.keymaps'

require 'cyan.config.options'

require 'cyan.config.autocommands'

require 'cyan.config.lazy'
