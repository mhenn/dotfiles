-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
require'lspconfig'.clangd.setup{}

local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

local lspconfig = require("lspconfig")

lspconfig.rust_analyzer.setup{
    on_attach = on_attach,
    flags = lsp_flags,
    -- Server-specific settings...
    settings = {
--        on_attach = function(_, bufnr)
--                -- Hover actions
--                vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
--                -- Code action groups
--                vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
--                require 'illuminate'.on_attach(client)
--            end,
            ["rust-analyzer"] = {
--                checkOnSave = {
--                    command = "clippy"
--                },
            },
    --  ["rust-analyzer"] = {}
    }
}

--
--"bash-language-server", "css-lsp", "eslint-lsp", "html-lsp",
--    "json-lsp", "lua-language-server", "tailwindcss-language-server", "typescript-language-server",
--    "vue-language-server",  "node-debug2-adapter"
--
--
lspconfig.denols.setup{
    on_attach = on_attach,
    flags = lsp_flags,
      root_dir = lspconfig.util.root_pattern("deno.json"),
}
--
-- It enables tsserver automatically so no need to call lspconfig.tsserver.setup
lspconfig.tsserver.setup({
    disable_commands = false, -- prevent the plugin from creating Vim commands
    debug = false, -- enable debug logging for commands
    -- LSP Config options
    server = {
      capabilities = require('lsp.servers.tsserver').capabilities,
      handlers = require('lsp.servers.tsserver').handlers,
      on_attach = require('lsp.servers.tsserver').on_attach,
      settings = require('lsp.servers.tsserver').settings,
    },
      root_dir = lspconfig.util.root_pattern("package.json")
  })

lspconfig.tailwindcss.setup {
  capabilities = require('lsp.servers.tailwindcss').capabilities,
  filetypes = require('lsp.servers.tailwindcss').filetypes,
  handlers = handlers,
  init_options = require('lsp.servers.tailwindcss').init_options,
  on_attach = require('lsp.servers.tailwindcss').on_attach,
  settings = require('lsp.servers.tailwindcss').settings,
}

lspconfig.cssls.setup {
  capabilities = capabilities,
  handlers = handlers,
  on_attach = require('lsp.servers.cssls').on_attach,
  settings = require('lsp.servers.cssls').settings,
}

lspconfig.eslint.setup {
  capabilities = capabilities,
  handlers = handlers,
  on_attach = require('lsp.servers.eslint').on_attach,
  settings = require('lsp.servers.eslint').settings,
}

lspconfig.jsonls.setup {
  capabilities = capabilities,
  handlers = handlers,
  on_attach = on_attach,
  settings = require('lsp.servers.jsonls').settings,
}

lspconfig.sumneko_lua.setup {
  capabilities = capabilities,
  handlers = handlers,
  on_attach = on_attach,
  settings = require('lsp.servers.sumneko_lua').settings,
}

lspconfig.vuels.setup {
  filetypes = require('lsp.servers.vuels').filetypes,
  handlers = handlers,
  init_options = require('lsp.servers.vuels').init_options,
  on_attach = on_attach,
}

for _, server in ipairs { "bashls" , "html" } do
  lspconfig[server].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    handlers = handlers,
  }
end




--vim.g.markdown_fenced_languages = {
--  "ts=typescript"
--}
--
--
require('lspconfig')['clangd'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

require('lspconfig')['cmake'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}


--
--require('lspconfig')['texlab'].setup{
--    on_attach = on_attach,
--    flags = lsp_flags,
--}

----------------------------------------------------
--
--
