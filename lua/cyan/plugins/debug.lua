return {
  'mfussenegger/nvim-dap',
  dependencies = {
    -- Creates a beautiful debugger UI
    'rcarriga/nvim-dap-ui',

    -- Required dependency for nvim-dap-ui
    'nvim-neotest/nvim-nio',

    -- display text next to variable when debugging
    { 'theHamsta/nvim-dap-virtual-text', opts = true },

    -- go debugger
    {
      'leoluz/nvim-dap-go',
      opts = {},
    },

    -- python dap
    {
      'mfussenegger/nvim-dap-python',
      -- stylua: ignore
      keys = {
        { "<leader>dM", function() require('dap-python').test_method() end, desc = "Debug Method", ft = "python" },
        { "<leader>dC", function() require('dap-python').test_class() end, desc = "Debug Class", ft = "python" },
      },
      config = function()
        require('dap-python').setup '~/.local/share/nvim/mason/packages/debugpy/venv/bin/python'
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
    {
      '<leader>td',
      function()
        require('neotest').run.run { strategy = 'dap' }
      end,
      desc = 'Neotest: [D]ebug Nearest',
    },
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    -- Basic debugging keymaps, feel free to change to your liking!
    vim.keymap.set('n', '<leader>di', dap.step_into, { desc = 'Debuger: Step [I]nto' })
    vim.keymap.set('n', '<leader>dj', dap.step_over, { desc = 'Debuger: Step Over' })
    vim.keymap.set('n', '<leader>dk', dap.step_out, { desc = 'Debuger: Step Out' })
    vim.keymap.set('n', '<leader>du', dapui.toggle, { desc = 'Dap UI' })
    vim.keymap.set('n', '<leader>dt', dap.terminate, { desc = 'Terminate' })

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

    -- == JAVASCRIPT/TYPESCRIPT ==
    dap.adapters['pwa-node'] = {
      type = 'server',
      host = 'localhost',
      port = '${port}',
      executable = {
        command = 'node',
        args = { vim.fn.expand '~/.local/share/nvim/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js', '${port}' },
      },
    }
    dap.adapters['node'] = function(cb, config)
      if config.type == 'node' then
        config.type = 'pwa-node'
      end
      local nativeAdapter = dap.adapters['pwa-node']
      if type(nativeAdapter) == 'function' then
        nativeAdapter(cb, config)
      else
        cb(nativeAdapter)
      end
    end
    local js_filetypes = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact' }
    for _, language in ipairs(js_filetypes) do
      dap.configurations[language] = {
        {
          type = 'pwa-node',
          request = 'launch',
          name = 'Launch file',
          program = '${file}',
          cwd = '${workspaceFolder}',
        },
        {
          type = 'pwa-node',
          request = 'attach',
          name = 'Attach',
          processId = require('dap.utils').pick_process,
          cwd = '${workspaceFolder}',
        },
      }
    end

    -- == JAVA ==
    dap.configurations.java = {
      {
        name = 'Debug Launch (2GB)',
        type = 'java',
        request = 'launch',
        vmArgs = '' .. '-Xmx2g ',
      },
      {
        name = 'Debug Attach (8000)',
        type = 'java',
        request = 'attach',
        hostName = '127.0.0.1',
        port = 8000,
      },
      {
        name = 'Debug Attach (5005)',
        type = 'java',
        request = 'attach',
        hostName = '127.0.0.1',
        port = 5005,
      },
    }

    -- == C/C++ ==
    if not dap.adapters['codelldb'] then
      require('dap').adapters['codelldb'] = {
        type = 'server',
        host = 'localhost',
        port = '${port}',
        executable = {
          command = 'codelldb',
          args = {
            '--port',
            '${port}',
          },
        },
      }
    end
    for _, lang in ipairs { 'c', 'cpp' } do
      dap.configurations[lang] = {
        {
          type = 'codelldb',
          request = 'launch',
          name = 'Launch file',
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
          cwd = '${workspaceFolder}',
        },
        {
          type = 'codelldb',
          request = 'attach',
          name = 'Attach to process',
          pid = require('dap.utils').pick_process,
          cwd = '${workspaceFolder}',
        },
      }
    end
  end,
}
