-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. Available keys are:
--  - cmd (table): Override the default command used to start the server
--  - filetypes (table): Override the default list of associated filetypes for the server
--  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
--  - settings (table): Override the default settings passed when initializing the server.
--        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
local servers = {
  clangd = {
    root_dir = function(fname)
      return require('lspconfig.util').root_pattern(
        'Makefile',
        'configure.ac',
        'configure.in',
        'config.h.in',
        'meson.build',
        'meson_options.txt',
        'build.ninja'
      )(fname) or require('lspconfig.util').root_pattern('compile_commands.json', 'compile_flags.txt')(fname) or require('lspconfig.util').find_git_ancestor(
        fname
      )
    end,
    capabilities = {
      offsetEncoding = { 'utf-16' },
    },
    cmd = {
      'clangd',
      '--background-index',
      '--clang-tidy',
      '--header-insertion=iwyu',
      '--completion-style=detailed',
      '--function-arg-placeholders',
      '--fallback-style=llvm',
    },
    init_options = {
      usePlaceholders = true,
      completeUnimported = true,
      clangdFileStatus = true,
    },
  }, -- C/C++ lsp
  -- gopls = {},
  marksman = {}, -- markdown lsp
  -- rust_analyzer = {},
  -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
  vtsls = {
    filetypes = {
      'javascript',
      'javascriptreact',
      'javascript.jsx',
      'typescript',
      'typescriptreact',
      'typescript.tsx',
    },
    settings = {
      complete_function_calls = true,
      vtsls = {
        enableMoveToFileCodeAction = true,
        autoUseWorkspaceTsdk = true,
        experimental = {
          completion = {
            enableServerSideFuzzyMatch = true,
          },
        },
      },
      typescript = {
        updateImportsOnFileMove = { enabled = 'always' },
        suggest = {
          completeFunctionCalls = true,
        },
        inlayHints = {
          enumMemberValues = { enabled = true },
          functionLikeReturnTypes = { enabled = true },
          parameterNames = { enabled = 'literals' },
          parameterTypes = { enabled = true },
          propertyDeclarationTypes = { enabled = true },
          variableTypes = { enabled = false },
        },
      },
      javascript = {
        updateImportsOnFileMove = { enabled = 'always' },
        suggest = {
          completeFunctionCalls = true,
        },
        inlayHints = {
          enumMemberValues = { enabled = true },
          functionLikeReturnTypes = { enabled = true },
          parameterNames = { enabled = 'literals' },
          parameterTypes = { enabled = true },
          propertyDeclarationTypes = { enabled = true },
          variableTypes = { enabled = false },
        },
      },
    },
  },
  html = {}, -- HTML lsp
  cssls = {}, -- CSS lsp
  lua_ls = { -- Lua lsp
    -- cmd = {...},
    -- filetypes = { ...},
    -- capabilities = {},
    settings = {
      Lua = {
        completion = {
          callSnippet = 'Replace',
        },
        codeLens = {
          enable = true,
        },
        doc = {
          privateName = { '^_' },
        },
        -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
        diagnostics = { disable = { 'missing-fields' } },
        hint = { enable = true },
      },
    },
  },
  jsonls = { -- JSON lsp
    on_new_config = function(new_config)
      new_config.settings.json.schemas = new_config.settings.json.schemas or {}
      vim.list_extend(new_config.settings.json.schemas, require('schemastore').json.schemas())
    end,
    settings = {
      json = {
        format = {
          enable = true,
        },
        validate = { enable = true },
      },
    },
  },
  jdtls = {}, -- java lsp
  taplo = {}, -- toml lsp
  eslint = { -- linter for javascript
    settings = {
      -- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
      workingDirectories = { mode = 'auto' },
    },
  },
  vale_ls = { -- prose linter lsp
    -- NOTE: need to sync vale packages with `vale sync` command or enable syncOnStartup
    -- init_options = {
    --   syncOnStartup = true,
    -- },
  },
}
-- You can add other tools here that you want Mason to install
-- for you, so that they are available from within Neovim.
local ensure_installed = vim.tbl_keys(servers or {})
vim.list_extend(ensure_installed, {
  -- Formatters
  'stylua', -- lua formatter
  'prettier', -- javascript formatter
  'sqlfluff', -- SQL formmater & linter
  -- Linters
  'markdownlint-cli2', -- markdown linter & formatter
  'vale', -- prose linter
  -- debugger
  'js-debug-adapter', -- javascript debugger
  'java-debug-adapter', -- java debugger
  'codelldb', -- C/C++ debugger
  -- Testing
  'java-test',
})

return {
  { -- Mason and auto installation setup
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = {
      'williamboman/mason.nvim',
    },
    config = function()
      -- Ensure the servers and tools above are installed
      --  To check the current status of installed tools and/or manually install
      --  other tools, you can run
      --    :Mason
      --
      --  You can press `g?` for help in this menu.
      require('mason').setup()

      require('mason-tool-installer').setup { ensure_installed = ensure_installed }
    end,
  },

  -- == LSP Plugins==
  --- incremental renaming
  {
    'smjonas/inc-rename.nvim',
    keys = {
      {
        '<leader>rn',
        ':IncRename ',
        desc = 'Rename',
      },
    },
    config = function()
      require('inc_rename').setup {
        save_in_cmdline_history = false,
      }
    end,
  },
  {
    'SmiteshP/nvim-navic',
    lazy = true,
    init = function()
      vim.g.navic_silence = true
    end,
    opts = function()
      return {
        highlight = true,
        depth_limit = 5,
        lazy_update_context = true,
      }
    end,
  },

  -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
  -- used for completion, annotations and signatures of Neovim apis
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
  },
  { 'Bilal2453/luvit-meta', lazy = true },

  -- java lsp config
  { 'mfussenegger/nvim-jdtls', lazy = true, ft = 'java', dependencies = 'mfussenegger/nvim-dap' },

  -- json schema support
  { 'b0o/schemastore.nvim', lazy = true },

  -- JS/TS
  { 'yioneko/nvim-vtsls', lazy = true },
  { 'dmmulroy/ts-error-translator.nvim', ft = { 'javascript', 'typescript' } }, -- make typescript error more readable

  -- C/C++
  { 'p00f/clangd_extensions.nvim', lazy = true },

  -- == Main LSP configs ==
  { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {

      -- Automatically install LSPs and related tools to stdpath for Neovim
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- Allows extra capabilities provided by nvim-cmp
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      -- If you're wondering about lsp vs treesitter, you can check out the wonderfully
      -- and elegantly composed help section, `:help lsp-vs-treesitter`

      --  This function gets run when an LSP attaches to a particular buffer.
      --    That is to say, every time a new file is opened that is associated with
      --    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
      --    function will be executed to configure the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
        callback = function(event)
          -- In this case, we create a function that lets us more easily define mappings specific
          -- for LSP related items. It sets the mode, buffer and description for us each time.

          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          -- Jump to the definition of the word under your cursor.
          --  This is where a variable was first declared, or where a function is defined, etc.
          --  To jump back, press <C-t>.
          map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

          -- Find references for the word under your cursor.
          map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

          -- Jump to the implementation of the word under your cursor.
          --  Useful when your language has ways of declaring types without an actual implementation.
          map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

          -- Jump to the type of the word under your cursor.
          --  Useful when you're not sure what type a variable is and you want to see
          --  the definition of its *type*, not where it was *defined*.
          map('gt', require('telescope.builtin').lsp_type_definitions, '[G]oto [T]ype definition')

          -- Fuzzy find all the symbols in your current document.
          --  Symbols are things like variables, functions, types, etc.
          map('<leader>ss', require('telescope.builtin').lsp_document_symbols, 'Document [S]ymbols')

          -- Fuzzy find all the symbols in your current workspace.
          --  Similar to document symbols, except searches over your entire project.
          map('<leader>sS', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Workspace [S]ymbols')

          -- Rename the variable under your cursor.
          --  Most Language Servers support renaming across files, etc.
          -- map('<leader>cr', vim.lsp.buf.rename, '[R]e[n]ame')

          -- Execute a code action, usually your cursor needs to be on top of an error
          -- or a suggestion from your LSP for this to activate.
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })

          -- This is not Goto Definition, this is Goto Declaration.
          --  For example, in C this would take you to the header.
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          --
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
            local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = 'lsp-highlight', buffer = event2.buf }
              end,
            })

            -- The following code creates a keymap to toggle inlay hints in your
            -- code, if the language server you are using supports them
            --
            -- This may be unwanted, since they displace some of your code
            if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
              map('<leader>th', function()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
              end, '[T]oggle Inlay [H]ints')
            end

            -- lsp codelens
            if vim.lsp.codelens and vim.lsp.protocol.Methods.textDocument_codeLens then
              map('<leader>cc', vim.lsp.codelens.run, 'Run [C]odelens', 'n')
              vim.lsp.codelens.refresh()
              vim.api.nvim_create_autocmd({ 'BufEnter', 'InsertLeave' }, {
                buffer = 0,
                callback = vim.lsp.codelens.refresh,
              })
            end

            -- navic.nvim attach to lsp server
            local navic = require 'nvim-navic'
            if client.server_capabilities.documentSymbolProvider then
              navic.attach(client, event.buf)
            end

            -- == config specific to language ==
            if client and client.name == 'vtsls' then
              -- setup vtsls keymaps for JS/TS
              local vtsls = require 'vtsls'
              vim.keymap.set('n', '<leader>co', function()
                vtsls.commands['organize_imports'](0)
              end, { desc = 'vtsls: [O]rganize imports' })
              vim.keymap.set('n', '<leader>cC', function()
                vtsls.commands['goto_project_config'](0)
              end, { desc = 'vtsls: Go to Project [C]onfig' })
              vim.keymap.set('n', '<leader>cf', function()
                vtsls.commands['fix_all'](0)
              end, { desc = 'vtsls: [F]ix all' })
              vim.keymap.set('n', '<leader>cA', function()
                vtsls.commands['source_actions'](0)
              end, { desc = 'vtsls: Source [A]ction' })
              vim.keymap.set('n', '<leader>cF', '<cmd>EslintFixAll<cr>', { desc = 'Eslint: [F]ix all', buffer = 0 })

              -- setup codelens for JS/TS
              vim.lsp.commands['editor.action.showReferences'] = function(command, ctx)
                local locations = command.arguments[3]
                if locations and #locations > 0 then
                  local items = vim.lsp.util.locations_to_items(locations, client.offset_encoding)
                  vim.fn.setloclist(0, {}, ' ', { title = 'References', items = items, context = ctx })
                  vim.api.nvim_command 'lopen'
                end
              end
            elseif client and client.name == 'clangd' then
              -- setup clangd keymaps for cs/c++
              vim.keymap.set('n', '<leader>ch', '"<cmd>ClangdSwitchSourceHeader<cr>"', { desc = 'Clangd: Switch Source/[H]eader (C/C++)', buffer = 0 })
              require('clangd_extensions').setup {
                inlay_hints = {
                  inline = false,
                },
                ast = {
                  --These require codicons (https://github.com/microsoft/vscode-codicons)
                  role_icons = {
                    type = '',
                    declaration = '',
                    expression = '',
                    specifier = '',
                    statement = '',
                    ['template argument'] = '',
                  },
                  kind_icons = {
                    Compound = '',
                    Recovery = '',
                    TranslationUnit = '',
                    PackExpansion = '',
                    TemplateTypeParm = '',
                    TemplateTemplateParm = '',
                    TemplateParamObject = '',
                  },
                },
              }
              require('clangd_extensions.inlay_hints').setup_autocmd()
            end
          end
        end,
      })

      -- LSP servers and clients are able to communicate to each other what features they support.
      --  By default, Neovim doesn't support everything that is in the LSP specification.
      --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
      --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      -- get default config from nvim-vtsls
      require('lspconfig.configs').vtsls = require('vtsls').lspconfig

      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            -- Don't call setup for JDTLS Java LSP because it will be setup from a separate config
            if server_name ~= 'jdtls' then
              local server = servers[server_name] or {}
              -- This handles overriding only values explicitly passed
              -- by the server configuration above. Useful when disabling
              -- certain features of an LSP (for example, turning off formatting for tsserver)
              server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
              require('lspconfig')[server_name].setup(server)
            end
          end,
        },
      }
    end,
  },
}
