return {
    -- Disable annoying automatic pairing
    {
        "nvim-mini/mini.pairs",
        enabled = false
    },
    -- Disable autofill suggestions
    {
        "garymjr/nvim-snippets",
        enabled = false
    },
    -- Disable annoying snippets
    {
        "L3MON4D3/LuaSnip",
        enabled = false
    },
    -- Set color scheme
    {
        "rose-pine/neovim",
        name = "rose-pine",
        opts = {
            styles = {
                italic = false
            }
        }
    },
    {
        "vague-theme/vague.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            style = {
                strings = "none",
                keyword_return = "none"
            }
        }
    },
    {
        "LazyVim/LazyVim",
        opts = {
            -- colorscheme = "rose-pine"
            colorscheme = "vague"
        }
    },
    -- Highlight TODOs without trailing colon
    {
        "folke/todo-comments.nvim",
        opts = {
            highlight = {
                keyword = "wide",
                pattern = [[.*<(KEYWORDS)>\s*]]
            },
            search = {
                pattern = [[\b(KEYWORDS)\b]],
            },
        }
    },
    -- Disable header insertion
    {
        "neovim/nvim-lspconfig",
        opts = function(_, opts)
            opts.servers = opts.servers or {}
            opts.servers.clangd = {
                cmd = { "clangd", "--header-insertion=never" },
            }
        end,
    },
    -- Configure syntax highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            -- Disable annoying C++ indentation in namespaces etc.
            indent = {
                enable = false
            },
            ensure_installed = {
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
            },
        },
    },
    -- Setup SuperTab in Cmp
    -- TODO this legacy plugin is now disabled, remove this
    {
        "hrsh7th/nvim-cmp",
        opts = function(_, opts)
            local has_words_before = function()
                unpack = unpack or table.unpack
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
            end

            local luasnip = require("luasnip")
            local cmp = require("cmp")

            opts.preselect = cmp.PreselectMode.None
            opts.completion = vim.tbl_extend("force", opts.completion, { autocomplete = false, completeopt = "noselect" })

            opts.mapping = vim.tbl_extend("force", opts.mapping, {
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
                        cmp.select_next_item()
                        -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                        -- this way you will only jump inside the snippet region
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    elseif has_words_before() then
                        cmp.complete()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            })
        end,
    },
    -- Setup SuperTab
    {
        "saghen/blink.cmp",
        opts = function(_, opts)
            opts.sources = { default = { 'buffer', 'lsp', 'path' }, }
            opts.keymap = {
                preset = "default",
                ["<Tab>"] = { "accept", "fallback" },
            }
        end,
    },
    -- tmux integration
    {
        "alexghergh/nvim-tmux-navigation",
        config = function()
            require("nvim-tmux-navigation").setup({ disable_when_zoomed = true })
        end
    },
}
