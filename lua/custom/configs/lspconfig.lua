local config = require("plugins.configs.lspconfig")

local on_attach = config.on_attach
local capabilities = config.capabilities

vim.lsp.config('*', {
    on_attach = on_attach,
    capabilities = capabilities,
    root_markers = { '.git' },
  })

vim.lsp.config("pyright", {
  filetypes = { "py", "python" },
  settings = {
    python = {
      analysis = {
        extraPaths = { "./" },  -- or use full path like "/home/user/myproject"
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
      },
    },
  },
})
