return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  build = ':Copilot auth',
  event = 'InsertEnter',
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true,
      keymap = {
        accept = '<tab>',
        next = '<M-]>',
        prev = '<M-[>',
      },
    },
    panel = { enabled = false },
    filetypes = {
      help = true,
    },
  },
}
