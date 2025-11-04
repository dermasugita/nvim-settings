require('utils')
local bjs = require('lint').linters.biomejs
local bjsfn = function()
  local filePath = vim.api.nvim_buf_get_name(0)
  local nodeRoot = find_biome_root(filePath)
  vim.cmd("cd " .. nodeRoot)
  local binary_name = "biome"
  local local_binary = vim.fn.fnamemodify('./node_modules/.bin/' .. binary_name, ':p')
  local command = vim.loop.fs_stat(local_binary) and local_binary or binary_name
  return command
end
bjs.cmd = bjsfn
require('lint').linters_by_ft = {
  markdown = {'markdownlint'},
  typescript = {'biomejs'},
  javascript = {'biomejs'},
  typescriptreact = {'biomejs'},
  json = {'biomejs'},
}
local util = require("formatter.util")
local biomeFormatter = function()
  local util = require("formatter.util")
  local filePath = util.get_current_buffer_file_path()
  local nodeRoot = find_biome_root(filePath)
  vim.cmd("cd " .. nodeRoot)
  return {
    exe = "npx biome format --config-path " .. nodeRoot .. " --stdin-file-path " .. filePath,
    stdin = true,
  }
end
require("formatter").setup({
  logging = true,
  log_level = vim.log.levels.WARN,
  filetype = {
    javascript = {require("formatter.filetypes.javascript").biome},
    javascriptreact = {require("formatter.filetypes.javascriptreact").biome},
    typescript = {
      biomeFormatter,
    },
    typescriptreact = {biomeFormatter},
    markdown = {
      function ()
	local filePath = util.get_current_buffer_file_path()
	local cwd = vim.fn.getcwd()
	local outTmpPath = cwd .. "/" .. uuid() .. ".md"
	copyFile(filePath, outTmpPath)
	os.execute("markdownlint --fix " .. outTmpPath)
	return {
	  --exe = "tmpStr=$(cat " .. outTmpPath .. ") && rm " .. outTmpPath .. " && echo $tmpStr",
	  exe = "cat " .. outTmpPath .. " && rm " .. outTmpPath,
	  stdin = true,
	}
      end
    },
  },
})
--vim.api.nvim_create_augroup(
--  "__formatter__",
--  {clear = true}
--)
vim.api.nvim_create_autocmd(
  "BufWritePost", {
  --group = "__formatter__",
  callback = function()
    vim.cmd("FormatWrite")
    --require("lint").try_lint()
  end
})

vim.api.nvim_create_autocmd(
  "BufWritePost", {
  callback = function()
    require("lint").try_lint()
  end
})
