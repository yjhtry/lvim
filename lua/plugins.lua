-- -- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
lvim.plugins = {
	-- 主题插件
	{
		"catppuccin/nvim",
		name = "catppuccin",
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
		"rmagatti/goto-preview",
		config = function()
			require("goto-preview").setup({
				width = 120, -- Width of the floating window
				height = 25, -- Height of the floating window
				default_mappings = true, -- Bind default mappings
				debug = false, -- Print debug information
				opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
				post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
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
	-- quickfix window
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
	-- 搜索后结束高亮
	{
		"romainl/vim-cool",
		lazy = true,
		event = { "CursorMoved", "InsertEnter" },
	},
	{ "nvim-treesitter/nvim-treesitter-textobjects" },
	-- {
	-- 	"folke/trouble.nvim",
	-- 	cmd = "TroubleToggle",
	-- },
	-- {
	-- 	"ggandor/leap.nvim",
	-- 	-- event = "BufRead",
	-- 	config = function()
	-- 		require("leap").add_default_mappings()
	-- 	end,
	-- },
	-- {
	-- 	"ggandor/flit.nvim",
	-- 	-- event = "BufRead",
	-- 	config = function()
	-- 		require("flit").setup({
	-- 			keys = { f = "f", F = "F", t = "t", T = "T" },
	-- 			labeled_modes = "v",
	-- 			multiline = true,
	-- 			opts = {},
	-- 		})
	-- 	end,
	-- },
	-- { "tpope/vim-repeat" },
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"s",
				mode = { "n", "o", "x" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"S",
				mode = { "n", "o", "x" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			{
				"r",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote Flash",
			},
			{
				"R",
				mode = { "o", "x" },
				function()
					require("flash").treesitter_search()
				end,
				desc = "Treesitter Search",
			},
			{
				"<c-s>",
				mode = { "c" },
				function()
					require("flash").toggle()
				end,
				desc = "Toggle Flash Search",
			},
		},
	},
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
	-- 自动缩进插件
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
	-- 下雨和生命周期游戏插件
	-- { "eandrju/cellular-automaton.nvim" },
	-- {
	-- 	"smjonas/inc-rename.nvim",
	-- 	config = function()
	-- 		require("inc_rename").setup()
	-- 		vim.keymap.set("n", "<leader>rn", function()
	-- 			return ":IncRename " .. vim.fn.expand("<cword>")
	-- 		end, { expr = true, desc = "Rename" })
	-- 		-- vim.keymap.set("n", "<leader>rn", ":IncRename ", { desc = "Rename" })
	-- 	end,
	-- },
	-- 命令提示和搜索自动分词插件
	{
		"gelguy/wilder.nvim",
		event = "CmdlineEnter",
		dependencies = { { "romgrk/fzy-lua-native" } },
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
	{ "wakatime/vim-wakatime" },
}
