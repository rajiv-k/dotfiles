require("lsp-zero")
local lspconfig = require("lspconfig")
lspconfig["gopls"].setup({
    single_file_support = true,
    root_dir = require("lspconfig.util").root_pattern("go.work", "go.mod", ".git"),
})
