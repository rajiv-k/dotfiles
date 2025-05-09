local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader><leader>', builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>r', builtin.live_grep, {})
vim.keymap.set('n', 'gr', builtin.lsp_references, {})

vim.keymap.set("n", '<leader>e', '<Cmd>NvimTreeFindFileToggle<CR>')
vim.keymap.set("n", '<leader>q', '<Cmd>cclose<CR>')
vim.keymap.set("n", '<ESC>', '<Cmd>noh<CR><ESC>')

vim.keymap.set("n", "<C-h>", "<C-w>h", { silent = true, remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { silent = true, remap = true })
vim.keymap.set("n", "<C-n>", "<Cmd>cnext<cr>", { silent = true, remap = true })
vim.keymap.set("n", "<C-p>", "<Cmd>cprev<cr>", { silent = true, remap = true })
vim.keymap.set("v", "<", "<gv", { silent = true, remap = false })
vim.keymap.set("v", ">", ">gv", { silent = true, remap = false })
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gI", vim.lsp.buf.implementation)
vim.keymap.set("n", "<leader>s", builtin.lsp_document_symbols)
vim.keymap.set("n", "K", vim.lsp.buf.hover)


-- ToggleQuickfix
function ToggleQuickfix()
  for _, win in ipairs(vim.fn.getwininfo()) do
    if win.quickfix == 1 then
      vim.cmd('cclose')
      return
    end
  end
  vim.cmd('copen')
end

vim.keymap.set('n', '<leader>q', ToggleQuickfix, { silent = true })
