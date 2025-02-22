vim.bo.commentstring = "# %s"
vim.bo.expandtab = true

require('nvim-treesitter.configs').setup {
    ensure_installed = { "kos" },
    highlight = { enable = true },
}

require("nvim-treesitter.parsers").get_parser_configs().kos = {
    install_info = {
        url = "https://github.com/kos-lang/tree-sitter-kos",
        files = { "src/parser.c" },
        branch = "main",
        generate_requires_npm = false,
        requires_generate_from_grammar = false,
    },
    filetype = "kos",
}
