return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require('lspconfig')

    local on_attach = function(client, bufnr)
      -- LSP のキーマッピングを設定
      local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
      local opts = { noremap=true, silent=true }

      -- ドキュメント表示用のキーマッピング
      buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
      buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
      buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
      buf_set_keymap('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
      buf_set_keymap('n', '<C-k>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
      buf_set_keymap('n', '<space>wa', '<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
      buf_set_keymap('n', '<space>wr', '<Cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
      buf_set_keymap('n', '<space>wl', '<Cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
      buf_set_keymap('n', '<space>D', '<Cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
      buf_set_keymap('n', '<space>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
      buf_set_keymap('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
      buf_set_keymap('n', '<space>e', '<Cmd>lua vim.diagnostic.open_float()<CR>', opts)
      buf_set_keymap('n', '[d', '<Cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
      buf_set_keymap('n', ']d', '<Cmd>lua vim.diagnostic.goto_next()<CR>', opts)
      buf_set_keymap('n', '<space>q', '<Cmd>lua vim.diagnostic.setloclist()<CR>', opts)
      buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", opts)
    end

    local current_directory = vim.loop.cwd()
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    lspconfig.tsserver.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      init_options = {
        plugins = {
          {
            name = '@vue/typescript-plugin',
            location = current_directory .. '/node_modules/@vue/language-server',
            languages = { 'vue' },
          },
        },
      },
      flags = {
        debounce_text_changes = 150,
      },
    })

    lspconfig.volar.setup({
      cmd = { current_directory .. '/node_modules/@vue/language-server/bin/vue-language-server.js', '--stdio' },
      on_attach = on_attach,
      capabilities = capabilities,
      init_options = {
        vue = {
          hybridMode = false,
        },
      },
      flags = {
        debounce_text_changes = 150,
      },
    })

    lspconfig.pyright.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      flags = {
        debounce_text_changes = 150,
      },
    })

    lspconfig.ruby_lsp.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      flags = {
        debounce_text_changes = 150,
      },
    })
  end
}

