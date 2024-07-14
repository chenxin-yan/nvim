return { -- Collection of various small independent plugins/modules
  'echasnovski/mini.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [']quote
    --  - ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup { n_lines = 500 }

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    require('mini.surround').setup()

    -- inline color highlight for color code
    -- #ffffff
    local hipatterns = require 'mini.hipatterns'
    hipatterns.setup {
      highlighters = { hex_color = hipatterns.gen_highlighter.hex_color() },
    }

    -- split and joint parameters within brackets
    local sj = require 'mini.splitjoin'
    sj.setup()
    vim.keymap.set({ 'n', 'x' }, '<leader>cs', function()
      sj.toggle()
    end, { desc = 'Toggle [C]ode [S]plitjoin' })

    -- move code line/block horizontally or vertically
    require('mini.move').setup {
      mappings = {
        -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
        left = '<M-S-h>',
        right = '<M-S-l>',
        down = '<M-S-j>',
        up = '<M-S-k>',

        -- Move current line in Normal mode
        line_left = '<M-S-h>',
        line_right = '<M-S-l>',
        line_down = '<M-S-j>',
        line_up = '<M-S-k>',
      },
    }

    -- smart buffer deletion
    local bufr = require 'mini.bufremove'
    bufr.setup()
    vim.keymap.set('n', '<leader>bd', function()
      bufr.delete(0, false)
    end, { desc = '[B]uffer [D]elete current' })
  end,
}
