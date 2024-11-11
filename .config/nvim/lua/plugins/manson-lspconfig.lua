-- Function to show diagnostics on the current line if available
local function show_line_diagnostics()
  -- Get diagnostics for the current line
  local diagnostics = vim.diagnostic.get(0, { lnum = vim.api.nvim_win_get_cursor(0)[1] - 1 })

  if #diagnostics == 0 then
    print("No diagnostics on this line.")
  else
    vim.diagnostic.open_float(nil, { focusable = false, scope = "line" })
  end
end

local function lsp_on_attach()
  -- Key mapping to trigger diagnostics (change <leader>d to your preferred key)
  vim.keymap.set('n', '<leader>d', show_line_diagnostics,
    { noremap = true, silent = true, desc = "Show line diagnostics" })
end

return {
  "williamboman/mason-lspconfig.nvim",
  version = 'v1.31.0',
  dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "pyright", "gopls" }
    })

    require("mason-lspconfig").setup_handlers({
      function(server)
        require("lspconfig")[server].setup({
          on_attach = lsp_on_attach,
        })
      end,
    })
  end,
}
