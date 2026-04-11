vim.opt.tabstop = 8                 -- TABs are 8 char wide
vim.opt.softtabstop = 4             -- insert 4 spaces on TAB press
vim.opt.shiftwidth = 4              -- indent on 4 spaces
vim.opt.expandtab = true            -- expand TABs to spaces
vim.opt.virtualedit = "all"         -- allow moving cursor beyond end of line
vim.opt.clipboard = "unnamedplus"   -- use system clipboard
vim.opt.number = true               -- show line numbers
vim.opt.relativenumber = true       -- show relative line numbers
vim.opt.signcolumn = "yes"          -- always show gutter on the left
vim.opt.cursorline = true           -- highlight the line where the cursor is
vim.opt.termguicolors = true        -- use 24-bit RGB colors
vim.opt.showmode = false            -- don't show mode, lualine already shows it
vim.opt.splitbelow = true           -- horizontal splits open below
vim.opt.splitright = true           -- vertical splits open on right
vim.opt.scrolloff = 4               -- always show 4 lines above/below cursor
vim.opt.sidescrolloff = 8           -- always show 8 columns on left/right side of cursor
vim.opt.ignorecase = true           -- search is case-insensitive
vim.opt.smartcase = true            -- search is case-sensitive is search pattern has uppercase chars
vim.opt.undofile = true             -- persistent undo history
vim.opt.updatetime = 200            -- trigger CursorHold after this many ms, for gitsigns and diagnostic updates
vim.opt.wrap = false                -- don't wrap lines
vim.opt.smoothscroll = true         -- enable smooth scrolling pixel-by-pixel
vim.opt.laststatus = 3              -- single global status line, instead of per-window

-- Show diagnostic messages as inline virtual text (e.g. clangd errors)
vim.diagnostic.config({
    virtual_text = true,
})

-- Highlight tabs and trailing spaces in red
vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = "*",
    callback = function()
        vim.fn.clearmatches()
        if vim.bo.buftype == "" and vim.bo.filetype ~= "" and vim.bo.filetype ~= "nofile" then
            vim.fn.matchadd("BadCharHighlight", "\\t\\|\\s\\+$")
        end
    end,
})
local function set_bad_char_highlight()
    vim.cmd("highlight BadCharHighlight ctermbg=red guibg=#eb6f92")
end
set_bad_char_highlight()
vim.api.nvim_create_autocmd("ColorScheme", { callback = set_bad_char_highlight })

-- Reload file if it changed outside of NeoVim
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" },
                            { command = "checktime" })
