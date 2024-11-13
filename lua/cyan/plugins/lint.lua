return {
  { -- Linting
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    keys = {
      {
        '<leader>L',
        function()
          require('lint').try_lint()
        end,
        desc = '[L]int file',
      },
    },
    config = function()
      local lint = require 'lint'
      lint.linters_by_ft = {
        markdown = { 'markdownlint-cli2' },
      }

      -- Create autocommand which carries out the actual linting
      -- on the specified events.
      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = lint_augroup,
        callback = function()
          if vim.opt_local.modifiable:get() then
            lint.try_lint()
          end
        end,
      })

      -- == config markdownlint ==
      -- WARN: change to the path to markdownlint config file
      local markdownlintrc = vim.fn.expand '~' .. '/.markdownlint.jsonc'
      local markdownlint = require('lint').linters['markdownlint-cli2']
      markdownlint.args = {
        '--config',
        markdownlintrc,
      }

      -- == config sqlfluff ==
      local sql_ft = { 'sql', 'mysql', 'plsql' }
      for _, ft in ipairs(sql_ft) do
        lint.linters_by_ft[ft] = lint.linters_by_ft[ft] or {}
        table.insert(lint.linters_by_ft[ft], 'sqlfluff')
      end
    end,
  },
}
