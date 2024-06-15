vim.cmd('command! MyCopyRelativePath let @+ = fnamemodify(expand("%"), ":.")')
vim.keymap.set('n', '<leader>p', '<cmd>MyCopyRelativePath<CR>', { noremap = true })
vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', { noremap = true })
vim.keymap.set('n', '<leader>f', '<cmd>Telescope find_files<CR>', { noremap = true })
vim.keymap.set('n', '<leader>g', require('telescope.builtin').live_grep, { noremap = true })

