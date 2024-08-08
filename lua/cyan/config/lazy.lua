-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
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
          fidget = true,
          neotree = true,
          noice = true,
          which_key = true,
          ufo = true,
          grug_far = true,
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

  -- ---- Core plugins ----
  {
    'tpope/vim-sleuth',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      vim.keymap.set('n', '<leader>bi', '<cmd>Sleuth<cr>', { desc = 'Detect [B]uffer [I]ndent' })
    end,
  }, -- Detect tabstop and shiftwidth automatically

  require 'cyan.plugins.fugitive', -- nvim git wraper
  require 'cyan.plugins.todo-comments', -- Highlight todo, notes, etc in comment; todo tree
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
  require 'cyan.plugins.auto-session', -- nvim session manager
  require 'cyan.plugins.oil', -- file explorer & editor
  require 'cyan.plugins.gx', -- use gx without netrw
  require 'cyan.plugins.flash', -- eazy motion alternative
  require 'cyan.plugins.grug-far', -- grep and replace
  require 'cyan.plugins.trouble', -- better quickfix list & symbol outline

  -- ---- UI ----
  {
    -- bracket colorizer
    'HiPhish/rainbow-delimiters.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require('rainbow-delimiters.setup').setup {}
    end,
  },

  require 'cyan.plugins.alpha', -- neovim dashboard
  require 'cyan.plugins.feline', -- status line
  require 'cyan.plugins.indent-line', -- indentation guide
  require 'cyan.plugins.bufferline', -- bufferline
  require 'cyan.plugins.noice', -- UI improvement

  -- ---- language specific ----

  require 'cyan.plugins.ts-autotag', -- auto close/rename tags
  require 'cyan.plugins.refactoring', -- code refactoring
  require 'cyan.plugins.live-server', -- node live server

  -- markdown
  require 'cyan.plugins.autolist', -- markdown better list
  require 'cyan.plugins.markdowny', -- markdown shortcut support
  require 'cyan.plugins.markdown-preview', -- markdown preview in browser
  require 'cyan.plugins.markdown', -- better markdown render
  require 'cyan.plugins.footnote', -- better footnote
  require 'cyan.plugins.obsidian', -- obsidian integration

  -- ---- extras ----
  require 'cyan.plugins.leetcode', -- Leetcode integration
  require 'cyan.plugins.vim-tmux-navigator', -- tmux window navigation integration
  require 'cyan.plugins.lazygit', -- git CLI
  require 'cyan.plugins.gitignore', -- generate gitignore files
  require 'cyan.plugins.ufo', -- better folds
  require 'cyan.plugins.neogen', -- generate annotations/documentations
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
