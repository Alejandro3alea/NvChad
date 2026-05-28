dofile(vim.g.base46_cache .. "lsp")
require "nvchad.lsp"

local M = {}
local utils = require "core.utils"

-- export on_attach & capabilities for custom lspconfigs
M.on_attach = function(client, bufnr)
  utils.load_mappings("lspconfig", { buffer = bufnr })

  if client.server_capabilities.signatureHelpProvider then
    require("nvchad.signature").setup(client)
  end
end

-- disable semantic tokens
M.on_init = function(client, _)
  if not utils.load_config().ui.lsp_semantic_tokens and client:supports_method "textDocument/semanticTokens" then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

------------------------------------------
--  LSP config
------------------------------------------

-- C++
vim.api.nvim_create_autocmd("FileType", {
      pattern = { "c", "cpp", "objc", "objcpp" },
      callback = function()
        vim.lsp.start({
          name = "clangd",
          cmd = { "clangd" },
          root_dir = vim.fs.dirname(vim.fs.find({ "compile_commands.json", ".clangd", ".clang-format", ".git" }, { upward = true })[1]),
          capabilities = M.capabilities,
          on_attach = M.on_attach,
          on_init = M.on_init,
        })
      end,
})


-- Rust
vim.api.nvim_create_autocmd("FileType", {
      pattern = "rust",
      callback = function()
        vim.lsp.start({
          name = "rust_analyzer",
          cmd = { "rust-analyzer" },
          root_dir = vim.fs.dirname(vim.fs.find({ "Cargo.toml", ".git" }, { upward = true })[1]),
          capabilities = M.capabilities,
          on_attach = M.on_attach,
          on_init = M.on_init,
        })
      end,
})


-- Python
vim.api.nvim_create_autocmd("FileType", {
      pattern = "python",
      callback = function()
        vim.lsp.start({
          name = "pyright",
          cmd = { "pyright-langserver", "--stdio" },
          root_dir = vim.fs.dirname(vim.fs.find({ "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git" }, { upward = true })[1]),
          capabilities = M.capabilities,
          on_attach = M.on_attach,
          on_init = M.on_init,
          settings = {
            python = {
              analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "openFilesOnly",
                extraPaths = { "./" },
              },
            },
          },
        })
      end,
})


-- Lua
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.lsp.start({
      name = "lua_ls",
      cmd = { "lua-language-server" },
      root_dir = vim.fs.dirname(vim.fs.find({ ".git", ".luarc.json", ".luarc.jsonc" }, { upward = true })[1]),
      capabilities = M.capabilities,
      on_attach = M.on_attach,
      on_init = M.on_init,

      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = {
              [vim.fn.expand "$VIMRUNTIME/lua"] = true,
              [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
              [vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types"] = true,
              [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
            },
            maxPreload = 100000,
            preloadFileSize = 10000,
          },
        },
      },
    })
  end,
})


-- HTML
vim.api.nvim_create_autocmd("FileType", {
      pattern = "html",
      callback = function()
        vim.lsp.start({
          name = "html",
          cmd = { "vscode-html-language-server", "--stdio" },
          root_dir = vim.fs.dirname(vim.fs.find({ "package.json", ".git" }, { upward = true })[1]),
          capabilities = M.capabilities,
          on_attach = M.on_attach,
          on_init = M.on_init,
          init_options = {
            configurationSection = { "html", "css", "javascript" },
            embeddedLanguages = { css = true, javascript = true },
            provideFormatter = true,
          },
        })
      end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
      callback = function()
            vim.lsp.buf.format()
          end,
})

return M
