---@type MappingsTable
local M = {}

-- In order to disable a default keymap, use
M.disabled = {
  n = {
    -- ["<leader>h"] = "",
    ["<C-n>"] = "",
    ["<M-Up>"] = "",
    ["<M-Down>"] = "",
  },
}

M.general = {
  n = {
    -- [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<M-Up>"] = { '<Up>"add"ap<Up>', "swap up", opts = { silent = true } },
    ["<M-Down>"] = { '"add"ap', "swap down", opts = { silent = true } },
    ["<C-a>q"] = { "<cmd> qa <CR>", "exit", opts = { silent = true } },
    -- cycle through buffers
    ["<C-a>k"] = {
      function()
        -- require("nvchad.tabufline").tabuflineNext()
        vim.cmd.bnext()
      end,
      "Goto next buffer",
    },

    ["<C-a>j"] = {
      function()
        -- require("nvchad.tabufline").tabuflinePrev()
        vim.cmd.bprev()
      end,
      "Goto prev buffer",
    },

    -- close buffer + hide terminal buffer
    ["<C-a>x"] = {
      function()
        -- require("nvchad.tabufline").close_buffer()
        vim.cmd.bdelete()
      end,
      "Close buffer",
    },
  },
  v = {
    [">"] = { ">gv", "indent" },
    ["y"] = { "ygv<ESC>", "yank and go to the end" },
    ["<C-a>("] = { "c()<ESC>P", "embrace w/ parentheses" },
    ["<C-a>["] = { "c[]<ESC>P", "embrace w/ sqr brackets" },
    ["<C-a>{"] = { "c{}<ESC>P", "embrace w/ curly brackets" },
    ["<C-a>'"] = { "c''<ESC>P", "embrace w/ single quotes" },
    ["<C-a>\""] = { "c\"\"<ESC>P", "embrace w/ double quotes" },
  },
  i = {
    ["<C-s>"] = { "<cmd> w <CR>", "Save file" },
    ["jj"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
  },
}

-- harpoon stuff
M.harpoon = {
  n = {

    ["<C-a>h"] = {
      '<cmd> lua require("harpoon.ui").toggle_quick_menu() <CR>',
      "harpoon menu",
      opts = { nowait = true, silent = true },
    },
    ["<C-a>a"] = {
      '<cmd> lua require("harpoon.mark").add_file()  <CR>',
      "harpoon add",
      opts = { nowait = true, silent = true },
    },
    ["<C-a>r"] = {
      '<cmd> lua require("harpoon.mark").rm_file()  <CR>',
      "harpoon rm",
      opts = { nowait = true, silent = true },
    },
  },
}

M.comment = {
  plugin = true,
  -- toggle comment in both modes
  n = {
    ["<C-a>c"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "Toggle comment",
    },
  },

  v = {
    ["<C-a>c"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "Toggle comment",
    },
  },
}

-- M.tabufline = {
--   plugin = true,
--
--   n = {
--     -- cycle through buffers
--     ["<C-a>k"] = {
--       function()
--         -- require("nvchad.tabufline").tabuflineNext()
--         vim.cmd.bnext()
--       end,
--       "Goto next buffer",
--     },
--
--     ["<C-a>j"] = {
--       function()
--         -- require("nvchad.tabufline").tabuflinePrev()
--         vim.cmd.bprev()
--       end,
--       "Goto prev buffer",
--     },
--
--     -- close buffer + hide terminal buffer
--     ["<C-a>x"] = {
--       function()
--         -- require("nvchad.tabufline").close_buffer()
--         vim.cmd.bdelete()
--       end,
--       "Close buffer",
--     },
--   },
-- }

M.nvimtree = {
  plugin = true,

  n = {
    -- toggle
    ["<C-a>e"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },

    -- focus
    ["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "Focus nvimtree" },
  },
}

M.nvterm = {
  plugin = true,

  t = {
    -- toggle in terminal mode
    ["<C-a>t"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle horizontal term",
    },
  },

  n = {
    -- toggle in normal mode
    ["<C-a>t"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle horizontal term",
    },
  },
}
return M
