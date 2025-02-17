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
        left = '<',
        right = '>',
        down = '<M-n>',
        up = '<M-p>',

        line_left = '<',
        line_right = '>',
        line_down = '<M-n>',
        line_up = '<M-p>',
      },
    }

    -- autopair
    require('mini.pairs').setup {}

    local pairs = require 'mini.pairs'
    local opts = {

      modes = { insert = true, command = true, terminal = false },
      -- skip autopair when next character is one of these
      skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
      -- skip autopair when the cursor is inside these treesitter nodes
      skip_ts = { 'string' },
      -- skip autopair when next character is closing pair
      -- and there are more closing pairs than opening pairs
      skip_unbalanced = true,
      -- better deal with markdown code blocks
      markdown = true,
    }
    pairs.setup(opts)
    local open = pairs.open
    ---@diagnostic disable-next-line: duplicate-set-field
    pairs.open = function(pair, neigh_pattern)
      if vim.fn.getcmdline() ~= '' then
        return open(pair, neigh_pattern)
      end
      local o, c = pair:sub(1, 1), pair:sub(2, 2)
      local line = vim.api.nvim_get_current_line()
      local cursor = vim.api.nvim_win_get_cursor(0)
      local next = line:sub(cursor[2] + 1, cursor[2] + 1)
      local before = line:sub(1, cursor[2])
      if opts.markdown and o == '`' and vim.bo.filetype == 'markdown' and before:match '^%s*``' then
        return '`\n```' .. vim.api.nvim_replace_termcodes('<up>', true, true, true)
      end
      if opts.skip_next and next ~= '' and next:match(opts.skip_next) then
        return o
      end
      if opts.skip_ts and #opts.skip_ts > 0 then
        local ok, captures = pcall(vim.treesitter.get_captures_at_pos, 0, cursor[1] - 1, math.max(cursor[2] - 1, 0))
        for _, capture in ipairs(ok and captures or {}) do
          if vim.tbl_contains(opts.skip_ts, capture.capture) then
            return o
          end
        end
      end
      if opts.skip_unbalanced and next == c and c ~= o then
        local _, count_open = line:gsub(vim.pesc(pair:sub(1, 1)), '')
        local _, count_close = line:gsub(vim.pesc(pair:sub(2, 2)), '')
        if count_close > count_open then
          return o
        end
      end
      return open(pair, neigh_pattern)
    end
  end,
}
