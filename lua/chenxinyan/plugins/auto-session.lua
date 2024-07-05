return {
  'rmagatti/auto-session',
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    require('auto-session').setup {
      auto_session_create_enabled = false,

      -- auto session telescope integration settings
      session_lens = {
        load_on_setup = true,
        theme_conf = { border = true },
        previewer = false,
        buftypes_to_ignore = {},
      },

      -- auto session keybindings
      vim.keymap.set('n', '<leader>sw', require('auto-session.session-lens').search_session, { desc = '[S]earch [W]orkspace' }),
      vim.keymap.set('n', '<leader>wS', ':SessionSave<CR>', { desc = '[W]orkspace [S]ave' }),
    }
  end,
}
