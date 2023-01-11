-- -- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
lvim.plugins = {
	{
		"catppuccin/nvim",
		name = "catppuccin",
	},
	{
		"folke/persistence.nvim",
		event = "BufReadPre", -- this will only start session saving when an actual file was opened
		config = function()
			require("persistence").setup({
				dir = vim.fn.expand(vim.fn.stdpath("config") .. "/session/"),
				options = { "buffers", "curdir", "tabpages", "winsize" },
			})
		end,
	},
	{
		"karb94/neoscroll.nvim",
		event = "WinScrolled",
		config = function()
			require("neoscroll").setup({
				-- All these keys will be mapped to their corresponding default scrolling animation
				mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
				hide_cursor = true, -- Hide cursor while scrolling
				stop_eof = true, -- Stop at <EOF> when scrolling downwards
				use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
				respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
				cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
				easing_function = nil, -- Default easing function
				pre_hook = nil, -- Function to run before the scrolling animation starts
				post_hook = nil, -- Function to run after the scrolling animation ends
			})
		end,
	},
	{
		"tpope/vim-surround",
	},
	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && npm install",
		ft = "markdown",
		config = function()
			vim.g.mkdp_auto_start = 1
		end,
	},
	{
		"simrat39/symbols-outline.nvim",
		config = function()
			require("symbols-outline").setup()
		end,
	},
	{
		"rmagatti/goto-preview",
		config = function()
			require("goto-preview").setup({
				width = 120, -- Width of the floating window
				height = 25, -- Height of the floating window
				default_mappings = true, -- Bind default mappings
				debug = false, -- Print debug information
				opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
				post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
				-- You can use "default_mappings = true" setup option
				-- Or explicitly set keybindings
				-- vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>")
				-- vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
				-- vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")
			})
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({ "css", "scss", "less", "html", "javascript" }, {
				RGB = true, -- #RGB hex codes
				RRGGBB = true, -- #RRGGBB hex codes
				RRGGBBAA = true, -- #RRGGBBAA hex codes
				rgb_fn = true, -- CSS rgb() and rgba() functions
				hsl_fn = true, -- CSS hsl() and hsla() functions
				css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
				css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
			})
		end,
	},
	{ "kkharji/sqlite.lua" },
	{
		"nvim-telescope/telescope-frecency.nvim",
		-- after = "telescope-fzf-native.nvim",
		config = function()
			require("telescope").load_extension("frecency")
		end,
		dependencies = { { "kkharji/sqlite.lua" } },
	},
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup({
				filetypes = {
					"html",
					"xml",
					"javascript",
					"typescriptreact",
					"javascriptreact",
					"vue",
				},
			})
		end,
	},
	{
		"kevinhwang91/nvim-bqf",
		event = { "BufRead", "BufNew" },
		config = function()
			require("bqf").setup({
				auto_enable = true,
				preview = {
					win_height = 12,
					win_vheight = 12,
					delay_syntax = 80,
					border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
				},
				func_map = {
					vsplit = "",
					ptogglemode = "z,",
					stoggleup = "",
				},
				filter = {
					fzf = {
						action_for = { ["ctrl-s"] = "split" },
						extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
					},
				},
			})
		end,
	},
	{
		"romainl/vim-cool",
		lazy = true,
		event = { "CursorMoved", "InsertEnter" },
	},
	{
		"max397574/better-escape.nvim",
		lazy = true,
		event = "BufReadPost",
		config = function()
			require("better_escape").setup({
				mapping = { "jk", "jj" }, -- a table with mappings to use
				timeout = 500, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
				clear_empty_lines = false, -- clear line after escaping if there is only whitespace
				keys = "<Esc>", -- keys used for escaping, if it is a function will use the result everytime
				-- example(recommended)
				-- keys = function()
				--   return vim.api.nvim_win_get_cursor(0)[2] > 1 and '<esc>l' or '<esc>'
				-- end,
			})
		end,
	},
	{
		"abecodes/tabout.nvim",
		lazy = true,
		event = "InsertEnter",
		-- wants = "nvim-treesitter",
		-- after = "nvim-cmp",
		config = function()
			require("tabout").setup({
				tabkey = "<Tab>",
				backwards_tabkey = "<S-Tab>",
				ignore_beginning = false,
				act_as_tab = true,
				enable_backward = true,
				completion = true,
				tabouts = {
					{ open = "'", close = "'" },
					{ open = '"', close = '"' },
					{ open = "`", close = "`" },
					{ open = "(", close = ")" },
					{ open = "[", close = "]" },
					{ open = "{", close = "}" },
				},
				exclude = {},
			})
		end,
	},
	{
		"sindrets/diffview.nvim",
		lazy = true,
		cmd = { "DiffviewOpen", "DiffviewClose" },
	},
	{ "nvim-treesitter/nvim-treesitter-textobjects" },
	{
		"folke/trouble.nvim",
		cmd = "TroubleToggle",
	},
	{
		"ggandor/leap.nvim",
		event = "BufRead",
		config = function()
			require("leap").add_default_mappings()
		end,
	},
	{
		"ggandor/flit.nvim",
		event = "BufRead",
		config = function()
			require("flit").setup({
				keys = { f = "f", F = "F", t = "t", T = "T" },
				-- A string like "nv", "nvo", "o", etc.
				labeled_modes = "v",
				multiline = true,
				-- Like `leap`s similar argument (call-specific overrides).
				-- E.g.: opts = { equivalence_classes = {} }
				opts = {},
			})
		end,
	},
	{ "tpope/vim-repeat" },
	{ "debugloop/telescope-undo.nvim" },
	{
		"simrat39/rust-tools.nvim",
		config = function()
			require("rust-tools").setup({
				server = {
					settings = {
						["rust-analyzer"] = {
							inlayHints = { locationLinks = false },
						},
					},
				},
			})
		end,
	},
	{ "mattn/emmet-vim" },
	{
		"kevinhwang91/nvim-ufo",
		dependencies = "kevinhwang91/promise-async",
		config = function()
			require("ufo").setup({
				provider_selector = function(bufnr, filetype, buftype)
					return { "treesitter", "indent" }
				end,
			})
		end,
	},
	{ "eandrju/cellular-automaton.nvim" },
	{
		"smjonas/inc-rename.nvim",
		config = function()
			require("inc_rename").setup()
		end,
	},
	{
		"gelguy/wilder.nvim",
		event = "CmdlineEnter",
		dependencies = { { "romgrk/fzy-lua-native", after = "wilder.nvim" } },
		config = function()
			local wilder = require("wilder")
			local icons = { ui = require("icon").get("ui") }

			wilder.setup({ modes = { ":", "/", "?" } })
			wilder.set_option("use_python_remote_plugin", 0)
			wilder.set_option("pipeline", {
				wilder.branch(
					wilder.cmdline_pipeline({ use_python = 0, fuzzy = 1, fuzzy_filter = wilder.lua_fzy_filter() }),
					wilder.vim_search_pipeline(),
					{
						wilder.check(function(_, x)
							return x == ""
						end),
						wilder.history(),
						wilder.result({
							draw = {
								function(_, x)
									return icons.ui.Calendar .. " " .. x
								end,
							},
						}),
					}
				),
			})

			local match_hl = require("utils").hl_to_rgb("String", false, "#ABE9B3")

			local popupmenu_renderer = wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
				border = "rounded",
				highlights = {
					border = "Title", -- highlight to use for the border
					accent = wilder.make_hl(
						"WilderAccent",
						"Pmenu",
						{ { a = 0 }, { a = 0 }, { foreground = match_hl } }
					),
				},
				empty_message = wilder.popupmenu_empty_message_with_spinner(),
				highlighter = wilder.lua_fzy_highlighter(),
				left = {
					" ",
					wilder.popupmenu_devicons(),
					wilder.popupmenu_buffer_flags({
						flags = " a + ",
						icons = { ["+"] = icons.ui.Pencil, a = icons.ui.Indicator, h = icons.ui.File },
					}),
				},
				right = {
					" ",
					wilder.popupmenu_scrollbar(),
				},
			}))
			local wildmenu_renderer = wilder.wildmenu_renderer({
				highlighter = wilder.lua_fzy_highlighter(),
				apply_incsearch_fix = true,
			})
			wilder.set_option(
				"renderer",
				wilder.renderer_mux({
					[":"] = popupmenu_renderer,
					["/"] = wildmenu_renderer,
					substitute = wildmenu_renderer,
				})
			)
		end,
	},
	{
		"michaelb/sniprun",
		build = "bash ./install.sh",
		-- cmd = { "SnipRun", "'<,'>SnipRun" },
		cmd = { "SnipRun", "SnipLive" },
		lazy = true,
		config = function()
			require("sniprun").setup({
				selected_interpreters = {}, -- " use those instead of the default for the current filetype
				repl_enable = {}, -- " enable REPL-like behavior for the given interpreters
				repl_disable = {}, -- " disable REPL-like behavior for the given interpreters
				interpreter_options = {}, -- " intepreter-specific options, consult docs / :SnipInfo <name>
				-- " you can combo different display modes as desired
				display = {
					"Classic", -- "display results in the command-line  area
					"VirtualTextOk", -- "display ok results as virtual text (multiline is shortened)
					"VirtualTextErr", -- "display error results as virtual text
					-- "TempFloatingWindow",      -- "display results in a floating window
					"LongTempFloatingWindow", -- "same as above, but only long results. To use with VirtualText__
					-- "Terminal"                 -- "display results in a vertical split
				},
				-- " miscellaneous compatibility/adjustement settings
				inline_messages = 0, -- " inline_message (0/1) is a one-line way to display messages
				-- " to workaround sniprun not being able to display anything

				borders = "shadow", -- " display borders around floating windows
				-- " possible values are 'none', 'single', 'double', or 'shadow'
			})
		end,
	},
}
