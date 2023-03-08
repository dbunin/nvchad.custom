local present, lspconfig = pcall(require, "lspconfig")
local utils = require "core.utils"

if not present then
  return
end

local capabilities = require("plugins.configs.lspconfig").capabilities
local servers = { "html", "cssls", "tsserver", "tailwindcss", "clojure_lsp", "lua_ls" }

require("lsp-format").setup {}

local new_on_attach = function(client, bufnr)
  require("lsp-format").on_attach(client)

  utils.load_mappings("lspconfig", { buffer = bufnr })

  if client.server_capabilities.signatureHelpProvider then
    require("nvchad_ui.signature").setup(client)
  end
end

for _, lsp in pairs(servers) do
  lspconfig[lsp].setup {
    on_attach = new_on_attach,
    capabilities = capabilities,
  }
end
