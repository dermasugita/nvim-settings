require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = {
    'biome',
  }
})

require('lspconfig').biome.setup({
  cmd = {"npx", "biome", "lsp-proxy"},
})


require('lspconfig').tsserver.setup({
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "npx", "typescript-language-server", "--stdio" }
})

