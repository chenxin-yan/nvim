return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = true,
  event = {
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    'BufReadPre '
      .. vim.fn.expand '~'
      .. '/Documents/Ideaverse/**.md',
    'BufNewFile ' .. vim.fn.expand '~' .. '/Documents/Ideaverse/**.md',
  },
  dependencies = {
    -- Required.
    'nvim-lua/plenary.nvim',

    -- see below for full list of optional dependencies 👇
  },
  config = function()
    require('obsidian').setup {
      workspaces = {
        {
          name = 'Ideaverse',
          path = vim.fn.expand '~' .. '/Documents/Ideaverse',
        },
      },
      templates = {
        folder = 'Miscs/Templates',
        date_format = '%Y-%m-%d',
        time_format = '%H:%M',
      },
      disable_frontmatter = true,
    }
    local function obMap(key, cmd, desc)
      vim.keymap.set({ 'n', 'v' }, '<leader>o' .. key, cmd, { desc = 'Obsidian: ' .. desc })
    end
    obMap('t', '<cmd>ObsidianTemplate<CR>', 'Insert [T]emplate')
    obMap('b', '<cmd>ObsidianBacklinks<CR>', 'Search [B]acklinks')
    obMap('f', '<cmd>ObsidianFollowLink vsplit<CR>', '[F]ollow note to a new window')
  end,
}
