-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local function get_setup(conf_name)
  return function(_plugin, _opts)
    local mod = string.format("rajiv.plug_conf.%s", conf_name)
    require(mod)
  end
end

local lazy_plugins = {
    {
        "nvim-tree/nvim-tree.lua",
        config = get_setup("nvim-tree"),
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        }
    },
    { "nvim-lua/plenary.nvim" },
    {
        "nvim-telescope/telescope.nvim",
        config = get_setup("telescope")
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
    },
    {
        "neovim/nvim-lspconfig",
        config = get_setup("lspconfig"),
    },
    {
        'echasnovski/mini.nvim',
        version = false,
        config = get_setup("mini"),
    },
    {
        "hrsh7th/nvim-cmp",
        event = { "VeryLazy" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lsp-signature-help",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
        }
    },
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        config = function()
            require("nvim-treesitter.configs").setup({
              ensure_installed = { "go", "lua", "vim", "c", "vimdoc"},
              sync_install = false,
              highlight = {
                enable = true,

                disable = function(lang, buf)
                local max_filesize = 100 * 1024 -- 100 KB
                local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                if ok and stats and stats.size > max_filesize then
                    return true
                end
                end,
                additional_vim_regex_highlighting = false,
              }
          })
      end
    }
}

local opts = {}
require("lazy").setup(lazy_plugins, opts)
