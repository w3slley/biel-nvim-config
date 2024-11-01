require('java').setup()

--Lsp-zero config
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({ buffer = bufnr })
  vim.keymap.set('n', 'gR', '<cmd>:lua vim.lsp.buf.rename()<CR>', { buffer = bufnr })
end)

--Mason
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { 'gopls', 'ts_ls', 'angularls', 'lua_ls', 'pylsp', 'jdtls' },
  handlers = {
    lsp_zero.default_setup,
  },
})

local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
    title = ""
  }
  vim.lsp.buf.execute_command(params)
end

require('lspconfig').jdtls.setup({})

require('lspconfig').angularls.setup({})

require('lspconfig').ts_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  commands = {
    OrganizeImports = {
      organize_imports,
      description = "Organize Imports"
    }
  }
}

vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  buffer = 0, -- if 0 doesn't work do vim.api.nvim_get_current_buf()
  command = "",
})
