return { -- Fuzzy Finder (files, lsp, etc)
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  cmd = 'Telescope',
  lazy = true,
  dependencies = {
    'nvim-lua/plenary.nvim',

    -- Useful for getting pretty icons, but requires a Nerd Font.
    { 'nvim-tree/nvim-web-devicons' },

    -- Telescope luasnip integration
    'benfowler/telescope-luasnip.nvim',

    -- search bibtex
    'nvim-telescope/telescope-bibtex.nvim',
  },
  keys = {
    -- See `:help telescope.builtin`

    -- Shortcut for searching your Neovim configuration files
    { '<leader>sn', '<cmd>Telescope find_files cwd=' .. vim.fn.stdpath 'config' .. '<cr>', desc = '[N]eovim Config' },

    -- Shortcut for searching spelling suggestions
    -- { 'Z', '<cmd>Telescope spell_suggest theme=cursor<cr>', desc = ' Spelling Suggestions' },

    -- telescope luasnip
    { '<leader>sc', '<cmd>Telescope luasnip<cr>', desc = '[C]ompletion (Luasnip)' },

    -- telescope bibtex
    { '<C-b>', '<cmd>Telescope bibtex<cr>', desc = 'Search [B]ibTex', ft = 'markdown', mode = 'i' },
  },
  config = function()
    -- Telescope is a fuzzy finder that comes with a lot of different things that
    -- it can fuzzy find! It's more than just a "file finder", it can search
    -- many different aspects of Neovim, your workspace, LSP, and more!
    --
    -- The easiest way to use Telescope, is to start by doing something like:
    --  :Telescope help_tags
    --
    -- After running this command, a window will open up and you're able to
    -- type in the prompt window. You'll see a list of `help_tags` options and
    -- a corresponding preview of the help.
    --
    -- Two important keymaps to use while in Telescope are:
    --  - Insert mode: <c-/>
    --  - Normal mode: ?
    --
    -- This opens a window that shows you all of the keymaps for the current
    -- Telescope picker. This is really useful to discover what Telescope can
    -- do as well as how to actually do it!

    -- [[ Configure Telescope ]]
    -- See `:help telescope` and `:help telescope.setup()`
    local actions = require 'telescope.actions'

    -- flash integrations
    local function flash(prompt_bufnr)
      require('flash').jump {
        pattern = '^',
        label = { after = { 0, 0 } },
        search = {
          mode = 'search',
          exclude = {
            function(win)
              return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= 'TelescopeResults'
            end,
          },
        },
        action = function(match)
          local picker = require('telescope.actions.state').get_current_picker(prompt_bufnr)
          picker:set_selection(match.pos[1] - 1)
        end,
      }
    end

    local open_with_trouble = require('trouble.sources.telescope').open

    require('telescope').setup {
      -- You can put your default mappings / updates / etc. in here
      --  All the info you're looking for is in `:help telescope.setup()`
      defaults = require('telescope.themes').get_ivy {
        mappings = {
          n = {
            s = flash,
            ['<c-t>'] = open_with_trouble,
          },
          i = {
            ['<esc>'] = actions.close,
            ['<C-j>'] = actions.move_selection_next,
            ['<C-k>'] = actions.move_selection_previous,
            ['<C-n>'] = actions.cycle_history_next,
            ['<C-p>'] = actions.cycle_history_prev,
            ['<c-s>'] = flash,
            ['<c-t>'] = open_with_trouble,
          },
        },
      },
      -- pickers = {}
      extensions = {
        bibtex = {
          -- Use context awareness
          context = true,
          -- Use non-contextual behavior if no context found
          -- This setting has no effect if context = false
          context_fallback = true,
          custom_formats = {
            { id = 'citeproc', cite_marker = '[@%s]' },
          },
          format = 'citeproc',
        },
      },
    }

    -- Enable Telescope extensions if they are installed
    -- pcall(require('telescope').load_extension, 'fzf')
    -- pcall(require('telescope').load_extension, 'ui-select')
    pcall(require('telescope').load_extension, 'luasnip')
    pcall(require('telescope').load_extension, 'bibtex')
  end,
}
