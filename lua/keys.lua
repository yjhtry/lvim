-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "openAllFolds" })
vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "closeAllFolds" })

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<C-c>"] = "ESC"
lvim.keys.normal_mode["[<space>"] = "o<ESC>"
lvim.keys.normal_mode["]<space>"] = "O<ESC>"
lvim.keys.normal_mode["J"] = "5j"
lvim.keys.normal_mode["K"] = "5k"
lvim.keys.normal_mode["<A-J>"] = ":copy .<CR>=="
lvim.keys.normal_mode["<A-K>"] = ":copy .-1<CR>=="

lvim.keys.visual_mode["J"] = "5j"
lvim.keys.visual_mode["K"] = "5k"
lvim.keys.visual_mode["<A-J>"] = ":copy '><CR>=="
lvim.keys.visual_mode["<A-K>"] = ":copy '<-1<CR>=="

lvim.keys.insert_mode["<A-J>"] = "<Esc>:copy .<CR>==gi"
lvim.keys.insert_mode["<A-K>"] = "<Esc>:copy .-1<CR>==gi"

lvim.lsp.buffer_mappings.normal_mode["K"] = nil

lvim.builtin.which_key.mappings["D"] = { "<cmd>DiffviewOpen<cr>", "DiffviewOpen" }
lvim.builtin.which_key.mappings["ss"] = { "<cmd>Telescope<cr>", "Telescope" }
lvim.builtin.which_key.mappings["sb"] = { "<cmd>Telescope buffers<cr>", "Buffers" }
lvim.builtin.which_key.mappings["sw"] = { "<cmd>Telescope live_grep<cr>", "live Word" }
lvim.builtin.which_key.mappings["sc"] = { "<cmd>Telescope grep_string<cr>", "Cursor Word" }
lvim.builtin.which_key.mappings["n"] = { "<cmd>enew<cr>", "New File" }
lvim.builtin.which_key.mappings["o"] = { "<cmd>SymbolsOutline<cr>", "SymbolsOutline" }

lvim.builtin.which_key.mappings["u"] = {
	name = "Utils",
	u = { "<cmd>Telescope undo<cr>", "Undo" },
	c = { "<cmd>Telescope neoclip<cr>", "Clipy History" },
}

lvim.builtin.which_key.mappings["f"] = {
	name = "Local search",
	f = { "<cmd>Telescope git_files<cr>", "Git File" },
	w = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Local Word" },
	r = { "<cmd>Telescope lsp_references<cr>", "References" },
	s = { "<cmd>Telescope lsp_document_symbols<cr>", "Symbols" },
	R = { "<cmd>Telescope frecency<cr>", "frecency" },
}

lvim.builtin.which_key.mappings[" "] = {
	name = "Interesting",
	d = { "<cmd>DiffviewClose<cr>", "DiffviewClose" },
	r = { "<cmd>CellularAutomaton make_it_rain<cr>", "Rain" },
	l = { "<cmd>CellularAutomaton game_of_life<cr>", "Life" },
	s = { "<cmd>SnipRun<cr>", "SnipRun" },
}

-- 会话相关快捷键
lvim.builtin.which_key.mappings["S"] = {
	name = "Session",
	c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
	l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
	Q = { "<cmd>lua requir('persistence').stop()<cr>", "Quit without saving session" },
}

-- 错误显示快捷键
lvim.builtin.which_key.mappings["t"] = {
	name = "Diagnostics",
	t = { "<cmd>TroubleToggle<cr>", "trouble" },
	w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
	d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
	q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
	l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
	r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
}

-- -- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["r"] = {
	name = "Refactor",
	f = { "<cmd>Neogen func<cr>", "Annotation Fun" },
}

lvim.builtin.which_key.vmappings["r"] = {
	name = "Refactor",
	f = { "<Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>", "Extract function" },
	v = { "<Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>", "Extract variable" },
	a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
}

lvim.builtin.which_key.mappings["k"] = { vim.lsp.buf.hover, "Hover information" }
