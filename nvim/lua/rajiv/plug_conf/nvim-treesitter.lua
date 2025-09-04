require("nvim-treesitter.configs").setup({
    ensure_installed = {"go", "lua", "vim", "c", "vimdoc"},
    sync_install = false,
    highlight = {
        enable = true,

        disable = function(lang, buf)
            local max_filesize = 5 * 100 * 1024 -- 500 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,
        additional_vim_regex_highlighting = false,
    }
})
