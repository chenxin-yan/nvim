return { -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = { 'nvim-treesitter/nvim-treesitter-context', 'nvim-treesitter/nvim-treesitter-textobjects' },
  opts = {
    ensure_installed = {
      'bash',
      'regex',
      'c',
      'diff',
      'lua',
      'luadoc',
      'markdown',
      'markdown_inline',
      'query',
      'vim',
      'vimdoc',
      'javascript',
      'typescript',
      'html',
      'css',
      'json5',
      'java',
    },
    -- Autoinstall languages that are not installed
    auto_install = true,
    highlight = {
      enable = true,
      -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
      --  If you are experiencing weird indenting issues, add the language to
      --  the list of additional_vim_regex_highlighting and disabled languages for indent.
      additional_vim_regex_highlighting = { 'ruby' },
    },
    indent = { enable = true, disable = { 'ruby' } },
    -- incremental_selection = {
    --   enable = true,
    --   keymaps = {
    --     init_selection = '<leader>i',
    --     node_incremental = '<C-i>',
    --     scope_incremental = '<C-o>',
    --     node_decremental = '<C-n>',
    --   },
    -- },
    textobjects = {
      swap = {
        enable = true,
        swap_next = {
          ['<leader>csn'] = { query = '@parameter.inner', desc = 'Swap [N]ext argument' },
          ['<leader>csN'] = { query = '@function.outer', desc = 'Swap [N]ext function' },
        },
        swap_previous = {
          ['<leader>csp'] = { query = '@parameter.inner', desc = 'Swap [P]revious argument' },
          ['<leader>csP'] = { query = '@function.outer', desc = 'Swap [P]revious function' },
        },
      },
      move = {
        enable = true,
        goto_next_start = {
          [']f'] = { query = '@function.outer', desc = 'Next function/method start' },
          [']a'] = { query = '@parameter.outer', desc = 'Next argument' },
        },
        goto_next_end = {
          [']F'] = { query = '@function.outer', desc = 'Next function/method end' },
        },
        goto_previous_start = {
          ['[f'] = { query = '@function.outer', desc = 'Previous function/method start' },
          ['[a'] = { query = '@parameter.outer', desc = 'Previous argument' },
        },
        goto_previous_end = {
          ['[F'] = { query = '@function.outer', desc = 'Previous function/method end' },
        },
        goto_next = {
          [']o'] = { query = { '@conditional.outer', '@loop.outer' }, desc = 'Next code block' },
        },
        goto_previous = {
          ['[o'] = { query = { '@conditional.outer', '@loop.outer' }, desc = 'Previous code block' },
        },
      },
    },
  },
  config = function(_, opts)
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

    ---@diagnostic disable-next-line: missing-fields
    require('nvim-treesitter.configs').setup(opts)

    -- show context of current cursor using parser
    local tsc = require 'treesitter-context'
    tsc.setup {
      mode = 'cursor',
      multiline_threshold = 1,
      max_lines = 3,
    }
    vim.keymap.set('n', '<leader>tc', function()
      tsc.toggle()
    end, { desc = '[T]oggle tressiter [C]ontext' })

    -- treesitter textobjects command repeat with ; and ,
    local ts_repeat_move = require 'nvim-treesitter.textobjects.repeatable_move'

    -- Repeat movement with ; and ,
    -- ensure ; goes forward and , goes backward regardless of the last direction
    vim.keymap.set({ 'n', 'x', 'o' }, ';', ts_repeat_move.repeat_last_move_next)
    vim.keymap.set({ 'n', 'x', 'o' }, ',', ts_repeat_move.repeat_last_move_previous)

    -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
    vim.keymap.set({ 'n', 'x', 'o' }, 'f', ts_repeat_move.builtin_f_expr, { expr = true })
    vim.keymap.set({ 'n', 'x', 'o' }, 'F', ts_repeat_move.builtin_F_expr, { expr = true })
    vim.keymap.set({ 'n', 'x', 'o' }, 't', ts_repeat_move.builtin_t_expr, { expr = true })
    vim.keymap.set({ 'n', 'x', 'o' }, 'T', ts_repeat_move.builtin_T_expr, { expr = true })
  end,
}
