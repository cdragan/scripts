vim.opt.tabstop = 8
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.virtualedit = "all"
vim.opt.clipboard = "unnamedplus"
vim.g.autoformat = false
vim.g.root_spec = { { ".clangd", ".p4config", ".git", "lua" }, "cwd" }
vim.filetype.add({ extension = { kos = "kos" } })

-- Highlight tabs and trailing spaces characters in red
vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = "*",
    callback = function()
        vim.cmd("match BadCharHighlight /\\t\\|\\s\\+$/")
    end,
})
vim.cmd("highlight BadCharHighlight ctermbg=red guibg=red")
