return {
  'francescarpi/buffon.nvim',
  branch = 'main',
  event = 'VeryLazy',
  ---@type BuffonConfig
  opts = {
    cyclic_navigation = false,
    new_buffer_position = 'start',
    num_pages = 2,
    open = {
      by_default = false,
      ignore_ft = {
        'gitcommit',
        'gitrebase',
      },
    },
    theme = {
      unloaded_buffer = '#9399b2',
      shortcut = '#fab387',
      active = '#89b4fa',
      unsaved_indicator = '#f38ba8',
    },
    leader_key = ';',
    mapping_chars = 'qweryuiop',
    keybindings = {
      goto_next_buffer = '<C-n>',
      goto_previous_buffer = '<C-p>',
      move_buffer_up = '<buffonleader>k',
      move_buffer_down = '<buffonleader>j',
      move_buffer_top = '<buffonleader>t',
      move_buffer_bottom = '<buffonleader>b',
      toggle_buffon_window = '<buffonleader>n',
      --- Toggle window position allows moving the main window position
      --- between top-right and bottom-right positions
      toggle_buffon_window_position = '<buffonleader>nn',
      switch_previous_used_buffer = '<buffonleader><buffonleader>',
      close_buffer = '<buffonleader>d',
      close_buffers_above = '<buffonleader>K',
      close_buffers_below = '<buffonleader>J',
      close_all_buffers = '<buffonleader>da',
      close_others = '<buffonleader>D',
      reopen_recent_closed_buffer = '<buffonleader>t',
      show_help = '<buffonleader>h',
      previous_page = '<buffonleader>z',
      next_page = '<buffonleader>x',
      move_to_previous_page = '<buffonleader>a',
      move_to_next_page = '<buffonleader>s',
    },
  },
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'nvim-lua/plenary.nvim',
  },
}
