local ts = lvim.builtin.treesitter
local telescope = lvim.builtin.telescope

ts.autotag = { enable = true }

ts.textobjects = {
	select = {
		enable = true,
		-- Automatically jump forward to textobj, similar to targets.vim
		lookahead = true,
		keymaps = {
			-- You can use the capture groups defined in textobjects.scm
			["aa"] = "@parameter.outer",
			["ia"] = "@parameter.inner",
			["af"] = "@function.outer",
			["if"] = "@function.inner",
			["ac"] = "@class.outer",
			["ic"] = "@class.inner",
		},
	},
	move = {
		enable = true,
		set_jumps = true, -- whether to set jumps in the jumplist
		goto_next_start = {
			["]]"] = "@function.outer",
			["]m"] = "@class.outer",
		},
		goto_next_end = {
			["]["] = "@function.outer",
			["]M"] = "@class.outer",
		},
		goto_previous_start = {
			["[["] = "@function.outer",
			["[m"] = "@class.outer",
		},
		goto_previous_end = {
			["[]"] = "@function.outer",
			["[M"] = "@class.outer",
		},
	},
	swap = {
		enable = true,
		swap_next = {
			["<leader>a"] = "@parameter.inner",
		},
		swap_previous = {
			["<leader>A"] = "@parameter.inner",
		},
	},
}

telescope.defaults.layout_strategy = "horizontal"
telescope.extensions.undo = {
	side_by_side = true,
	layout_config = {
		preview_height = 0.8,
	},
}

telescope.defaults.layout_config = {
	horizontal = {
		prompt_position = "top",
		preview_width = 0.55,
		results_width = 0.8,
	},
	vertical = {
		mirror = false,
	},
	width = 0.87,
	height = 0.80,
	preview_cutoff = 120,
}

local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			runtime = {
				version = "Lua 5.4", -- Settings go here!
			},
			completion = {
				keywordSnippet = "Replace",
				callSnippet = "Replace",
			},
		},
	},
})

lspconfig.denols.setup({
	root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
})

-- lspconfig.tsserver.setup({
-- 	root_dir = lspconfig.util.root_pattern("package.json"),
-- 	single_file_support = true,
-- })
