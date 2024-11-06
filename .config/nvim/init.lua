require("config.lazy")

-- Set leader key to space
vim.g.mapleader = " "  -- Sets <Space> as the leader key

-- Set tab settings
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Set linenumbers
vim.o.number = true
-- vim.o.relativenumber = true

-- Set color scheme
vim.cmd.colorscheme('onenord')

