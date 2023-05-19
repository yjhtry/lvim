lvim.format_on_save = {
	enabled = true,
	pattern = "*.lua,*.js,*jsx,*.tsx,*.ts,*.rs,*.json,*.html,*.cc,*.py",
	timeout = 2000,
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
			"json",
			"html",
		},
	},
	{
		exe = "rustfmt",
		filetypes = {
			"rust",
		},
	},
	{
		exe = "stylua",
		filetypes = {
			"lua",
		},
	},
	{
		exe = "isort",
		filetypes = {
			"python",
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
