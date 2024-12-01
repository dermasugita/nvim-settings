require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = {
    'biome',
    'markdownlint',
  }
})

require('lspconfig').biome.setup({
  cmd = {"npx", "biome", "lsp-proxy"}
})
