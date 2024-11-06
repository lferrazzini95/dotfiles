return {
  "williamboman/mason-lspconfig.nvim",
  version = 'v1.31.0',
  dependencies = { "neovim/nvim-lspconfig" },
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "pyright" }
    })

    require("mason-lspconfig").setup_handlers({
      function(server)
        require("lspconfig")[server].setup({})
      end,
    })
  end,
  }
