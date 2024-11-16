return { -- Autoformat
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>F',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = 'n',
      desc = '[F]ormat file',
    },
  },
  opts = function()
    local opts = {
      formatters = {
        ['markdownlint-cli2'] = {
          -- WARN: change to the path to markdownlint config file
          args = { '--fix', '$FILENAME', '--config', vim.fn.expand '~' .. '/.markdownlint.jsonc' },
        },
        sqlfluff = {
          args = { 'format', '--dialect=ansi', '-' },
        },
      },
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = false, cpp = false }
        local lsp_format_opt
        if disable_filetypes[vim.bo[bufnr].filetype] then
          lsp_format_opt = 'never'
        else
          lsp_format_opt = 'fallback'
        end
        return {
          timeout_ms = 500,
          lsp_format = lsp_format_opt,
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        javascript = { 'prettier' },
        typescript = { 'prettier' },
        javascriptreact = { 'prettier' },
        typescriptreact = { 'prettier' },
        css = { 'prettier' },
        html = { 'prettier' },
        json = { 'prettier' },
        markdown = { 'prettier', 'markdownlint-cli2' },
        sql = 'sqlfluff',
        mysql = 'sqlfluff',
        plsql = 'sqlfluff',
      },
    }

    return opts
  end,
}
