-- Toggle nvim tree focus
local function toggle_nvim_tree_focus()
  local api = require("nvim-tree.api")

  local nvim_tree_open = api.tree.is_visible()
  local nvim_tree_focus = vim.bo.filetype == "NvimTree"

  if not nvim_tree_open then
    api.tree.open()
  elseif not nvim_tree_focus then
    api.tree.focus()
  elseif nvim_tree_open and nvim_tree_focus then
    vim.cmd("wincmd p")
  end
end

-- Toggle nvim tree visiblity
local function toggle_nvim_tree_visibility()
  local api = require("nvim-tree.api")

  if api.tree.is_visible() then
    api.tree.close()
  else
    api.tree.open()
  end
end

-- Set custom keymappings
local function nvim_tree_on_attach(bufnr)
  local api = require "nvim-tree.api"
  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- Default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- Custom mappings
  vim.keymap.set('n', 's', api.node.open.vertical, opts('open file in vertical mode'))
  vim.keymap.set('n', '<Leader>e', toggle_nvim_tree_visibility, { noremap = true, silent = true })
  vim.keymap.set('n', '<Leader>o', toggle_nvim_tree_focus, { noremap = true, silent = true })
  vim.keymap.set('n', 'l', function()
    local node = api.tree.get_node_under_cursor()
    if node then api.node.open.edit() end
  end, opts('open file or expand folder'))
  vim.keymap.set('n', 'h', function()
    local node = api.tree.get_node_under_cursor()
    if node and node.type == 'directory' and node.open then api.node.open.edit() end
  end, opts('collapse folder'))
end

return {
  "nvim-tree/nvim-tree.lua",
  version = "v1.7.1",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      on_attach = nvim_tree_on_attach,
      renderer = {
        highlight_opened_files = "all",
      },
      filters = {
        custom = {
          "^.git$"
        },
      },
    })
  end
}
