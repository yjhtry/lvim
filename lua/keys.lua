-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "openAllFolds" })
vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "closeAllFolds" })

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
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

lvim.keys.operator_pending_mode = {}

lvim.lsp.buffer_mappings.normal_mode["K"] = nil
lvim.lsp.buffer_mappings.normal_mode["gs"] = nil
lvim.lsp.buffer_mappings.normal_mode["<S-h>"] = nil
lvim.lsp.buffer_mappings.normal_mode["<S-l>"] = nil

lvim.builtin.which_key.mappings["u"] = { "~", "Capital letter" }
lvim.builtin.which_key.mappings["ss"] = { "<cmd>Telescope<cr>", "Telescope" }
lvim.builtin.which_key.mappings["sb"] = { "<cmd>Telescope buffers<cr>", "Buffers" }
lvim.builtin.which_key.mappings["sw"] = { "<cmd>Telescope live_grep<cr>", "live Word" }

lvim.builtin.which_key.mappings["n"] = { "<cmd>enew<cr>", "New File" }
lvim.builtin.which_key.mappings["o"] = { "<cmd>Telescope grep_string<cr>", "Cursor Word" }
lvim.builtin.which_key.mappings["h"] = { "<cmd>Telescope git_files<cr>", "Git File" }

lvim.builtin.which_key.mappings["f"] = {
	name = "Local search",
	f = { "<cmd>Telescope git_files<cr>", "Git File" },
	w = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Local Word" },
	-- r = { "<cmd>Telescope lsp_references<cr>", "References" },
	-- s = { "<cmd>Telescope lsp_document_symbols<cr>", "Symbols" },
	-- R = { "<cmd>Telescope frecency<cr>", "frecency" },
}

lvim.builtin.which_key.mappings[" "] = {
	name = "Interesting",
	d = { "<cmd>DiffviewClose<cr>", "DiffviewClose" },
	r = { "<cmd>CellularAutomaton make_it_rain<cr>", "Rain" },
	l = { "<cmd>CellularAutomaton game_of_life<cr>", "Life" },
	s = { "<cmd>SnipRun<cr>", "SnipRun" },
}

-- -- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

lvim.builtin.which_key.mappings["k"] = { vim.lsp.buf.hover, "Hover information" }
