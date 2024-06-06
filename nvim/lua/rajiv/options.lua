local opt = vim.opt

opt.encoding = "utf8"
opt.fileencoding = "utf8"
opt.syntax = "ON"
opt.termguicolors = true
opt.cursorline = true
-- opt.listchars = "tab:·┈,trail:￮,trail:·,multispace:￮,lead: ,extends:▶,precedes:◀,eol:↵,nbsp:‿"
opt.listchars = "tab:·┈,trail:·,multispace:￮,lead: ,extends:▶,precedes:◀,eol:↵,nbsp:‿"
opt.list = false

opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true

opt.expandtab = true
opt.shiftwidth = 4
opt.softtabstop = 4
opt.tabstop = 4
opt.splitright = true
opt.laststatus = 2

-- vim.o.statusline = [[%<%f %h%m%r %y%=%{v:register} %-14.(%l,%c%V%) %P]]
vim.o.statusline = [[[%n] %<%F %m    [%R%H%W%Y][%{&ff}] [ascii:%3b hex:0x%2B] %= line:%l/%L col:%-2c   %3p%%  ]]

vim.cmd.colorscheme("onedark")
vim.api.nvim_set_hl(0, 'Comment', {fg = "SkyBlue"})

vim.wo.number = true
vim.g.mapleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- format on save
vim.cmd [[autocmd BufWritePre *.go lua vim.lsp.buf.format()]]

-- autoimports
-- https://github.com/neovim/nvim-lspconfig/issues/115#issuecomment-1128115341
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.go" },
	callback = function()
		local params = vim.lsp.util.make_range_params(nil, "utf-8")
		params.context = { only = { "source.organizeImports" } }
		local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
		for _, res in pairs(result or {}) do
			for _, r in pairs(res.result or {}) do
				if r.edit then
					vim.lsp.util.apply_workspace_edit(r.edit, "utf-8")
				else
					vim.lsp.buf.execute_command(r.command)
				end
			end
		end
	end,
})
