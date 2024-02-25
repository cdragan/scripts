vim.keymap.set('n', '\\<C-s>', ':w<CR>', { desc = "Save current buffer", noremap = true, silent = true })
vim.keymap.set('i', '\\<C-s>', '<Esc>:w<CR>a', { desc = "Save current buffer", noremap = true, silent = true })
