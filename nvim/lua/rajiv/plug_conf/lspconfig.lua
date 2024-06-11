require("lsp-zero")
local lspconfig = require("lspconfig")
local capabilities = require('cmp_nvim_lsp').default_capabilities()
lspconfig.gopls.setup({
    capabilities = capabilities,
    single_file_support = true,
    root_dir = require("lspconfig.util").root_pattern("go.work", "go.mod", ".git"),
})
