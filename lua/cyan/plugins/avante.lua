return {
  'yetone/avante.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  version = false, -- set this if you want to always pull the latest change
  opts = {
    -- hints = { enabled = false }
    mappings = {
      suggestion = {
        accept = '<M-y>',
        next = '<M-]>',
        prev = '<M-[>',
        dismiss = '<C-c>',
      },
    },
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = 'make',
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    'stevearc/dressing.nvim',
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
    {
      -- support for image pasting
      'HakonHarnes/img-clip.nvim',
      event = 'VeryLazy',
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
        },
      },
      keys = {
        { '<leader>P', '<cmd>PasteImage<cr>', desc = 'Paste image from system clipboard' },
      },
    },
  },
}
