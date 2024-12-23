if vim.g.vscode then
  return {}
end
vim.api.nvim_set_hl(0, 'BlinkCmpKindCopilot', { fg = '#94e2d6' })

return {
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
      opts = {
        history = true,
        delete_check_events = 'TextChanged',
      },
      config = function()
        -- Load custom lua snippets
        require('luasnip.loaders.from_lua').lazy_load { paths = { '~/.config/nvim/lua/cyan/snippets/' } }
        vim.keymap.set('n', '<leader>S', '<cmd>source ~/.config/nvim/lua/cyan/plugins/blink-cmp.lua<cr>', { desc = '[S]ource snippets' })

        -- set keybinds for select choice node in luasnip
        vim.keymap.set({ 'i', 'v' }, '<C-s>', '<cmd>lua require("luasnip.extras.select_choice")()<cr>', { desc = '[S]elect snippet choices' })
      end,
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
          cmp.show { providers = { 'snippets', 'luasnip' } }
        end,
      },
      ['<C-i>'] = { 'show', 'show_documentation', 'hide_documentation' },
      ['<C-e>'] = { 'hide' },
      ['<C-y>'] = { 'select_and_accept' },

      ['<C-k>'] = { 'select_prev', 'fallback' },
      ['<C-j>'] = { 'select_next', 'fallback' },

      ['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
      ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },

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
        enabled = true,
      },
    },
    snippets = {
      expand = function(snippet)
        require('luasnip').lsp_expand(snippet)
      end,
      active = function(filter)
        if filter and filter.direction then
          return require('luasnip').jumpable(filter.direction)
        end
        return require('luasnip').in_snippet()
      end,
      jump = function(direction)
        require('luasnip').jump(direction)
      end,
    },
    sources = {
      default = { 'lazydev', 'lsp', 'path', 'snippets', 'luasnip', 'buffer', 'dadbod', 'copilot' },
      cmdline = {},
      providers = {
        luasnip = {
          score_offset = 100,
        },
        snippets = {
          score_offset = 100,
        },
        lsp = {
          score_offset = 50,
        },
        lazydev = {
          name = 'LazyDev',
          module = 'lazydev.integrations.blink',
          score_offset = 90,
        },
        dadbod = {
          name = 'Dadbod',
          module = 'vim_dadbod_completion.blink',
          score_offset = 90,
        },
        copilot = {
          name = 'copilot',
          module = 'blink-cmp-copilot',
          score_offset = 40,
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
      },
    },
  },
  opts_extend = { 'sources.default' },
}
