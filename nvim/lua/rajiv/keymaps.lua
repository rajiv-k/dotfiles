local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader><leader>', builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>r', builtin.live_grep, {})
vim.keymap.set('n', 'gr', builtin.lsp_references, {})

vim.keymap.set("n", '<leader>e', '<Cmd>NvimTreeFindFileToggle<CR>')
vim.keymap.set("n", '<ESC>', '<Cmd>noh<CR><ESC>')

vim.keymap.set("n", "<C-j>", "<C-w>j", { silent = true, remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { silent = true, remap = true })
vim.keymap.set("n", "<C-h>", "<C-w>h", { silent = true, remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { silent = true, remap = true })
vim.keymap.set("v", "<", "<gv", { silent = true, remap = false })
vim.keymap.set("v", ">", ">gv", { silent = true, remap = false })
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
