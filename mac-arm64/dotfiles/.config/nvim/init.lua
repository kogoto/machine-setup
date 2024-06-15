vim.cmd('syntax enable')
vim.g.mapleader = ","

require('plugin_manager')
require('options')
require('keybindings')

vim.cmd('colorscheme tokyonight')
