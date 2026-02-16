require('mason').setup()
local ensure_installed = {'biome', 'ts_ls'}
require('mason-lspconfig').setup({
  automatic_installation = true,
  ensure_installed = ensure_installed
})

require('lspconfig').biome.setup({
  cmd = {"npx", "biome", "lsp-proxy"},
})

vim.lsp.config.ts_ls = {
  cmd = { 'typescript-language-server', '--stdio' },
  filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
  root_markers = { 'package.json', 'tsconfig.json', 'jsconfig.json' },
}



vim.lsp.enable(ensure_installed)
