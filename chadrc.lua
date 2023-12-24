---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "ayu_dark",
  theme_toggle = { "ayu_dark", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,

  tabufline = {
    enabled = false,
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

-- as much as possible, keeps the cursor on the center of the screen
vim.opt.scrolloff = 9999999

-- will start nvim with relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.colorcolumn = "120"

-- nvim-tree-api.tree.toggle_gitignore_filter()

return M
