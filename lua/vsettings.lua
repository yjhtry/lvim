vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
-- vim.opt.relativenumber = true
vim.opt.list = true
-- vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append("eol:↴")

vim.o.foldcolumn = "0" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
