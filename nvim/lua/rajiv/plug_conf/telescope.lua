require("telescope").setup({
    pickers = {
        find_files = {
            previewer = false,
            layout_config = {
                height = 0.5,
                width = 0.5
            },
        },
        lsp_document_symbols = {
            previewer = false,
            layout_config = {
                width = 0.5,
                height = 0.5
            }
        }
    }
})
