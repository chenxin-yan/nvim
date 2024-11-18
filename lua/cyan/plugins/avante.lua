return {
  'yetone/avante.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  version = false, -- set this if you want to always pull the latest change
  opts = {
    -- hints = { enabled = false }
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = 'make',
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    'stevearc/dressing.nvim',
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
  },
}