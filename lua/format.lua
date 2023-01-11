lvim.format_on_save = {
	enabled = true,
	pattern = "*.lua,*.js,*.tsx,*.ts,*.rs,*.json,*.html",
	timeout = 8000,
}

local formatters = require("lvim.lsp.null-ls.formatters")
local linters = require("lvim.lsp.null-ls.linters")

formatters.setup({
	{
		exe = "prettier",
		filetypes = {
			"javascriptreact",
			"javascript",
			"typescriptreact",
			"typescript",
		},
	},
	{
		exe = "rustfmt",
		filetypes = {
			"rust",
		},
	},
	{
		exe = "prettier",
		filetypes = {
			"json",
		},
	},
	{
		exe = "prettier",
		filetypes = {
			"html",
		},
	},
	{
		exe = "stylua",
		filetypes = {
			"lua",
		},
	},
})

linters.setup({
	{
		exe = "eslint",
		filetypes = {
			"javascriptreact",
			"javascript",
			"typescriptreact",
			"typescript",
		},
	},
	{
		exe = "jsonlint",
		filetypes = {
			"json",
		},
	},
})
