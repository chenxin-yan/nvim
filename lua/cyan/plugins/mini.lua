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
      highlighters = {
        hex_color = hipatterns.gen_highlighter.hex_color(),
      },
    }

    -- split and joint parameters within brackets
    local sj = require 'mini.splitjoin'
    sj.setup()
    vim.keymap.set({ 'n', 'x' }, '<leader>cs', function()
      sj.toggle()
    end, { desc = 'Toggle [C]ode [S]plitjoin' })

    -- move code line/block horizontally or vertically
    require('mini.move').setup()

    -- smart buffer deletion
    local bufr = require 'mini.bufremove'
    bufr.setup()
    vim.keymap.set('n', '<leader>bd', function()
      bufr.delete(0, false)
    end, { desc = '[B]uffer [D]elete current' })

    -- Mini bracketed for easy navigation
    local bracketed = require 'mini.bracketed'
    bracketed.setup {
      comment = { suffix = '', options = {} },
      conflict = { suffix = '', options = {} },
      diagnostic = { suffix = '', options = {} },
      file = { suffix = '', options = {} },
      jump = { suffix = '', options = {} },
      location = { suffix = '', options = {} },
      treesitter = { suffix = '', options = {} },
      undo = { suffix = '', options = {} },
      window = { suffix = '', options = {} },
      oldfile = { suffix = 'r', options = {} },
    }

    -- Simple and easy statusline.
    --  You could remove this setup call if you don't like it,
    --  and try some other statusline plugin
    -- local statusline = require 'mini.statusline'
    -- set use_icons to true if you have a Nerd Font
    -- statusline.setup { use_icons = vim.g.have_nerd_font }

    -- You can configure sections in the statusline by overriding their
    -- default behavior. For example, here we set the section for
    -- cursor location to LINE:COLUMN
    ---@diagnostic disable-next-line: duplicate-set-field
    -- statusline.section_location = function()
    --   return '%2l:%-2v'
    -- end

    -- ... and there is more!
    --  Check out: https://github.com/echasnovski/mini.nvim
  end,
}
