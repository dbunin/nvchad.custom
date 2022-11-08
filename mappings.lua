local M = {}

M.disabled = {
  n = {
    ["<leader>b"] = "",
  },
}

M.general = {
  n = {
    [";"] = { ":", "command mode", opts = { nowait = true } },

    -- save
    ["<leader>fs"] = { "<cmd> w <CR>", "save file" },

    -- window management
    ["<C-h>"] = { "<C-w>h", "Move to left split" },
    ["<C-j>"] = { "<C-w>j", "Move to below split" },
    ["<C-k>"] = { "<C-w>k", "Move to above split" },
    ["<C-l>"] = { "<C-w>l", "Move to right split" },

    ["<leader>wv"] = { "<C-w>v", "Split pane right" },
    ["<leader>wh"] = { "<C-w>s", "Split pane down" },
    ["<leader>wc"] = { "<C-w>c", "Close current pane" },

    -- buffers
  },
}

M.tabufline = {
  plugin = true,

  n = {
    ["<leader>b["] = {
      function()
        require("nvchad_ui.tabufline").tabuflinePrev()
      end,
      "goto prev buffer",
    },

    ["<leader>b]"] = {
      function()
        require("nvchad_ui.tabufline").tabuflineNext()
      end,
      "goto next buffer",
    },
  }
}

-- more keybinds!

return M
