return {
  'goolord/alpha-nvim',
  event = 'VimEnter',
  init = false,
  opts = function()
    local dashboard = require 'alpha.themes.dashboard'
    local version = vim.version()
    -- Define and set highlight groups for each logo line
    vim.api.nvim_set_hl(0, 'NeovimDashboardLogo1', { fg = '#b4befe' })
    vim.api.nvim_set_hl(0, 'NeovimDashboardLogo2', { fg = '#89b4fa' })
    vim.api.nvim_set_hl(0, 'NeovimDashboardLogo3', { fg = '#74c7ec' })
    vim.api.nvim_set_hl(0, 'NeovimDashboardLogo4', { fg = '#89dceb' })
    vim.api.nvim_set_hl(0, 'NeovimDashboardLogo5', { fg = '#94e2d5' })
    vim.api.nvim_set_hl(0, 'NeovimDashboardLogo6', { fg = '#94e2d5' })
    vim.api.nvim_set_hl(0, 'NeovimDashboardUsername', { fg = '#bac2de' })
    dashboard.section.header.type = 'group'
    dashboard.section.header.val = {
      {
        type = 'text',
        val = '   ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ',
        opts = { hl = 'NeovimDashboardLogo1', shrink_margin = false, position = 'center' },
      },
      {
        type = 'text',
        val = '   ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ',
        opts = { hl = 'NeovimDashboardLogo2', shrink_margin = false, position = 'center' },
      },
      {
        type = 'text',
        val = '   ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ',
        opts = { hl = 'NeovimDashboardLogo3', shrink_margin = false, position = 'center' },
      },
      {
        type = 'text',
        val = '   ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ',
        opts = { hl = 'NeovimDashboardLogo4', shrink_margin = false, position = 'center' },
      },
      {
        type = 'text',
        val = '   ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ',
        opts = { hl = 'NeovimDashboardLogo5', shrink_margin = false, position = 'center' },
      },
      {
        type = 'text',
        val = '   ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ',
        opts = { hl = 'NeovimDashboardLogo6', shrink_margin = false, position = 'center' },
      },
      {
        type = 'padding',
        val = 1,
      },
      {
        type = 'text',
        val = ' ࣪⊹ ' .. os.date '  %d %B ' .. ' • ' .. '  v' .. version.major .. '.' .. version.minor .. '.' .. version.patch .. ' ⊹ ࣪',
        opts = { hl = 'NeovimDashboardUsername', shrink_margin = false, position = 'center' },
      },
    }
    -- stylua: ignore
    dashboard.section.buttons.val = {
      -- dashboard.button('e', '  > New file', '<cmd> ene <BAR> startinsert <cr>'),
      dashboard.button('f', '󰈞  > Find file', '<cmd>Telescope find_files<cr>'),
      dashboard.button('g', '󰺮  > Grep text', '<cmd>Telescope live_grep<cr>'),
      dashboard.button('s', '󱊒  > Search workspace ', '<cmd>SessionSearch<cr>'),
      dashboard.button('r', '󰚰  > Restore workspace', '<cmd>SessionRestore<cr>'),
      -- dashboard.button('c', '  > Configration', '<cmd>cd ~/.config/nvim<cr><cmd>Telescope find_files<cr>'),
      dashboard.button('u', '  > Update plugins', '<cmd>Lazy update<cr>'),
      dashboard.button('q', '󰈆  > Quit NVIM', '<cmd>qa<cr>'),
    }
    vim.api.nvim_set_hl(0, 'AlphaHeader', { fg = '#b4befe' })
    vim.api.nvim_set_hl(0, 'AlphaButtons', { fg = '#cdd6f4' })
    vim.api.nvim_set_hl(0, 'AlphaShortcut', { fg = '#a6adc8' })
    vim.api.nvim_set_hl(0, 'AlphaFooter', { fg = '#f9e2af' })

    for _, button in ipairs(dashboard.section.buttons.val) do
      button.opts.hl = 'AlphaButtons'
      button.opts.hl_shortcut = 'AlphaShortcut'
    end
    dashboard.section.header.opts.hl = 'AlphaHeader'
    dashboard.section.buttons.opts.hl = 'AlphaButtons'
    dashboard.section.footer.opts.hl = 'AlphaFooter'
    dashboard.opts.layout[1].val = 3
    return dashboard
  end,
  config = function(_, dashboard)
    -- close Lazy and re-open when the dashboard is ready
    if vim.o.filetype == 'lazy' then
      vim.cmd.close()
      vim.api.nvim_create_autocmd('User', {
        once = true,
        pattern = 'AlphaReady',
        callback = function()
          require('lazy').show()
        end,
      })
    end

    require('alpha').setup(dashboard.opts)

    vim.api.nvim_create_autocmd('User', {
      once = true,
      pattern = 'LazyVimStarted',
      callback = function()
        local stats = require('lazy').stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        dashboard.section.footer.val = '⚡ Neovim loaded ' .. stats.loaded .. '/' .. stats.count .. ' plugins in ' .. ms .. 'ms'
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end,
}
