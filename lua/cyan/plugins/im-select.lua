return {
  'keaising/im-select.nvim',
  -- WARN: need to install im-select with your prefered package manager
  event = 'VeryLazy',
  config = function()
    require('im_select').setup {
      default_im_select = 'com.apple.keylayout.US',
      default_command = 'im-select',
      set_default_events = { 'VimEnter', 'FocusGained', 'InsertLeave', 'CmdlineLeave' },
      set_previous_events = { 'InsertEnter' },

      -- Show notification about how to install executable binary when binary missed
      keep_quiet_on_no_binary = false,

      -- Async run `default_command` to switch IM or not
      async_switch_im = true,
    }
  end,
}
