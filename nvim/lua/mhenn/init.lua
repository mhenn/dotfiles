require("mhenn.set")
require("mhenn.packer")
require("mhenn.lsp")
require("mhenn.lspsaga")
require("mhenn.rust")
require("mhenn.cmp")
require("mhenn.colors")
require("mhenn.TS")
require("mhenn.telescope")
require("mhenn.debug")
require("mhenn.keymap")

local augroup = vim.api.nvim_create_augroup
mhenn = augroup('mhenn', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})
--autocmd({"BufEnter", "BufWinEnter", "TabEnter"}, {
--    group = mhenn,
--    pattern = "*.rs",
--    callback = function()
--        require("lsp_extensions").inlay_hints{}
--    end
--})
--
autocmd({"BufWritePre"}, {
    group = mhenn,
    pattern = "*",
    command = "%s/\\s\\+$//e",
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

require("mason").setup()
require("mason-lspconfig").setup()
require("luasnip.loaders.from_vscode").lazy_load()
