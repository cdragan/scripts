-- Save current buffer
vim.keymap.set("n", "<C-s>", ":w<CR>", { desc = "Save current buffer", noremap = true, silent = true })
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>a", { desc = "Save current buffer", noremap = true, silent = true })

-- Paste over selection without affecting clipboard contents
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste over selection" })

-- Flash jump (s + pattern, then press a label to jump there)
vim.keymap.set({ "n", "x", "o" }, "s", function() require("flash").jump() end, { desc = "Flash" })
vim.keymap.set({ "n", "x", "o" }, "S", function() require("flash").treesitter() end, { desc = "Flash treesitter" })

-- Move selected text up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down", noremap = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up", noremap = true })

-- Integration with tmux
local tmux_nav = require("nvim-tmux-navigation")
vim.keymap.set("n", "<C-h>", tmux_nav.NvimTmuxNavigateLeft,  { desc = "Go to left pane" })
vim.keymap.set("n", "<C-j>", tmux_nav.NvimTmuxNavigateDown,  { desc = "Go to pane below" })
vim.keymap.set("n", "<C-k>", tmux_nav.NvimTmuxNavigateUp,    { desc = "Go to pane above" })
vim.keymap.set("n", "<C-l>", tmux_nav.NvimTmuxNavigateRight, { desc = "Go to right pane" })

-- Buffer navigation
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next buffer" })

-- Clear search highlight
vim.keymap.set("n", "<Esc>", "<cmd>noh<CR><Esc>", { desc = "Clear search highlight" })

-- which-key group labels
require("which-key").add({
    { "<leader>b", group = "Buffer" },
    { "<leader>c", group = "Code" },
    { "<leader>f", group = "File/Find" },
    { "<leader>g", group = "Git" },
    { "<leader>q", group = "Quit/Session" },
    { "<leader>s", group = "Search" },
    { "<leader>u", group = "UI" },
    { "<leader>w", group = "Windows" },
    { "<leader>x", group = "Diagnostics" },
})

-- Find / Files (snacks picker) -----------------------------------------------

vim.keymap.set("n", "<leader><space>", function() Snacks.picker.files() end, { desc = "Find files" })
vim.keymap.set("n", "<leader>,", function() Snacks.picker.buffers() end, { desc = "Switch buffer" })
vim.keymap.set("n", "<leader>/", function() Snacks.picker.grep() end, { desc = "Grep" })
vim.keymap.set("n", "<leader>:", function() Snacks.picker.command_history() end, { desc = "Command history" })

vim.keymap.set("n", "<leader>fb", function() Snacks.picker.buffers() end, { desc = "Buffers" })
vim.keymap.set("n", "<leader>ff", function() Snacks.picker.files() end, { desc = "Find files" })
vim.keymap.set("n", "<leader>fF", function() Snacks.picker.files({ cwd = vim.fn.getcwd() }) end, { desc = "Find files (cwd)" })
vim.keymap.set("n", "<leader>fg", function() Snacks.picker.git_files() end, { desc = "Find files (git)" })
vim.keymap.set("n", "<leader>fr", function() Snacks.picker.recent() end, { desc = "Recent files" })
vim.keymap.set("n", "<leader>fR", function() Snacks.picker.recent({ filter = { cwd = true } }) end, { desc = "Recent files (cwd)" })
vim.keymap.set("n", "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, { desc = "Find config file" })

-- Search ---------------------------------------------------------------------

vim.keymap.set("n", "<leader>sg", function() Snacks.picker.grep() end, { desc = "Grep" })
vim.keymap.set("n", "<leader>sG", function() Snacks.picker.grep({ cwd = vim.fn.getcwd() }) end, { desc = "Grep (cwd)" })
vim.keymap.set("n", "<leader>sw", function() Snacks.picker.grep_word() end, { desc = "Grep word under cursor" })
vim.keymap.set("n", "<leader>sb", function() Snacks.picker.lines() end, { desc = "Buffer lines" })
vim.keymap.set("n", "<leader>sh", function() Snacks.picker.help() end, { desc = "Help pages" })
vim.keymap.set("n", "<leader>sk", function() Snacks.picker.keymaps() end, { desc = "Keymaps" })
vim.keymap.set("n", "<leader>sm", function() Snacks.picker.marks() end, { desc = "Marks" })
vim.keymap.set("n", "<leader>sR", function() Snacks.picker.resume() end, { desc = "Resume last picker" })
vim.keymap.set("n", "<leader>sd", function() Snacks.picker.diagnostics() end, { desc = "Diagnostics" })
vim.keymap.set("n", "<leader>ss", function() Snacks.picker.lsp_symbols() end, { desc = "LSP symbols" })
vim.keymap.set("n", "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, { desc = "LSP workspace symbols" })

-- Buffers --------------------------------------------------------------------

vim.keymap.set("n", "<leader>bd", function() Snacks.bufdelete() end, { desc = "Delete buffer" })
vim.keymap.set("n", "<leader>bo", function() Snacks.bufdelete.other() end, { desc = "Delete other buffers" })

-- Git ------------------------------------------------------------------------

vim.keymap.set("n", "<leader>gb", function() Snacks.picker.git_branches() end, { desc = "Git branches" })
vim.keymap.set("n", "<leader>gl", function() Snacks.picker.git_log() end, { desc = "Git log" })
vim.keymap.set("n", "<leader>gf", function() Snacks.picker.git_log_file() end, { desc = "Git log (current file)" })
vim.keymap.set("n", "<leader>gs", function() Snacks.picker.git_status() end, { desc = "Git status" })
vim.keymap.set("n", "<leader>gB", function() Snacks.gitbrowse() end, { desc = "Git browse" })
vim.keymap.set("n", "]h", function() require("gitsigns").nav_hunk("next") end, { desc = "Next hunk" })
vim.keymap.set("n", "[h", function() require("gitsigns").nav_hunk("prev") end, { desc = "Previous hunk" })
vim.keymap.set("n", "<leader>ghr", function() require("gitsigns").reset_hunk() end, { desc = "Reset hunk" })
vim.keymap.set("n", "<leader>ghp", function() require("gitsigns").preview_hunk() end, { desc = "Preview hunk" })
vim.keymap.set("n", "<leader>ghb", function() require("gitsigns").blame_line() end, { desc = "Blame line" })

-- Diagnostics / Trouble ------------------------------------------------------

vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Diagnostics" })
vim.keymap.set("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", { desc = "Buffer diagnostics" })
vim.keymap.set("n", "<leader>xL", "<cmd>Trouble loclist toggle<CR>", { desc = "Location list" })
vim.keymap.set("n", "<leader>xQ", "<cmd>Trouble qflist toggle<CR>", { desc = "Quickfix list" })

-- Windows --------------------------------------------------------------------

vim.keymap.set("n", "<leader>ww", "<C-W>p", { desc = "Other window" })
vim.keymap.set("n", "<leader>wd", "<C-W>c", { desc = "Delete window" })
vim.keymap.set("n", "<leader>w-", "<C-W>s", { desc = "Split below" })
vim.keymap.set("n", "<leader>w|", "<C-W>v", { desc = "Split right" })
vim.keymap.set("n", "<leader>-", "<C-W>s", { desc = "Split below" })
vim.keymap.set("n", "<leader>|", "<C-W>v", { desc = "Split right" })

-- Quit / Session -------------------------------------------------------------

vim.keymap.set("n", "<leader>qq", "<cmd>qa<CR>", { desc = "Quit all" })
vim.keymap.set("n", "<leader>qs", function() require("persistence").load() end, { desc = "Restore session" })
vim.keymap.set("n", "<leader>qS", function() require("persistence").select() end, { desc = "Select session" })
vim.keymap.set("n", "<leader>ql", function() require("persistence").load({ last = true }) end, { desc = "Restore last session" })
vim.keymap.set("n", "<leader>qd", function() require("persistence").stop() end, { desc = "Stop session recording" })

-- File explorer --------------------------------------------------------------

vim.keymap.set("n", "<leader>e", function() Snacks.explorer() end, { desc = "File explorer" })

-- UI toggles -----------------------------------------------------------------

vim.keymap.set("n", "<leader>un", function() Snacks.notifier.hide() end, { desc = "Dismiss notifications" })
vim.keymap.set("n", "<leader>uw", function() Snacks.toggle("wrap"):toggle() end, { desc = "Toggle word wrap" })
vim.keymap.set("n", "<leader>uL", function() Snacks.toggle("relativenumber"):toggle() end, { desc = "Toggle relative numbers" })
vim.keymap.set("n", "<leader>ul", function() Snacks.toggle("number"):toggle() end, { desc = "Toggle line numbers" })
vim.keymap.set("n", "<leader>ud", function() vim.diagnostic.enable(not vim.diagnostic.is_enabled()) end, { desc = "Toggle diagnostics" })

-- Terminal -------------------------------------------------------------------

vim.keymap.set("n", "<leader>ft", function() Snacks.terminal() end, { desc = "Terminal" })
vim.keymap.set("n", "<C-/>", function() Snacks.terminal() end, { desc = "Terminal" })

-- Search and replace ---------------------------------------------------------

vim.keymap.set("n", "<leader>sr", function() require("grug-far").open() end, { desc = "Search and replace" })

-- LSP keymaps (set up via LspAttach autocmd) ---------------------------------

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(event)
        local buf = event.buf
        local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = buf, desc = desc })
        end

        map("n", "gd", vim.lsp.buf.definition, "Go to definition")
        map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
        map("n", "gr", vim.lsp.buf.references, "References")
        map("n", "gI", vim.lsp.buf.implementation, "Go to implementation")
        map("n", "gy", vim.lsp.buf.type_definition, "Go to type definition")
        map("n", "K", vim.lsp.buf.hover, "Hover")
        map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
        map("n", "<leader>cr", vim.lsp.buf.rename, "Rename")
        map("n", "<leader>cd", vim.diagnostic.open_float, "Line diagnostics")
        map("n", "<leader>cf", function() vim.lsp.buf.format({ bufnr = buf }) end, "Format")
    end,
})

-- Diagnostics navigation
vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1 }) end, { desc = "Next diagnostic" })
vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end, { desc = "Previous diagnostic" })
