-- Cmd-S saves current buffer
vim.keymap.set('n', '\\<C-s>', ':w<CR>', { desc = "Save current buffer", noremap = true, silent = true })
vim.keymap.set('i', '\\<C-s>', '<Esc>:w<CR>a', { desc = "Save current buffer", noremap = true, silent = true })

-- Show list of current buffer symbols in telescope
vim.keymap.set('n', '<leader>fs', require("telescope.builtin").lsp_document_symbols, { desc = "Find Symbols" })

-- Paste over selection without affecting clipboard contents
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste over selection" })

-- Move selected text up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down", noremap = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up", noremap = true })

-- Join lines and restore cursor position
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines", noremap = true })
