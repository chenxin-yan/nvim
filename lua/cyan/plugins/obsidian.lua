if vim.g.has_obsidian then
  return {
    'epwalsh/obsidian.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    ft = 'markdown',
    event = {
      'BufReadPre ' .. vim.fn.expand '~' .. '/Documents/Ideaverse/**.md',
      'BufNewFile ' .. vim.fn.expand '~' .. '/Documents/Ideaverse/**.md',
    },
    keys = {
      { '<M-d>', '<cmd>ObsidianToday<CR>', desc = 'Open [D]aily note' },
    },
    config = function()
      -- set conceallevel
      vim.opt.conceallevel = 2

      -- obsidian plugin setup
      require('obsidian').setup {
        workspaces = {
          {
            name = 'Ideaverse',
            path = vim.fn.expand '~' .. '/Documents/Ideaverse',
          },
        },

        daily_notes = {
          folder = 'Dailies',
          alias_format = '%Y-%m-%d',
          template = 'Miscs/Templates/Daily Note Template',
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
      }

      -- nvim keymaps
      local function obMap(key, cmd, desc)
        vim.keymap.set({ 'n', 'v' }, '<leader>o' .. key, cmd, { desc = desc })
      end

      obMap('t', '<cmd>ObsidianTemplate<CR>', 'Insert [T]emplate')
      obMap('b', '<cmd>ObsidianBacklinks<CR>', 'Search [B]acklinks')
      obMap('l', '<cmd>Obsidianlinks<CR>', 'Search [L]inks in current note')
      obMap('f', '<cmd>ObsidianFollowLink vsplit<CR>', '[F]ollow note to a new window')
      obMap('o', '<cmd>ObsidianOpen<CR>', '[O]pen in [O]bsidian')
      obMap('N', ':ObsidianExtractNote ', '[N]ew note with a link')
      obMap('n', ':ObsidianNew ', '[N]ew Note')
      require('which-key').add { '<leader>o', group = ' [O]bsidian' }
    end,
  }
end

return {}
