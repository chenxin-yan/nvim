-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
require('lazy').setup({

  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      vim.cmd.colorscheme 'tokyonight-night'

      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'
    end,
  },

  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  require 'chenxinyan.plugins.todo-comments', -- Highlight todo, notes, etc in comment; todo tree
  require 'chenxinyan.plugins.alpha', -- neovim dashboard
  require 'chenxinyan.plugins.undotree', -- undo history management
  require 'chenxinyan.plugins.which-key', -- kinbinding hint
  require 'chenxinyan.plugins.telescope', -- fuzzy search
  require 'chenxinyan.plugins.lspconfig', -- LSP support
  require 'chenxinyan.plugins.conform', -- formatter support
  require 'chenxinyan.plugins.cmp', -- autocompletion
  require 'chenxinyan.plugins.mini', -- misc tools
  require 'chenxinyan.plugins.treesitter', -- syntax highlighting
  -- require 'chenxinyan.plugins.debug',
  require 'chenxinyan.plugins.autopairs', -- autopair brackets
  require 'chenxinyan.plugins.neo-tree', -- nvim file explorer
  require 'chenxinyan.plugins.gitsigns', -- git support
  require 'chenxinyan.plugins.lint', -- linter
  require 'chenxinyan.plugins.rainbow-delimiters', -- rainbow brackets
  require 'chenxinyan.plugins.auto-session', -- session manager
  require 'chenxinyan.plugins.markdown-preview', -- markdown preview in browser
  require 'chenxinyan.plugins.markdown', -- markdown editing toolkits
  require 'chenxinyan.plugins.vim-flog', -- vim graph
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})
