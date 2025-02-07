local function keymap()
  if vim.opt.iminsert:get() > 0 and vim.b.keymap_name then
    return '⌨ ' .. vim.b.keymap_name
  end
  return ''
end

local function get_attached_clients()
  -- Get active clients for current buffer
  local buf_clients = vim.lsp.get_clients { bufnr = 0 }
  if #buf_clients == 0 then
    return ''
  end
  local buf_ft = vim.bo.filetype
  local buf_client_names = {}
  local num_client_names = #buf_client_names

  -- Add lsp-clients active in the current buffer
  for _, client in pairs(buf_clients) do
    num_client_names = num_client_names + 1
    buf_client_names[num_client_names] = client.name
  end

  -- Add linters for the current filetype (nvim-lint)
  -- local lint_success, lint = pcall(require, 'lint')
  -- if lint_success then
  --   for ft, ft_linters in pairs(lint.linters_by_ft) do
  --     if ft == buf_ft then
  --       if type(ft_linters) == 'table' then
  --         for _, linter in pairs(ft_linters) do
  --           num_client_names = num_client_names + 1
  --           buf_client_names[num_client_names] = linter
  --         end
  --       else
  --         num_client_names = num_client_names + 1
  --         buf_client_names[num_client_names] = ft_linters
  --       end
  --     end
  --   end
  -- end

  -- Add formatters (conform.nvim)
  -- local conform_success, conform = pcall(require, 'conform')
  -- if conform_success then
  --   for _, formatter in pairs(conform.list_formatters_for_buffer(0)) do
  --     if formatter then
  --       num_client_names = num_client_names + 1
  --       buf_client_names[num_client_names] = formatter
  --     end
  --   end
  -- end
  -- Filter out Copilot from the clients list
  local filtered_clients = vim.tbl_filter(function(client_name)
    return client_name:lower() ~= 'copilot'
  end, buf_client_names)

  local client_names_str = table.concat(filtered_clients, ' | ')
  local language_servers = string.format('󰅡 %s ', client_names_str)

  return language_servers
end

local colors = {
  lavender = '#b4befe',
  green = '#a6e3a1',
  maroon = '#eba0ac',
  flamingo = '#f2cdcd',
  mantle = '#181825',
  surface = '#313244',
  text = '#cdd6f4',
  subtext = '#9399b2',
}

local custom_catppuccin = {
  normal = {
    a = { fg = colors.mantle, bg = colors.lavender },
    b = { fg = colors.text, bg = colors.surface },
    c = { fg = colors.subtext },
  },

  insert = { a = { fg = colors.mantle, bg = colors.green } },
  visual = { a = { fg = colors.mantle, bg = colors.flamingo } },
  replace = { a = { fg = colors.mantle, bg = colors.maroon } },

  inactive = {
    a = { fg = colors.mantle, bg = colors.lavender },
    b = { fg = colors.text, bg = colors.surface },
    c = { fg = colors.subtext },
  },
}
return {
  'nvim-lualine/lualine.nvim',
  event = 'VeryLazy',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  init = function()
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      -- set an empty statusline till lualine loads
      vim.o.statusline = ' '
    else
      -- hide the statusline on the starter page
      vim.o.laststatus = 0
    end
  end,
  opts = function()
    local lualine_require = require 'lualine_require'
    lualine_require.require = require

    vim.o.laststatus = vim.g.lualine_laststatus
    local attached_clients = {
      get_attached_clients,
      color = {
        gui = 'bold',
      },
    }

    local opts = {
      options = {
        theme = custom_catppuccin,
        globalstatus = vim.o.laststatus == 3,
        disabled_filetypes = { statusline = { 'dashboard', 'alpha', 'ministarter', 'snacks_dashboard', 'Avante' } },
        component_separators = ' ',
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = { { 'mode', padding = { left = 2, right = 1 }, color = { gui = 'bold' } } },
        lualine_b = {
          { 'branch', icon = '', padding = { left = 1, right = 1 } },
        },
        lualine_c = {
          {
            '%=',
            component_separators = '',
          },
          {
            'diagnostics',
            symbols = {
              error = ' ',
              warn = ' ',
              info = ' ',
              hint = ' ',
            },
          },
        },
        lualine_x = {
          attached_clients,
        },
        lualine_y = {
          { 'progress', separator = ' ', padding = { left = 1, right = 0 } },
          { 'location', padding = { left = 0, right = 1 } },
        },
        lualine_z = {
          {
            function()
              return '󰉖 ' .. vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
            end,
            padding = { left = 1, right = 2 },
            color = { gui = 'bold' },
          },
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
      },
      extensions = {},
    }

    return opts
  end,
}
