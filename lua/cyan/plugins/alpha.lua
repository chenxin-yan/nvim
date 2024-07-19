return {
  'goolord/alpha-nvim',
  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'
    dashboard.section.header.val = {
      '                                                            ',
      '  ██████╗██╗   ██╗ █████╗ ███╗   ██╗██╗   ██╗██╗███╗   ███╗ ',
      ' ██╔════╝╚██╗ ██╔╝██╔══██╗████╗  ██║██║   ██║██║████╗ ████║ ',
      ' ██║      ╚████╔╝ ███████║██╔██╗ ██║██║   ██║██║██╔████╔██║ ',
      ' ██║       ╚██╔╝  ██╔══██║██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║ ',
      ' ╚██████╗   ██║   ██║  ██║██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║ ',
      '  ╚═════╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝ ',
    }
    dashboard.section.buttons.val = {
      dashboard.button('e', '  > New file', ':e '),
      dashboard.button('f', '󰈞  > Find file', '<cmd>Telescope find_files<CR>'),
      dashboard.button('g', '󰺮  > Grep text', '<cmd>Telescope live_grep<CR>'),
      dashboard.button('w', '  > Search workspace', '<cmd>Telescope session-lens<CR>'),
      dashboard.button('r', '󰚰  > Restore workspace', '<cmd>SessionRestore<CR>'),
      dashboard.button('c', '  > Configration', '<cmd>cd ~/.config/nvim<CR><cmd>Telescope find_files<CR>'),
      dashboard.button('u', '  > Update plugins', '<cmd>Lazy update<CR>'),
      dashboard.button('q', '󰈆  > Quit NVIM', '<cmd>qa<CR>'),
    }
    -- Send config to alpha
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd [[ autocmd FileType alpha setlocal nofoldenable]]

    -- Toggle dashboard
    vim.keymap.set('n', '<leader>td', '<cmd>Alpha<CR>', { desc = '[T]oggle [D]ashboard' })
  end,
}
