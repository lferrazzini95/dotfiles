return {
  "jay-babu/mason-nvim-dap.nvim", -- jay-babu/mason-nvim-dap.nvim",
  version = 'v2.4.0',
  dependencies = { "williamboman/mason.nvim" },
  config = function()
    require("mason").setup({})
    require("mason-nvim-dap").setup({
      ensure_installed = { "debugpy" },
      automatic_installation = true,
    })
  end
}
