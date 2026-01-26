require('config.lazy')
require('options')
require('keymaps')
require('utils')
require('masonConfig')
require('lintConfig')
require('highlight')
require('telescope')
require('completion')
require('vfiler/config').setup {
  options = {
    show_hidden_files = true
  }
}
