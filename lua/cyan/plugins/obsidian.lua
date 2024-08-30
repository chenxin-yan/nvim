local vault_path = vim.fn.expand '~' .. '/Documents/Ideaverse'
return {
  'epwalsh/obsidian.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  event = {
    'BufReadPre ' .. vault_path .. '/**.md',
    'BufNewFile ' .. vault_path .. '/**.md',
  },
  keys = {
    {
      '<leader>so',
      function()
        require('telescope.builtin').find_files { cwd = vault_path }
      end,
      desc = '[O]bsidian Vault',
    },
    {
      '<leader>sO',
      '<cmd>ObsidianSearch<cr>',
      desc = 'Grep [O]bsidian Vault',
    },
    {
      '<leader>O',
      ':ObsidianNew ',
      desc = 'New [O]bsidian Note',
    },
  },
  config = function()
    -- set conceallevel
    vim.opt.conceallevel = 2

    -- obsidian plugin setup
    require('obsidian').setup {
      ui = { enable = false },
      workspaces = {
        {
          name = 'Ideaverse',
          path = vim.fn.expand '~' .. '/Documents/Ideaverse',
        },
      },

      mappings = {
        -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
        ['gf'] = {
          action = function()
            return require('obsidian').util.gf_passthrough()
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
        -- Smart action depending on context, either follow link or toggle checkbox.
        -- ['<cr>'] = {
        --   action = function()
        --     return require('obsidian').util.smart_action()
        --   end,
        --   opts = { buffer = true, expr = true },
        -- },
      },

      templates = {
        folder = 'Miscs/Templates',
        date_format = '%Y-%m-%d',
        time_format = '%H:%M',
      },

      notes_subdir = '+ Inbox',
      new_notes_location = 'notes_subdir',

      note_path_func = function(spec)
        local path = spec.dir / spec.title
        return path:with_suffix '.md'
      end,
      disable_frontmatter = true,
      wiki_link_func = 'use_alias_only',
      open_app_foreground = true,
    }

    -- nvim keymaps
    local function obMap(key, cmd, desc)
      vim.keymap.set({ 'n', 'v' }, '<leader>o' .. key, cmd, { desc = desc })
    end

    obMap('t', '<cmd>ObsidianTemplate<cr>', 'Insert [T]emplate')
    obMap('b', '<cmd>ObsidianBacklinks<cr>', 'Search [B]acklinks')
    obMap('l', '<cmd>Obsidianlinks<cr>', 'Search [L]inks in current note')
    obMap('f', '<cmd>ObsidianFollowLink vsplit<cr>', '[F]ollow note to a new window')
    obMap('o', '<cmd>ObsidianOpen<cr>', '[O]pen in [O]bsidian')
    obMap('e', ':ObsidianExtractNote ', '[E]xtract to a new note')

    require('which-key').add { '<leader>o', group = ' [O]bsidian' }
  end,
}
