return { -- Fuzzy Finder (files, lsp, etc)
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  cmd = 'Telescope',
  lazy = true,
  keys = {
    -- See `:help telescope.builtin`
    { '<leader>sh', '<cmd>Telescope help_tags<CR>', desc = '[S]earch [H]elp' },
    { '<leader>sk', '<cmd>Telescope keymaps<CR>', desc = '[S]earch [K]eymaps' },
    { '<leader>sf', '<cmd>Telescope find_files<CR>', desc = '[S]earch [F]iles' },
    { '<leader>sw', '<cmd>Telescope grep_string<CR>', desc = '[S]earch current [W]ord' },
    { '<leader>sg', '<cmd>Telescope live_grep<CR>', desc = '[S]earch by [G]rep' },
    { '<leader>sd', '<cmd>Telescope diagnostics<CR>', desc = '[S]earch [D]iagnostics' },
    { '<leader>sr', '<cmd>Telescope resume<CR>', desc = '[S]earch [R]esume' },
    { '<leader>s.', '<cmd>Telescope oldfiles<CR>', desc = '[S]earch Recent Files ("." for repeat)' },
    { '<leader><leader>', '<cmd>Telescope buffers<CR>', desc = '[ ] Find existing buffers' },

    -- Slightly advanced example of overriding default behavior and theme
    { '<leader>/', '<cmd>Telescope current_buffer_fuzzy_find theme=dropdown previewer=false<CR>', desc = '[/] Fuzzily search in current buffer' },

    -- It's also possible to pass additional configuration options.
    --  See `:help telescope.builtin.live_grep()` for information about particular keys
    { '<leader>s/', '<cmd>Telescope live_grep grep_open_files=true prompt_title="Live Grep in Open File"<CR>', desc = '[S]earch [/] in Open Files' },

    -- Shortcut for searching your Neovim configuration files
    { '<leader>sn', '<cmd>Telescope find_files cwd=' .. vim.fn.stdpath 'config' .. '<CR>', desc = '[S]earch [N]eovim files' },

    -- Shortcut for searching spelling suggestions
    { '<leader>ss', '<cmd>Telescope spell_suggest theme=cursor<CR>', desc = '[S]earch spelling [S]uggestions' },
    { '<leader>sm', '<cmd>Telescope noice<CR>', desc = '[S]earch [M]essages' },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    { -- If encountering errors, see telescope-fzf-native README for installation instructions
      'nvim-telescope/telescope-fzf-native.nvim',

      -- `build` is used to run some command when the plugin is installed/updated.
      -- This is only run then, not every time Neovim starts up.
      build = 'make',

      -- `cond` is a condition used to determine whether this plugin should be
      -- installed and loaded.
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },

    'nvim-telescope/telescope-ui-select.nvim',

    -- Useful for getting pretty icons, but requires a Nerd Font.
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
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
    require('telescope').setup {
      -- You can put your default mappings / updates / etc. in here
      --  All the info you're looking for is in `:help telescope.setup()`
      defaults = {
        mappings = {
          i = {
            ['<C-j>'] = actions.move_selection_next,
            ['<C-k>'] = actions.move_selection_previous,
            ['<C-n>'] = actions.cycle_history_next,
            ['<C-p>'] = actions.cycle_history_prev,
          },
        },
      },
      -- pickers = {}
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    -- Enable Telescope extensions if they are installed
    pcall(require('telescope').load_extension, 'noice')
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')
  end,
}
