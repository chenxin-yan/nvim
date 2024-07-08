return {
  'freddiehaddad/feline.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local ctp_feline = require 'catppuccin.groups.integrations.feline'

    ctp_feline.setup {}

    require('feline').setup {
      components = ctp_feline.get(),
    }
  end,
}
