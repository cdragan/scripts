vim.opt.tabstop = 8
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.virtualedit = "all"
vim.opt.clipboard = "unnamedplus"
vim.g.autoformat = false
vim.g.root_spec = { { ".clangd", ".p4config", ".git", "lua" }, "cwd" }
vim.g.snacks_animate = false
vim.filetype.add({ extension = { kos = "kos" } })

-- Highlight tabs and trailing spaces characters in red
vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = "*",
    callback = function()
        -- Enable highlighting bad characters only in "real" files
        if vim.bo.buftype == "" and vim.bo.filetype ~= "dashboard" and vim.bo.filetype ~= "nofile" then
            vim.fn.clearmatches()
            vim.fn.matchadd("BadCharHighlight", "\\t\\|\\s\\+$")
        else
            vim.fn.clearmatches()
        end
    end,
})
vim.cmd("highlight BadCharHighlight ctermbg=red guibg=#eb6f92")
