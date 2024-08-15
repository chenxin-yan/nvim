-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim
return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  event = { 'VimEnter */*,.*', 'BufNew */*,.*' },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',

    -- show diagnostics in neotree
    'mrbjarksen/neo-tree-diagnostics.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', '<cmd>Neotree reveal<cr>', desc = 'NeoTree reveal' },
  },
  opts = {
    sources = {
      'filesystem',
    },
    close_if_last_window = true,
    filesystem = {
      hijack_netrw_behavior = 'open_current',
      never_show = {
        '.DS_Store',
      },
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    },
    event_handlers = {
      -- adjust statusbar when neo-tree is opened
      {
        event = 'neo_tree_buffer_enter',
        handler = function()
          vim.o.showmode = false
          vim.o.ruler = false
          vim.o.laststatus = 0
          vim.o.showcmd = false
        end,
      },
      {
        event = 'neo_tree_buffer_leave',
        handler = function()
          vim.o.showmode = true
          vim.o.ruler = true
          vim.o.laststatus = 2
          vim.o.showcmd = true
        end,
      },
    },
  },
}
