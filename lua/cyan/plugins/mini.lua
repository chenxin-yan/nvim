return { -- Collection of various small independent plugins/modules
  'echasnovski/mini.nvim',
  event = 'VeryLazy',
  config = function()
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [']quote
    --  - ci'  - [C]hange [I]nside [']quote
    local ai = require 'mini.ai'
    ai.setup {
      n_lines = 500,
      custom_textobjects = {
        o = ai.gen_spec.treesitter { -- code block
          a = { '@block.outer', '@conditional.outer', '@loop.outer' },
          i = { '@block.inner', '@conditional.inner', '@loop.inner' },
        },
        f = ai.gen_spec.treesitter { a = '@function.outer', i = '@function.inner' }, -- function
        c = ai.gen_spec.treesitter { a = '@class.outer', i = '@class.inner' }, -- class
        t = { '<([%p%w]-)%f[^<%w][^<>]->.-</%1>', '^<.->().*()</[^/]->$' }, -- tags
        d = { '%f[%d]%d+' }, -- digits
        e = { -- Word with case
          { '%u[%l%d]+%f[^%l%d]', '%f[%S][%l%d]+%f[^%l%d]', '%f[%P][%l%d]+%f[^%l%d]', '^[%l%d]+%f[^%l%d]' },
          '^().*()$',
        },
        u = ai.gen_spec.function_call(), -- u for "Usage"
        U = ai.gen_spec.function_call { name_pattern = '[%w_]' }, -- without dot in function name
        ['='] = ai.gen_spec.treesitter { a = '@assignment.outer', i = '@assignment.inner' }, -- assignment
      },
    }
    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    require('mini.surround').setup {
      mappings = {
        add = 'gsa', -- Add surrounding in Normal and Visual modes
        delete = 'gsd', -- Delete surrounding
        find = 'gsf', -- Find surrounding (to the right)
        find_left = 'gsF', -- Find surrounding (to the left)
        highlight = 'gsh', -- Highlight surrounding
        replace = 'gsr', -- Replace surrounding
        update_n_lines = 'gsn', -- Update `n_lines`
      },
    }

    -- Splitjoin variable using "gS"
    require('mini.splitjoin').setup()

    -- inline color highlight for color code
    -- #ffffff
    -- config copied from lazynvim
    local hipatterns = require 'mini.hipatterns'
    local tailwindcss = require 'cyan.helpers.tailwindCSS'
    vim.api.nvim_create_autocmd('ColorScheme', {
      callback = function()
        tailwindcss.hl = {}
      end,
    })
    hipatterns.setup {
      highlighters = {
        hex_color = hipatterns.gen_highlighter.hex_color { priority = 2000 },
        shorthand = {
          pattern = '()#%x%x%x()%f[^%x%w]',
          group = function(_, _, data)
            ---@type string
            local match = data.full_match
            local r, g, b = match:sub(2, 2), match:sub(3, 3), match:sub(4, 4)
            local hex_color = '#' .. r .. r .. g .. g .. b .. b

            return MiniHipatterns.compute_hex_color_group(hex_color, 'bg')
          end,
          extmark_opts = { priority = 2000 },
        },
        tailwindcss = {
          pattern = '%f[%w:-][%w:-]+%-()[a-z%-]+%-%d+()%f[^%w:-]',
          group = function(_, _, m)
            local match = m.full_match
            local color, shade = match:match '[%w-]+%-([a-z%-]+)%-(%d+)'
            shade = tonumber(shade)
            local bg = vim.tbl_get(tailwindcss.colors, color, shade)
            if bg then
              local hl = 'MiniHipatternsTailwind' .. color .. shade
              if not tailwindcss.hl[hl] then
                tailwindcss.hl[hl] = true
                local bg_shade = shade == 500 and 950 or shade < 500 and 900 or 100
                local fg = vim.tbl_get(tailwindcss.colors, color, bg_shade)
                vim.api.nvim_set_hl(0, hl, { bg = '#' .. bg, fg = '#' .. fg })
              end
              return hl
            end
          end,
          extmark_opts = { priority = 2000 },
        },
      },
    }

    -- move code line/block horizontally or vertically
    require('mini.move').setup {
      mappings = {
        left = '<M-,>',
        right = '<M-.>',
        down = '<M-n>',
        up = '<M-p>',

        line_left = '<M-,>',
        line_right = '<M-.>',
        line_down = '<M-n>',
        line_up = '<M-p>',
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
