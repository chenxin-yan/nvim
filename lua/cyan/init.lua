-- == Global Variables ==
vim.g.is_transparent = true

-- == load configs ==
if vim.g.neovide then
  require 'cyan.config.neovide'
end

require 'cyan.config.keymaps'

require 'cyan.config.options'

require 'cyan.config.autocommands'

require 'cyan.config.lazy'
