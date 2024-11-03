return { -- Fuzzy Finder (files, lsp, etc)
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  cmd = 'Telescope',
  lazy = true,
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

    -- Telescope undotree
    'debugloop/telescope-undo.nvim',

    -- Telescope luasnip integration
    'benfowler/telescope-luasnip.nvim',

    -- search bibtex
    'nvim-telescope/telescope-bibtex.nvim',
  },
  keys = {
    -- See `:help telescope.builtin`
    { '<leader>sh', '<cmd>Telescope help_tags<cr>', desc = '[H]elp' },
    { '<leader>sk', '<cmd>Telescope keymaps<cr>', desc = '[K]eymaps' },
    { '<leader>sf', "<CMD>lua require'cyan.helpers.telescope-config'.project_files()<CR>", desc = 'Project [F]iles' },
    { '<leader>sF', '<cmd>Telescope find_files find_command=rg,--files,--hidden,--glob,!**/.git/*<cr>', desc = 'Cwd [F]iles' },
    {
      '<leader>s-',
      function()
        require('telescope.builtin').find_files { cwd = vim.fn.expand '%:p:h' }
      end,
      desc = 'Parent directory',
    },
    { '<leader>s*', '<cmd>Telescope grep_string<cr>', desc = 'Current [W]ord' },
    { '<leader>sg', '<cmd>Telescope live_grep<cr>', desc = 'By [G]rep' },
    { '<leader>sD', '<cmd>Telescope diagnostics<cr>', desc = 'Workspace [D]iagnostics' },
    { '<leader>sd', '<cmd>Telescope diagnostics bufnr=0<cr>', desc = 'Buffer [D]iagnostics' },
    { '<leader>sr', '<cmd>Telescope resume<cr>', desc = '[R]esume' },
    { '<leader>s.', '<cmd>Telescope oldfiles<cr>', desc = 'Recent Files ("." for repeat)' },
    { '<leader><leader>', '<cmd>Telescope buffers<cr>', desc = 'Search Open Buffers' },

    -- Slightly advanced example of overriding default behavior and theme
    { '<leader>/', '<cmd>Telescope current_buffer_fuzzy_find theme=dropdown previewer=false<cr>', desc = '[/] Fuzzily search in current buffer' },

    -- It's also possible to pass additional configuration options.
    --  See `:help telescope.builtin.live_grep()` for information about particular keys
    {
      '<leader>s/',
      '<cmd>lua require("telescope.builtin").live_grep({grep_open_files=true, prompt_title="Live Grep in Open File"})<cr>',
      desc = '[/] in Open Files',
    },

    -- Shortcut for searching your Neovim configuration files
    { '<leader>sn', '<cmd>Telescope find_files cwd=' .. vim.fn.stdpath 'config' .. '<cr>', desc = '[N]eovim Config' },

    -- Shortcut for searching spelling suggestions
    { 'Z', '<cmd>Telescope spell_suggest theme=cursor<cr>', desc = ' Spelling Suggestions' },

    -- telescope undo tree
    { '<leader>su', '<cmd>Telescope undo<cr>', desc = '[U]ndo tree' },

    -- telescope luasnip
    { '<leader>sc', '<cmd>Telescope luasnip<cr>', desc = '[C]ompletion (Luasnip)' },

    -- telescope git pickers
    { '<leader>gl', '<cmd>Telescope git_status<cr>', desc = '[L]ist status' },
    { '<leader>bc', '<cmd>Telescope git_bcommits<cr>', desc = '[B]uffer commits history' },
    { '<leader>gb', '<cmd>Telescope git_branches<cr>', desc = '[B]ranches' },

    --
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

    require('telescope').setup {
      -- You can put your default mappings / updates / etc. in here
      --  All the info you're looking for is in `:help telescope.setup()`
      defaults = {
        mappings = {
          n = { s = flash },
          i = {
            ['<esc>'] = actions.close,
            ['<C-j>'] = actions.move_selection_next,
            ['<C-k>'] = actions.move_selection_previous,
            ['<C-n>'] = actions.cycle_history_next,
            ['<C-p>'] = actions.cycle_history_prev,
            ['<c-s>'] = flash,
          },
        },
      },
      -- pickers = {}
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
        undo = {},
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
    pcall(require('telescope').load_extension, 'noice')
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')
    pcall(require('telescope').load_extension, 'undo')
    pcall(require('telescope').load_extension, 'luasnip')
    pcall(require('telescope').load_extension, 'bibtex')
  end,
}
