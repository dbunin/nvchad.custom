local autocmd = vim.api.nvim_create_autocmd

local g = vim.g
g.maplocalleader = ","
g.ranger_command_override = "ranger --cmd \"set show_hidden=true\""
vim.wo.wrap = false
vim.wo.relativenumber = true

-- folding settings
-- vim.o.foldcolumn = "0" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
-- vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
-- vim.o.foldlevelstart = 99
-- vim.o.foldenable = true



-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
