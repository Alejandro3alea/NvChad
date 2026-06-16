local config = require("plugins.configs.lspconfig")

local on_attach = config.on_attach
local capabilities = config.capabilities

vim.lsp.config('*', {
    on_attach = on_attach,
    capabilities = capabilities,
    root_markers = { '.git' },
})

vim.lsp.config("pyright", {
    filetypes = { "py" },
    settings = {
        python = {
            analysis = {
                extraPaths = { "./" }, -- or use full path like "/home/user/myproject"
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
            },
        },
    },
})

vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "✗",
            [vim.diagnostic.severity.WARN] = "⚠",
            [vim.diagnostic.severity.HINT] = "➜",
            [vim.diagnostic.severity.INFO] = "ℹ",
        },
    },
})
