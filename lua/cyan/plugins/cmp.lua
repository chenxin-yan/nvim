return { -- Autocompletion
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    -- Snippet Engine & its associated nvim-cmp source
    {
      'L3MON4D3/LuaSnip',
      build = (function()
        -- Build Step is needed for regex support in snippets.
        -- This step is not supported in many windows environments.
        -- Remove the below condition to re-enable on windows.
        if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
          return
        end
        return 'make install_jsregexp'
      end)(),
      dependencies = {
        -- `friendly-snippets` contains a variety of premade snippets.
        --    See the README about individual language/framework/plugin snippets:
        --    https://github.com/rafamadriz/friendly-snippets
        {
          'rafamadriz/friendly-snippets',
          config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
          end,
        },
      },
      config = function()
        --Load custom lua snippets
        require('luasnip.loaders.from_lua').lazy_load { paths = { '~/.config/nvim/lua/cyan/snippets/' } }
        vim.keymap.set('n', '<leader>S', '<cmd>source ~/.config/nvim/lua/cyan/plugins/cmp.lua<cr>', { desc = '[S]ource snippets' })

        -- set keybinds for select choice node in luasnip
        vim.keymap.set({ 'i', 'v' }, '<C-s>', '<cmd>lua require("luasnip.extras.select_choice")()<cr>', { desc = '[S]elect snippet choices' })
      end,
    },

    -- cmp source for github copilot
    {
      'zbirenbaum/copilot-cmp',
      config = function(_, opts)
        local copilot_cmp = require 'copilot_cmp'
        copilot_cmp.setup(opts)
        -- attach cmp source whenever copilot attaches
        -- fixes lazy-loading issues with the copilot cmp source
        vim.api.nvim_create_autocmd('LspAttach', {
          callback = function(args)
            local buffer = args.buf ---@type number
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            if client and (not 'copilot' or client.name == 'copilot') then
              return copilot_cmp._on_insert_enter { client, buffer }
            end
          end,
        })
      end,
    },

    'saadparwaiz1/cmp_luasnip',

    { 'roobert/tailwindcss-colorizer-cmp.nvim', opts = {} }, -- tailwindcss cmp source

    -- Adds other completion capabilities.
    --  nvim-cmp does not ship with all sources by default. They are split
    --  into multiple repos for maintenance purposes.
    'onsails/lspkind.nvim',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-buffer',
  },
  config = function()
    -- See `:help cmp`
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    local lspkind = require 'lspkind'
    luasnip.config.setup {
      update_events = { 'TextChanged', 'TextChangedI' },
      enable_autosnippets = true,
    }

    -- Setup lspkind github copilot symbol
    lspkind.init {
      symbol_map = {
        Copilot = '',
      },
    }

    cmp.setup {
      formatting = {
        format = lspkind.cmp_format {
          -- mode = 'symbol', -- show only symbol annotations
          maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
          ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
          show_labelDetails = true, -- show labelDetails in menu. Disabled by default
          before = require('tailwindcss-colorizer-cmp').formatter,
        },
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      completion = { completeopt = 'menu,menuone,noinsert' },

      -- For an understanding of why these mappings were
      -- chosen, you will need to read `:help ins-completion`
      --
      -- No, but seriously. Please read `:help ins-completion`, it is really good!
      mapping = cmp.mapping.preset.insert {
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.config.disable,
        ['<C-p>'] = cmp.config.disable,

        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),

        -- Accept ([y]es) the completion.
        --  This will auto-import if your LSP supports it.
        --  This will expand snippets if the LSP sent a snippet.
        ['<C-y>'] = cmp.mapping.confirm { select = true },
        --
        -- If you prefer more traditional completion keymaps,
        -- you can uncomment the following lines
        -- ['<cr>'] = cmp.mapping.confirm { select = true },
        --['<Tab>'] = cmp.mapping.select_next_item(),
        --['<S-Tab>'] = cmp.mapping.select_prev_item(),

        -- Manually trigger a completion from nvim-cmp.
        --  Generally you don't need this, because nvim-cmp will display
        --  completions whenever it has completion options available.
        -- ['<C-Space>'] = cmp.mapping.complete {},

        -- Think of <c-l> as moving to the right of your snippet expansion.
        --  So if you have a snippet that's like:
        --  function $name($args)
        --    $body
        --  end
        --
        -- <c-l> will move you to the right of each of the expansion locations.
        -- <c-h> is similar, except moving you backwards.
        ['<C-l>'] = cmp.mapping(function()
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          end
        end, { 'i', 's' }),
        ['<C-h>'] = cmp.mapping(function()
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          end
        end, { 'i', 's' }),

        -- If you want to use tab instead
        -- ['<Tab>'] = cmp.mapping(function()
        --   if luasnip.expand_or_locally_jumpable() then
        --     luasnip.expand_or_jump()
        --   end
        -- end, { 'i', 's' }),
        -- ['<S-Tab>'] = cmp.mapping(function()
        --   if luasnip.locally_jumpable(-1) then
        --     luasnip.jump(-1)
        --   end
        -- end, { 'i', 's' }),

        -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
        --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
      },
      sources = {
        { name = 'copilot', group_index = 1 },
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'buffer' },
        {
          name = 'lazydev',
          -- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
          group_index = 0,
        },
      },
      sorting = {
        priority_weight = 2,
        comparators = {
          require('copilot_cmp.comparators').prioritize,
          cmp.config.compare.offset,
          cmp.config.compare.exact,
          cmp.config.compare.recently_used,
          require 'clangd_extensions.cmp_scores',
          cmp.config.compare.kind,
          cmp.config.compare.sort_text,
          cmp.config.compare.length,
          cmp.config.compare.order,
        },
      },
    }
  end,
}
