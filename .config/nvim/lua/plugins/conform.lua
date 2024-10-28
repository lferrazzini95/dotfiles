return {
  'stevearc/conform.nvim',
  version = 'v8.1.0',
  config = function()
    require("conform").setup({
      format_on_save = {
        timeout_ms = 500,
	lsp_format = "fallback",
      },
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        helm = { "prettier_yaml" },
        yaml = { "prettier_yaml" }
      },
      formatters = {
        prettier_yaml = {
          command = "prettier",
          args = {
            "--no-bracket-spacing"
          }
        }
      }
    })
  end
}
