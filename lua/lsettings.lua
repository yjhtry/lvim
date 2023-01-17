lvim.log.level = "warn"
lvim.colorscheme = "catppuccin-mocha"

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"

lvim.builtin.terminal.active = true

lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true
lvim.builtin.treesitter.rainbow.enable = true
lvim.builtin.treesitter.rainbow.max_file_lines = 1000

lvim.builtin.which_key.setup.plugins.marks = true
lvim.builtin.which_key.setup.plugins.registers = true

lvim.builtin.nvimtree.setup.filters.dotfiles = true
lvim.builtin.nvimtree.setup.auto_reload_on_write = true
-- lvim.builtin.gitsigns.opts.current_line_blame = true

lvim.builtin.telescope.on_config_done = function(telescope)
	pcall(telescope.load_extension, "undo")
	pcall(telescope.load_extension, "neoclip")
	-- any other extensions loading
end
