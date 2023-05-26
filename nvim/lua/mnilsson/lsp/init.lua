

local servers = { "lua_ls", "yamlls" }
local mason_loaded, mason = pcall(require, 'mason')
if not mason_loaded then
  return
end

mason.setup()

-- auto install servers
require("mason-lspconfig").setup({
    ensure_installed = servers,
    automatic_installation = true,
})






local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

--local lspconfig = require('lspconfig')

local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then

  return
end

-- enable servers
-- for _, lsp in ipairs(servers) do
--   lspconfig[lsp].setup {
--     capabilities = capabilities
--   }
-- end
-- 

-- lspconfig.sumneko_lua.setup {
--   capabilities = capabilities,
--   settings = {
--     Lua = {
--       diagnostics = {
--         globals = { "vim" },
--       },
--       workspace = {
--         library = {
--           [vim.fn.expand "$VIMRUNTIME/lua"] = true,
--           [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
--         },
--         maxPreload = 100000,
--         preloadFileSize = 10000,
--       },
--     },
--   },
-- }
--
lspconfig.yamlls.setup {
  capabilities = capabilities
}
