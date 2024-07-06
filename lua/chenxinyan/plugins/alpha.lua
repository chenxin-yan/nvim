return {
  'goolord/alpha-nvim',
  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'
    dashboard.section.header.val = {
      '                                                     ',
      '  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ',
      '  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ',
      '  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ',
      '  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ',
      '  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ',
      '  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ',
      '                                                     ',
    }
    dashboard.section.buttons.val = {
      dashboard.button('e', '  > New file', ':ene <BAR> startinsert <CR>'),
      dashboard.button('f', '󰈞  > Find file', ':Telescope find_files<CR>'),
      dashboard.button('r', '󱋡  > Recent file', ':Telescope oldfiles<CR>'),
      dashboard.button('p', '  > My projects', ':Telescope session-lens<CR>'),
      dashboard.button('c', '  > My configs', ':cd ~/.config/nvim<CR>:Telescope find_files<CR>'),
      dashboard.button('u', '󰚰  > Update plugins', ':Lazy update<CR>'),
      dashboard.button('q', '󰈆  > Quit NVIM', ':qa<CR>'),
    }
    -- Send config to alpha
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd [[ autocmd FileType alpha setlocal nofoldenable]]

    -- Toggle dashboard
    vim.keymap.set('n', '<leader>td', ':Alpha<CR>', { desc = '[T]oggle [D]ashboard' })
  end,
}
