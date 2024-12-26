return {
  'JavaHello/spring-boot.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'mfussenegger/nvim-jdtls', -- or nvim-java, nvim-lspconfig
    -- 'ibhagwan/fzf-lua',
  },
  init = function()
    vim.g.spring_boot = {
      jdt_extensions_path = nil,
      jdt_extensions_jars = {
        'io.projectreactor.reactor-core.jar',
        'org.reactivestreams.reactive-streams.jar',
        'jdt-ls-commons.jar',
        'jdt-ls-extension.jar',
        'sts-gradle-tooling.jar',
      },
    }
  end,
  config = function()
    require('spring_boot').setup {
      ls_path = nil,
      jdtls_name = 'jdtls',
      log_file = nil,
      java_cmd = nil,
    }
  end,
}
