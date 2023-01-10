--[[
 THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
 `lvim` is the global options object
]]

-- vim options
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = true
vim.opt.list = true
-- vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

-- general
lvim.log.level = "info"
lvim.format_on_save = {
  enabled = true,
  pattern = "*.lua,*.js,*.tsx,*.ts,*.rs,*.json,*.html",
  timeout = 8000,
}

lvim.builtin.gitsigns.opts.current_line_blame = true

vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)


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
    }
  },
  {
    exe = "prettier",
    filetypes = {
      "json",
    }
  },
  {
    exe = "prettier",
    filetypes = {
      "html",
    }
  }
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
    }
  }
})
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<C-c>"] = "ESC"
lvim.keys.normal_mode["[<space>"] = "o<ESC>"
lvim.keys.normal_mode["]<space>"] = "O<ESC>"


lvim.builtin.which_key.mappings["D"] = { "<cmd>DiffviewOpen<cr>", "DiffviewOpen" }
lvim.builtin.which_key.mappings["u"] = { "<cmd>Telescope undo<cr>", "Undo" }
lvim.builtin.which_key.mappings["ss"] = { "<cmd>Telescope<cr>", "Telescope" }
lvim.builtin.which_key.mappings["sb"] = { "<cmd>Telescope buffers<cr>", "Buffers" }
lvim.builtin.which_key.mappings["sw"] = { "<cmd>Telescope live_grep<cr>", "live Word" }
lvim.builtin.which_key.mappings["sc"] = { "<cmd>Telescope grep_string<cr>", "Cursor Word" }
lvim.builtin.which_key.mappings["n"] = { "<cmd>enew<cr>", "New File" }
lvim.builtin.which_key.mappings["o"] = { "<cmd>SymbolsOutline<cr>", "SymbolsOutline" }

lvim.builtin.which_key.mappings["f"] = {
  name = "Local search",
  f = { "<cmd>Telescope git_files<cr>", "Git File" },
  w = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Local Word" },
  r = { "<cmd>Telescope lsp_references<cr>", "References" },
  s = { "<cmd>Telescope lsp_document_symbols<cr>", "Symbols" },
  R = { "<cmd>Telescope frecency<cr>", "frecency" },
}


lvim.builtin.which_key.mappings[" "] = {
  name = "DiffviewOpen",
  D = { "<cmd>DiffviewClose<cr>", "DiffviewClose" },
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

-- -- Change theme settings
-- lvim.colorscheme = "lunar"

-- After changing plugin config exit and reopen LunarVim, Run :PackerSync
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true

-- lvim.builtin.telescope.on_config_done = function(telescope)
--   pcall(telescope.load_extension, "projects")
--   pcall(telescope.load_extension, "zoxide")
--   pcall(telescope.load_extension, "frecency")
--   pcall(telescope.load_extension, "live_grep_args")
--   pcall(telescope.load_extension, "neoclip")
--   pcall(telescope.load_extension, "undo")
--   -- any other extensions loading
-- end

-- -- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
lvim.plugins = {
  {
    "catppuccin/nvim",
    as = "catppuccin",
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    module = "persistence",
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
    run = "cd app && npm install",
    ft = "markdown",
    config = function()
      vim.g.mkdp_auto_start = 1
    end,
  },
  {
    "metakirby5/codi.vim",
    cmd = "Codi",
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
    after = "telescope-fzf-native.nvim",
    config = function()
      require "telescope".load_extension("frecency")
    end,
    requires = { { "kkharji/sqlite.lua" } },
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
    opt = true,
    event = { "CursorMoved", "InsertEnter" },
  },
  {
    "max397574/better-escape.nvim",
    opt = true,
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
    opt = true,
    event = "InsertEnter",
    wants = "nvim-treesitter",
    after = "nvim-cmp",
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
    opt = true,
    cmd = { "DiffviewOpen", "DiffviewClose" },
  },
  { 'nvim-treesitter/nvim-treesitter-textobjects' },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "ggandor/leap.nvim",
    event = "BufRead",
    config = function()
      require('leap').add_default_mappings()
    end
  },
  {
    "ggandor/flit.nvim",
    event = "BufRead",
    config = function()
      require('flit').setup {
        keys = { f = 'f', F = 'F', t = 't', T = 'T' },
        -- A string like "nv", "nvo", "o", etc.
        labeled_modes = "v",
        multiline = true,
        -- Like `leap`s similar argument (call-specific overrides).
        -- E.g.: opts = { equivalence_classes = {} }
        opts = {}
      }
    end
  },
  { "tpope/vim-repeat" },
  { "debugloop/telescope-undo.nvim" },
  -- { "Mofiqul/vscode.nvim", config = function()
  --   local c = require('vscode.colors')
  --   require('vscode').setup({
  --     -- Enable transparent background
  --     transparent = true,

  --     -- Enable italic comment
  --     italic_comments = true,

  --     -- Disable nvim-tree background color
  --     disable_nvimtree_bg = true,

  --     -- Override colors (see ./lua/vscode/colors.lua)
  --     color_overrides = {
  --       -- vscLineNumber = '#FFFFFF',
  --       vscBack = '#151515',
  --     },

  --     -- Override highlight groups (see ./lua/vscode/theme.lua)
  --     group_overrides = {
  --       -- this supports the same val table as vim.api.nvim_set_hl
  --       -- use colors from this colorscheme by requiring vscode.colors!
  --       Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
  --     }
  --   })

  -- end },
  { "simrat39/rust-tools.nvim", config = function()
    require("rust-tools").setup({
      server = {
        settings = {
          ["rust-analyzer"] = {
            inlayHints = { locationLinks = false },
          },
        },
      },
    })
  end },
  { "mattn/emmet-vim" },
  { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }
}

-- Treesitter
local ts = lvim.builtin.treesitter

ts.autotag = { enable = true }

ts.textobjects = {
  select = {
    enable = true,
    -- Automatically jump forward to textobj, similar to targets.vim
    lookahead = true,
    keymaps = {
      -- You can use the capture groups defined in textobjects.scm
      ['aa'] = '@parameter.outer',
      ['ia'] = '@parameter.inner',
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
      ["]["] = "@function.outer",
      ["]m"] = "@class.outer",
    },
    goto_next_end = {
      ["]]"] = "@function.outer",
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

local telescope = lvim.builtin.telescope
telescope.extensions.undo = {
  side_by_side = true,
  layout_config = {
    preview_height = 0.8,
  },
}


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true
}
local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
for _, ls in ipairs(language_servers) do
  require('lspconfig')[ls].setup({
    capabilities = capabilities
    -- you can add other fields for setting up lsp server in this table
  })
end
require('ufo').setup({
  provider_selector = function(bufnr, filetype, buftype)
    return { 'treesitter', 'indent' }
  end
})

vim.cmd [[
" disable syntax highlighting in big files
function! DisableSyntaxTreesitter()
    echo("Big file, disabling syntax, treesitter and folding")
    if exists(':TSBufDisable')
        exec 'TSBufDisable autotag'
        exec 'TSBufDisable highlight'
    endif

    set foldmethod=manual
    syntax clear
    syntax off
    filetype off
    set noundofile
    set noswapfile
    set noloadplugins
    set lazyredraw
endfunction

augroup BigFileDisable
    autocmd!
    autocmd BufReadPre,FileReadPre * if getfsize(expand("%")) > 1024 * 1024 | exec DisableSyntaxTreesitter() | endif
augroup END
  ]]

-- lvim.transparent_window = true
lvim.colorscheme = "catppuccin-mocha"
lvim.builtin.treesitter.rainbow.enable = true
lvim.builtin.treesitter.rainbow.max_file_lines = 5000
