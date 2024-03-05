vim.keymap.set('n', '\\<C-s>', ':w<CR>', { desc = "Save current buffer", noremap = true, silent = true })
vim.keymap.set('i', '\\<C-s>', '<Esc>:w<CR>a', { desc = "Save current buffer", noremap = true, silent = true })
vim.keymap.set('n', '<leader>ds', require("telescope.builtin").lsp_document_symbols, { desc = "[D]ocument [S]ymbols" })
