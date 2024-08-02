return {
  'mfussenegger/nvim-dap',
  dependencies = {
    -- Creates a beautiful debugger UI
    'rcarriga/nvim-dap-ui',

    -- Required dependency for nvim-dap-ui
    'nvim-neotest/nvim-nio',

    -- Installs the debug adapters for you
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',

    -- display text next to variable when debugging
    { 'theHamsta/nvim-dap-virtual-text', opts = true },

    -- Add your own debuggers here
    -- 'leoluz/nvim-dap-go',

    -- ==  JS/TS debugger ==
    {
      'microsoft/vscode-js-debug',
      opt = true,
      build = 'npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out',
    },
    {
      'mxsdev/nvim-dap-vscode-js',
      config = function()
        require('dap-vscode-js').setup {
          debugger_path = vim.fn.resolve(vim.fn.expand '~' .. '/.local/share/nvim/lazy/vscode-js-debug'),
          adapters = {
            'chrome',
            'pwa-node',
            'pwa-chrome',
            'pwa-extensionHost',
          },
        }
      end,
    },
  },
  lazy = true,
  keys = {
    {
      '<leader>dc',
      function()
        require('dap').continue()
      end,
      desc = 'Debuger: Start/[C]ontinue',
    },
    {
      '<leader>db',
      function()
        require('dap').toggle_breakpoint()
      end,
      desc = 'Debuger: Toggle [B]reakpoint',
    },
    {
      '<leader>dB',
      function()
        require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
      end,
      desc = 'Debuger: Set [B]reakpoint',
    },
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    require('mason-nvim-dap').setup {
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_installation = true,

      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {},

      -- You'll need to check that you have the required things installed
      -- online, please don't ask me how to install them :)
      ensure_installed = {
        -- Update this to ensure that you have the debuggers for the langs you want
        -- 'delve',
        'js-debug-adapter',
      },
    }

    -- Basic debugging keymaps, feel free to change to your liking!
    vim.keymap.set('n', '<leader>di', dap.step_into, { desc = 'Debuger: Step [I]nto' })
    vim.keymap.set('n', '<leader>dj', dap.step_over, { desc = 'Debuger: Step Over' })
    vim.keymap.set('n', '<leader>dk', dap.step_out, { desc = 'Debuger: Step Out' })

    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    dapui.setup {
      -- Set icons to characters that are more likely to work in every terminal.
      --    Feel free to remove or use ones that you like more! :)
      --    Don't feel like these are good choices.
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      controls = {
        icons = {
          pause = '⏸',
          play = '▶',
          step_into = '⏎',
          step_over = '⏭',
          step_out = '⏮',
          step_back = 'b',
          run_last = '▶▶',
          terminate = '⏹',
          disconnect = '⏏',
        },
      },
    }

    -- Catppuccin integration
    local sign = vim.fn.sign_define
    sign('DapBreakpoint', { text = '●', texthl = 'DapBreakpoint', linehl = '', numhl = '' })
    sign('DapBreakpointCondition', { text = '●', texthl = 'DapBreakpointCondition', linehl = '', numhl = '' })
    sign('DapLogPoint', { text = '◆', texthl = 'DapLogPoint', linehl = '', numhl = '' })

    -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
    vim.keymap.set('n', '<leader>dr', dapui.toggle, { desc = 'Debug: [R]esume last session result.' })

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    -- Install golang specific config
    -- require('dap-go').setup {
    --   delve = {
    --     -- On Windows delve must be run attached or it crashes.
    --     -- See https://github.com/leoluz/nvim-dap-go/blob/main/README.md#configuring
    --     detached = vim.fn.has 'win32' == 0,
    --   },
    -- }

    -- == JS/TS: setup adapter for JavaScript/typescript ==
    for _, language in ipairs { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact', 'vue' } do
      dap.configurations[language] = {
        {
          {
            type = 'pwa-node',
            request = 'launch',
            name = 'Launch file',
            program = '${file}',
            cwd = vim.fn.getcwd(),
          },
          {
            type = 'pwa-node',
            request = 'attach',
            name = 'Attach',
            processId = require('dap.utils').pick_process,
            cwd = vim.fn.getcwd(),
          },
          {
            type = 'pwa-chrome',
            request = 'launch',
            name = 'Start Chrome with "localhost"',
            url = function()
              local co = coroutine.running()
              return coroutine.create(function()
                vim.ui.input({ prompt = 'Enter URL: ', default = 'Http://localhost:3000' }, function(url)
                  if url == nil or url == '' then
                    return
                  else
                    coroutine.resume(co, url)
                  end
                end)
              end)
            end,
            webRoot = vim.fn.getcwd(),
            userDataDir = false,
          },
        },
      }
    end
  end,
}
