local autocmd = vim.api.nvim_create_autocmd

local g = vim.g
g.maplocalleader = ","
vim.wo.wrap = false


-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
