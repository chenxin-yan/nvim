if vim.g.vscode then
  return {}
end

return {
  {
    'saghen/blink.compat',
    -- use the latest release, via version = '*', if you also use the latest release for blink.cmp
    version = '*',
    -- lazy.nvim will automatically load the plugin when it's required by blink.cmp
    lazy = true,
    -- make sure to set opts so that lazy.nvim calls blink.compat's setup
    opts = {},
  },
  {
    'chrisgrieser/nvim-scissors',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = 'nvim-telescope/telescope.nvim',
    opts = {
      snippetDir = vim.fn.stdpath 'config' .. '/snippets',
      telescope = {
        alsoSearchSnippetBody = true,
      },
      jsonFormatter = 'jq',
    },
    keys = {
      { '<leader>Se', '<cmd>lua require("scissors").editSnippet()<cr>', desc = 'Snippet: Edit' },
      { '<leader>Sa', '<cmd>lua require("scissors").addNewSnippet()<cr>', desc = 'Snippet: Add' },
    },
  },
  {
    'saghen/blink.cmp',
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        lazy = true,
        -- follow latest release.
        version = 'v2.*', -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        build = (function()
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          {
            'rafamadriz/friendly-snippets',
            config = function()
              require('luasnip.loaders.from_vscode').lazy_load()
              require('luasnip.loaders.from_vscode').lazy_load { paths = { vim.fn.stdpath 'config' .. '/snippets' } }
            end,
          },
        },
      },
      'kristijanhusak/vim-dadbod-completion',
      {
        'giuxtaposition/blink-cmp-copilot',
        {
          'zbirenbaum/copilot.lua',
          cmd = 'Copilot',
          build = ':Copilot auth',
          opts = {
            suggestion = {
              enabled = false,
              auto_trigger = true,
              keymap = {
                accept = false,
              },
            },
            panel = { enabled = false },
            filetypes = {
              help = true,
            },
          },
        },
      },
    },
    event = 'InsertEnter',
    version = '*',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- 'default' for mappings similar to built-in completion
      -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
      -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
      -- See the full "keymap" documentation for information on defining your own keymap.
      keymap = {
        preset = 'none',
        ['<C-n>'] = {
          function(cmp)
            cmp.show { providers = { 'snippets' } }
          end,
        },
        ['<C-a>'] = {
          function(cmp)
            cmp.show { providers = { 'copilot' } }
          end,
        },
        ['<C-i>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<C-e>'] = { 'hide' },
        ['<C-y>'] = { 'select_and_accept' },

        ['<C-k>'] = { 'select_prev', 'fallback' },
        ['<C-j>'] = { 'select_next', 'fallback' },

        ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

        ['<C-l>'] = { 'snippet_forward', 'fallback' },
        ['<C-h>'] = { 'snippet_backward', 'fallback' },
      },
      appearance = {
        use_nvim_cmp_as_default = false,
        nerd_font_variant = 'mono',
        kind_icons = {
          Copilot = '',
          Text = '󰉿',
          Method = '󰊕',
          Function = '󰊕',
          Constructor = '󰒓',

          Field = '󰜢',
          Variable = '󰆦',
          Property = '󰖷',

          Class = '󱡠',
          Interface = '󱡠',
          Struct = '󱡠',
          Module = '󰅩',

          Unit = '󰪚',
          Value = '󰦨',
          Enum = '󰦨',
          EnumMember = '󰦨',

          Keyword = '󰻾',
          Constant = '󰏿',

          Snippet = '󱄽',
          Color = '󰏘',
          File = '󰈔',
          Reference = '󰬲',
          Folder = '󰉋',
          Event = '󱐋',
          Operator = '󰪚',
          TypeParameter = '󰬛',
        },
      },
      completion = {
        accept = {
          -- experimental auto-brackets support
          auto_brackets = {
            enabled = true,
          },
        },
        menu = {
          draw = {
            treesitter = { 'lsp' },
            columns = {
              { 'label', 'label_description', gap = 1 },
              { 'kind_icon', gap = 1, 'kind' },
            },
          },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
        },
        ghost_text = {
          enabled = false,
        },
      },
      snippets = {
        preset = 'default',
      },
      sources = {
        default = {
          'lazydev',
          'lsp',
          'path',
          'snippets',
          'buffer',
          'dadbod',
          'copilot',
          'avante_commands',
          'avante_mentions',
          'avante_files',
        },
        cmdline = {},
        providers = {
          lsp = {
            score_offset = 80,
            max_items = 8,
          },
          path = {
            score_offset = 80,
          },
          snippets = {
            score_offset = 70,
            max_items = 5,
            opts = {
              search_paths = { vim.fn.stdpath 'config' .. '/snippets' },
            },
          },
          lazydev = {
            name = 'LazyDev',
            module = 'lazydev.integrations.blink',
            score_offset = 100,
          },
          dadbod = {
            name = 'Dadbod',
            module = 'vim_dadbod_completion.blink',
            score_offset = 90,
          },
          copilot = {
            name = 'copilot',
            module = 'blink-cmp-copilot',
            score_offset = -30,
            async = true,
            transform_items = function(_, items)
              local CompletionItemKind = require('blink.cmp.types').CompletionItemKind
              local kind_idx = #CompletionItemKind + 1
              CompletionItemKind[kind_idx] = 'Copilot'
              for _, item in ipairs(items) do
                item.kind = kind_idx
              end
              return items
            end,
          },
          avante_commands = {
            name = 'avante_commands',
            module = 'blink.compat.source',
            score_offset = 90, -- show at a higher priority than lsp
            opts = {},
          },
          avante_files = {
            name = 'avante_files',
            module = 'blink.compat.source',
            score_offset = 100, -- show at a higher priority than lsp
            opts = {},
          },
          avante_mentions = {
            name = 'avante_mentions',
            module = 'blink.compat.source',
            score_offset = 1000, -- show at a higher priority than lsp
            opts = {},
          },
        },
      },
    },
    opts_extend = { 'sources.default', 'sources.providers' },

    -- Experimental signature help support
    signature = { enabled = true },
  },
}
