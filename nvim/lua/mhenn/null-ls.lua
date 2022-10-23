local null_ls = require("null-ls")



null_ls.setup({
    on_attach = function(client, bufnr)
        if client.server_capabilities.documentFormattingProvider then
            vim.cmd("nnoremap <silent><buffer> <Leader>fo :lua vim.lsp.buf.format()<CR>")

            -- format on save
            vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.format()")
        end

        if client.server_capabilities.documentRangeFormattingProvider then
            vim.cmd("xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.range_formatting({})<CR>")
        end
    end,
})

local opts = { silent = true, noremap = true }
vim.api.nvim_set_keymap('n', '<Leader>fr', "<Cmd>lua vim.lsp.buf.format()<CR>", {silent=false, noremap=true})
