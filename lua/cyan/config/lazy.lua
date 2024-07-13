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
  -- == theme ==
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      vim.cmd.colorscheme 'catppuccin-mocha'
    end,

    config = function()
      local opts = {
        integrations = {
          neotree = true,
        },
      }
      if not vim.g.neovide then
        require('catppuccin').setup { opts, transparent_background = vim.g.is_transparent }
      else
        require('catppuccin').setup { opts }
      end
    end,
  },

  -- == plugins ==

  {
    'tpope/vim-sleuth',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      vim.keymap.set('n', '<leader>bi', ':Sleuth<CR>', { desc = 'Detect [B]uffer [I]ndent' })
    end,
  }, -- Detect tabstop and shiftwidth automatically

  {
    -- bracket colorizer
    'HiPhish/rainbow-delimiters.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require('rainbow-delimiters.setup').setup {}
    end,
  },
  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', event = { 'BufReadPre', 'BufNewFile' }, opts = {} },

  -- More plugins
  require 'cyan.plugins.vim-tmux-navigator', -- tmux window navigation integration
  require 'cyan.plugins.feline', -- status line
  require 'cyan.plugins.fugitive', -- nvim git wraper
  require 'cyan.plugins.todo-comments', -- Highlight todo, notes, etc in comment; todo tree
  require 'cyan.plugins.alpha', -- neovim dashboard
  require 'cyan.plugins.undotree', -- undo history management
  require 'cyan.plugins.which-key', -- keybinding hint
  require 'cyan.plugins.telescope', -- fuzzy search
  require 'cyan.plugins.neo-tree', -- nvim file explorer
  require 'cyan.plugins.lspconfig', -- LSP support
  require 'cyan.plugins.conform', -- formatter support
  require 'cyan.plugins.cmp', -- autocompletion
  require 'cyan.plugins.mini', -- misc tools
  require 'cyan.plugins.treesitter', -- syntax highlighting
  require 'cyan.plugins.debug', -- language debugger
  require 'cyan.plugins.autopairs', -- autopair brackets
  require 'cyan.plugins.gitsigns', -- git support
  require 'cyan.plugins.lint', -- linter
  require 'cyan.plugins.indent-line', -- indentation guide
  require 'cyan.plugins.bullet', -- markdown list support
  require 'cyan.plugins.markdowny', -- markdown shortcut support
  require 'cyan.plugins.markdown-preview', -- markdown preview in browser
  require 'cyan.plugins.lazygit', -- git CLI
  require 'cyan.plugins.harpoon', -- buffer bookmarks
  require 'cyan.plugins.inc-rename', -- incremental renaming
  require 'cyan.plugins.ts-autotag', -- auto close/rename tags
  require 'cyan.plugins.refactoring', -- code refactoring
  require 'cyan.plugins.dash', -- dash integration for doc lookup
  require 'cyan.plugins.bufferline', -- bufferline
  require 'cyan.plugins.obsidian', -- obsidian integration
  require 'cyan.plugins.auto-session', -- nvim session manager
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
