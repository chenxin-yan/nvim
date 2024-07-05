return { -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = { 'nvim-treesitter/nvim-treesitter-context', 'nvim-treesitter/nvim-treesitter-textobjects' },
  opts = {
    ensure_installed = { 'bash', 'c', 'diff', 'html', 'css', 'lua', 'luadoc', 'markdown', 'vim', 'vimdoc', 'javascript', 'typescript' },
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
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<leader>cs',
        node_incremental = '<C-i>',
        scope_incremental = '<C-o>',
        node_decremental = '<C-d>',
      },
    },
    textobjects = {
      select = {
        enable = true,

        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,
        keymaps = {
          -- Assignments
          ['a='] = { query = '@assignment.outer', desc = 'Around assignment' },
          ['i='] = { query = '@assignment.inner', desc = 'Inside assignment' },
          ['l='] = { query = '@assignment.lhs', desc = 'LHS of assignment' },
          ['r='] = { query = '@assignment.rhs', desc = 'RHS of assignment' },

          -- Function
          ['am'] = { query = '@function.outer', desc = 'Around function/method' },
          ['im'] = { query = '@function.inner', desc = 'Inside function/method' },

          -- Function call
          ['af'] = { query = '@call.outer', desc = 'Around function call' },
          ['if'] = { query = '@call.inner', desc = 'Inside function call' },

          -- Class
          ['ac'] = { query = '@class.outer', desc = 'Around class' },
          ['ic'] = { query = '@class.inner', desc = 'Inside class' },

          -- Conditional
          ['ai'] = { query = '@conditional.outer', desc = 'Around conditional' },
          ['ii'] = { query = '@conditional.inner', desc = 'Inside conditional' },

          -- Loop
          ['al'] = { query = '@loop.outer', desc = 'Around loop' },
          ['il'] = { query = '@loop.inner', desc = 'Inside loop' },

          -- Parameter/argument
          ['aa'] = { query = '@parameter.outer', desc = 'Around parameter/argument' },
          ['ia'] = { query = '@parameter.inner', desc = 'Inside parameter/argument' },
        },

        selection_modes = {
          ['@parameter.outer'] = 'v', -- charwise
          ['@function.outer'] = 'V', -- linewise
          ['@class.outer'] = '<c-v>', -- blockwise
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ['<leader>na'] = { query = '@parameter.inner', desc = 'Swap [N]ext argument' },
          ['<leader>nm'] = { query = '@function.outer', desc = 'Swap [N]ext function' },
        },
        swap_previous = {
          ['<leader>pa'] = { query = '@parameter.inner', desc = 'Swap [P]revious argument' },
          ['<leader>pm'] = { query = '@function.outer', desc = 'Swap [P]revious function' },
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          [']m'] = { query = '@function.outer', desc = 'Next function/method start' },
          [']c'] = { query = '@class.outer', desc = 'Next class start' },
        },
        goto_next_end = {
          [']M'] = { query = '@function.outer', desc = 'Next function/method end' },
          [']C'] = { query = '@class.outer', desc = 'Next class start' },
        },
        goto_previous_start = {
          ['[m'] = { query = '@function.outer', desc = 'Previous function/method start' },
          ['[c'] = { query = '@class.outer', desc = 'Previous class start' },
        },
        goto_previous_end = {
          ['[M'] = { query = '@function.outer', desc = 'Previous function/method end' },
          ['[C'] = { query = '@class.outer', desc = 'Previous class end' },
        },
      },
    },
  },
  config = function(_, opts)
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

    -- Prefer git instead of curl in order to improve connectivity in some environments
    require('nvim-treesitter.install').prefer_git = true
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
    end, { desc = '[t]oggle tressiter [c]ontext' })

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
