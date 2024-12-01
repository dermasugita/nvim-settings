require('utils')
require('lint').linters_by_ft = {
  markdown = {'markdownlint'},
  typescript = {'biomejs'},
  javascript = {'biomejs'},
  typescriptreact = {'biomejs'},
  json = {'biomejs'},
}
local util = require("formatter.util")
require("formatter").setup({
  logging = true,
  log_level = vim.log.levels.WARN,
  filetype = {
    javascript = {require("formatter.filetypes.javascript").biome},
    javascriptreact = {require("formatter.filetypes.javascriptreact").biome},
    typescript = {require("formatter.filetypes.typescript").biome},
    typescriptreact = {require("formatter.filetypes.typescriptreact").biome},
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
