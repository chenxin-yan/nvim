-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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
    opts = {
      integrations = {
        fidget = true,
        noice = true,
        grug_far = true,
        notify = true,
        lsp_trouble = true,
        which_key = true,
        indent_blankline = {
          enabled = true,
          scope_color = 'lavender',
          colored_indent_levels = false,
        },
      },
    },
    config = function(_, opts)
      if not vim.g.neovide then
        opts = vim.tbl_deep_extend('force', opts, {
          transparent_background = true,
        })
      end
      require('catppuccin').setup(opts)
    end,
  },

  -- == plugins ==

  -- ---- Core plugins ----
  -- Detect tabstop and shiftwidth automatically
  {
    'tpope/vim-sleuth',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      vim.keymap.set('n', '<leader>bi', '<cmd>Sleuth<cr>', { desc = 'Detect [B]uffer [I]ndent' })
    end,
  },

  -- change keyword cases

  -- line preview when search line number
  { 'nacro90/numb.nvim', event = 'CmdlineEnter', config = true },

  require 'cyan.plugins.todo-comments', -- Highlight todo, notes, etc in comment; todo tree
  require 'cyan.plugins.which-key', -- keybinding hint
  require 'cyan.plugins.telescope', -- fuzzy search
  require 'cyan.plugins.lspconfig', -- LSP support
  require 'cyan.plugins.conform', -- formatter support
  require 'cyan.plugins.cmp', -- autocompletion
  require 'cyan.plugins.mini', -- misc tools
  require 'cyan.plugins.treesitter', -- syntax highlighting
  require 'cyan.plugins.debug', -- language debugger
  require 'cyan.plugins.gitsigns', -- git support
  require 'cyan.plugins.lint', -- linter
  require 'cyan.plugins.auto-session', -- nvim session manager
  require 'cyan.plugins.gx', -- better gx
  require 'cyan.plugins.oil', -- better file operations
  require 'cyan.plugins.trouble', -- better diagnostic list
  require 'cyan.plugins.autolist', -- better bullet list
  require 'cyan.plugins.autopairs', -- autopairs
  require 'cyan.plugins.harpoon', -- file switcher

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
  require 'cyan.plugins.noice', -- UI improvement

  -- ---- language specific ----
  require 'cyan.plugins.refactoring', -- code refactoring

  -- TS/JS
  require 'cyan.plugins.ts-autotag', -- auto close/rename tags

  -- markdown
  require 'cyan.plugins.markdowny', -- markdown shortcut support
  require 'cyan.plugins.markdown-preview', -- markdown preview in browser
  require 'cyan.plugins.markdown', -- better markdown render
  require 'cyan.plugins.footnote', -- better footnote
  require 'cyan.plugins.obsidian', -- obsidian integration
  require 'cyan.plugins.zen', -- Zen mode

  -- ---- extras ----
  require 'cyan.plugins.leetcode', -- Leetcode integration
  require 'cyan.plugins.vim-tmux-navigator', -- tmux window navigation integration
  require 'cyan.plugins.lazygit', -- git CLI
  require 'cyan.plugins.neogen', -- generate annotations/documentations
  require 'cyan.plugins.grug-far', -- grep and replace
  require 'cyan.plugins.im-select', -- automatic input method switcher
  require 'cyan.plugins.yazi', -- yazi integration
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
