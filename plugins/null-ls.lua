local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local h = require("null-ls.helpers")
local methods = require("null-ls.methods")

local FORMATTING = methods.internal.FORMATTING

local b = null_ls.builtins

local cljfmt = h.make_builtin({
    name = "node-cljfmt",
    meta = {
        url = "https://github.com/snoe/node-cljfmt",
    },
    method = FORMATTING,
    filetypes = { "clj" },
    generator_opts = {
        command = "cljfmt",
    },
    factory = h.formatter_factory,
})

local sources = {

  -- webdev stuff
  b.formatting.prettier,

  -- Lua
  b.formatting.stylua,

  -- Python
  b.formatting.black,

  -- Shell
  b.formatting.shfmt,
  b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

  -- cpp
  b.formatting.clang_format,
  b.formatting.rustfmt,

  -- clojure
  cljfmt,
  --b.formatting.cljstyle,
  --b.diagnostics.clj_kondo,
}

null_ls.setup {
  on_attach = function(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
      -- format on save
      vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting_sync()")
    end

    --if client.server_capabilities.documentRangeFormattingProvider then
    --  vim.cmd("xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.range_formatting({})<CR>")
    --end
  end,
  debug = true,
  sources = sources,
}
