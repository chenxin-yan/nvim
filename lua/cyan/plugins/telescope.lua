return { -- Fuzzy Finder (files, lsp, etc)
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  cmd = 'Telescope',
  lazy = true,
  keys = {
    -- See `:help telescope.builtin`
    { '<leader>sh', '<cmd>Telescope help_tags<CR>', desc = '[H]elp' },
    { '<leader>sk', '<cmd>Telescope keymaps<CR>', desc = '[K]eymaps' },
    { '<leader>sf', '<cmd>Telescope find_files<CR>', desc = '[F]iles' },
    { '<leader>sw', '<cmd>Telescope grep_string<CR>', desc = 'current [W]ord' },
    { '<leader>sg', '<cmd>Telescope live_grep<CR>', desc = 'By [G]rep' },
    { '<leader>sd', '<cmd>Telescope diagnostics<CR>', desc = '[D]iagnostics' },
    { '<leader>sr', '<cmd>Telescope resume<CR>', desc = '[R]esume' },
    { '<leader>s.', '<cmd>Telescope oldfiles<CR>', desc = 'Recent Files ("." for repeat)' },
    { '<leader>sb', '<cmd>Telescope buffers<CR>', desc = '[B]uffers' },

    -- Slightly advanced example of overriding default behavior and theme
    { '<leader>/', '<cmd>Telescope current_buffer_fuzzy_find theme=dropdown previewer=false<CR>', desc = '[/] Fuzzily search in current buffer' },

    -- It's also possible to pass additional configuration options.
    --  See `:help telescope.builtin.live_grep()` for information about particular keys
    {
      '<leader>s/',
      '<cmd>lua require("telescope.builtin").live_grep({grep_open_files=true, prompt_title="Live Grep in Open File"})<CR>',
      desc = '[/] in Open Files',
    },

    -- Shortcut for searching your Neovim configuration files
    { '<leader>sn', '<cmd>Telescope find_files cwd=' .. vim.fn.stdpath 'config' .. '<CR>', desc = '[N]eovim files' },

    -- Shortcut for searching spelling suggestions
    { 'Z', '<cmd>Telescope spell_suggest theme=cursor<CR>', desc = ' Spelling Suggestions' },

    -- search noice message
    { '<leader>sm', '<cmd>Telescope noice<CR>', desc = '[M]essages' },
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
    -- flash.nvim integration
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
            -- flash.nvim integration
            ['<c-f>'] = flash,
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
