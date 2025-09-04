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
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
        config = get_setup("nvim-tree"),
    },
    { "nvim-lua/plenary.nvim" },
    {
        "nvim-telescope/telescope.nvim",
        config = get_setup("telescope")
    },
    {
        "neovim/nvim-lspconfig",
        config = get_setup("lspconfig"),
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        dependencies = {
            "L3MON4D3/LuaSnip",
        },
        description = "required by lspconfig",
    },
    {
        'echasnovski/mini.nvim',
        version = false,
        config = get_setup("mini"),
    },
    {
        "hrsh7th/nvim-cmp",
        event = { "InsertEnter" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lsp-signature-help",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
        },
        lazy = false,
        config = get_setup("nvim-cmp"),
    },
    {
        "nvim-treesitter/nvim-treesitter",
        config = get_setup("nvim-treesitter")
    },
    {
        "nvim-treesitter/nvim-treesitter-context"
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        lazy = false,
        config = get_setup("lualine")
    },
    { 'echasnovski/mini.nvim', version = '*' },
    {
        "ray-x/go.nvim",
        config = get_setup('go'),
        event = {"CmdlineEnter"},
        ft = {"go", 'gomod'}
    },
	{
	  "navarasu/onedark.nvim",
	  priority = 1000, config = function()
	    require('onedark').setup {
	      style = 'darker',
	         code_style = {
	           comments = 'none',
	         }
	    }
	    require('onedark').load()
	  end
	}
}

local opts = {}
require("lazy").setup(lazy_plugins, opts)
