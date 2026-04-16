-- Plugins --------------------------------------------------------------------

local gh = function(repo) return "https://github.com/" .. repo end

vim.pack.add({
    -- Colorschemes
    gh("vague-theme/vague.nvim"),
    --gh("rose-pine/neovim"),

    -- UI
    gh("nvim-lualine/lualine.nvim"),
    gh("akinsho/bufferline.nvim"),
    gh("folke/noice.nvim"),
    gh("MunifTanjim/nui.nvim"),
    gh("folke/which-key.nvim"),
    gh("folke/snacks.nvim"),
    gh("folke/trouble.nvim"),
    gh("nvim-mini/mini.icons"),

    -- Editor
    gh("folke/flash.nvim"),
    gh("lewis6991/gitsigns.nvim"),
    gh("folke/persistence.nvim"),

    -- Navigation
    gh("alexghergh/nvim-tmux-navigation"),

    -- Treesitter
    gh("nvim-treesitter/nvim-treesitter"),
    gh("nvim-treesitter/nvim-treesitter-textobjects"),
    gh("windwp/nvim-ts-autotag"),
    gh("folke/ts-comments.nvim"),

    -- LSP
    gh("stevearc/aerial.nvim"),
    gh("p00f/clangd_extensions.nvim"),

    -- Completion (pin to v1.x for pre-built fuzzy matching binary)
    { src = gh("saghen/blink.cmp"), version = vim.version.range("1.0") },
    gh("rafamadriz/friendly-snippets"),

    -- Coding
    gh("nvim-mini/mini.ai"),
    gh("folke/lazydev.nvim"),

    -- Dependencies
    gh("nvim-lua/plenary.nvim"),
})

-- Colorscheme ----------------------------------------------------------------

require("vague").setup({
    style = {
        strings = "none",
        keyword_return = "none",
    },
})
vim.cmd.colorscheme("vague")

-- UI -------------------------------------------------------------------------

require("aerial").setup({
    backends = { "lsp", "treesitter" },
    attach_mode = "global",
})

require("lualine").setup({
    sections = {
        lualine_c = {
            "filename",
            "aerial",
        },
    },
})

require("bufferline").setup({})

require("noice").setup({
    lsp = {
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
        },
    },
})

require("which-key").setup({
    preset = "helix",
})

require("snacks").setup({
    indent = { enabled = false },
    notifier = { enabled = true },
    picker = { enabled = true },
    explorer = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    toggle = { enabled = true },
    terminal = { enabled = true },
})

require("trouble").setup({})

require("mini.icons").setup({})
MiniIcons.mock_nvim_web_devicons()

-- Editor ---------------------------------------------------------------------

require("flash").setup({
    modes = {
        char = {
            multi_line = false,
        },
    },
})

require("gitsigns").setup({})

require("persistence").setup({})

-- Navigation -----------------------------------------------------------------

require("nvim-tmux-navigation").setup({ disable_when_zoomed = true })

-- Treesitter -----------------------------------------------------------------

-- Enable treesitter highlighting for all filetypes (indent disabled to avoid bad C++ indentation)
vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        pcall(vim.treesitter.start)
    end,
})

-- Install parsers on demand via :TSInstall or manually with:
-- require("nvim-treesitter").install({ "c", "cpp", "lua", ... })
local ts_langs = {
    "awk",
    "bash",
    "c",
    "cpp",
    "css",
    "csv",
    "cuda",
    "devicetree",
    "diff",
    "git_config",
    "git_rebase",
    "gitattributes",
    "gitcommit",
    "gitignore",
    "glsl",
    "html",
    "http",
    "javascript",
    "json",
    "kconfig",
    "kos",
    "linkerscript",
    "lua",
    "make",
    "markdown",
    "markdown_inline",
    "objc",
    "objdump",
    "passwd",
    "pem",
    "printf",
    "proto",
    "python",
    "query",
    "regex",
    "rst",
    "ssh_config",
    "strace",
    "todotxt",
    "udev",
    "vim",
    "xml",
    "yaml",
}

-- Install missing parsers on startup (async, non-blocking)
vim.api.nvim_create_autocmd("VimEnter", {
    once = true,
    callback = function()
        local installed = require("nvim-treesitter").get_installed()
        local installed_set = {}
        for _, lang in ipairs(installed) do
            installed_set[lang] = true
        end
        local missing = {}
        for _, lang in ipairs(ts_langs) do
            if not installed_set[lang] then
                missing[#missing + 1] = lang
            end
        end
        if #missing > 0 then
            require("nvim-treesitter").install(missing)
        end
    end,
})

require("nvim-ts-autotag").setup({})

require("ts-comments").setup({})

-- LSP -----------------------------------------------------------------------

vim.lsp.config("clangd", {
    cmd = { "clangd", "--header-insertion=never" },
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
})

vim.lsp.config("lua_ls", {})

vim.lsp.enable({ "clangd", "lua_ls" })

require("clangd_extensions").setup({})

-- Completion -----------------------------------------------------------------

require("blink.cmp").setup({
    sources = {
        default = { "buffer", "lsp", "path" },
    },
    keymap = {
        preset = "default",
        ["<Tab>"] = { "accept", "fallback" },
    },
    fuzzy = {
        implementation = "lua",
    },
})

-- Coding ---------------------------------------------------------------------

require("mini.ai").setup({})

require("lazydev").setup({})
