local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local none_ls = require('none-ls')

local opts = {
  sources = {
    -- Python
    none_ls.builtins.formatting.black.with({
      filetypes = { "python" },
    }),
    none_ls.builtins.diagnostics.mypy.with({
      extra_args = function(params)
        local venv_python = nil

        -- Try environment variables first
        local virtual_env = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX")
        if virtual_env then
          venv_python = virtual_env .. "/bin/python3"
        else
          -- Try .venv in project root
          local root = params.root or vim.fn.getcwd()
          local project_venv = root .. "/venv/bin/python3"
          local project_dot_venv = root .. "/.venv/bin/python3"
          if vim.fn.filereadable(project_venv) == 1 then
            venv_python = project_venv
          elseif vim.fn.filereadable(project_dot_venv) == 1 then
            venv_python = project_dot_venv
          else
            -- Fallback to system python
            venv_python = vim.fn.exepath("python3")
          end
        end

        return { "--python-executable", venv_python }
      end,
    }),

    -- C++
    none_ls.builtins.formatting.clang_format.with({
      filetypes = { "cpp", "c" },
    }),
  },
  on_attach = function(client, bufnr)
    if client:supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr,
      })
      -- vim.api.nvim_create_autocmd("BufWritePre", {
      --   group = augroup,
      --   buffer = bufnr,
      --   callback = function()
      --     vim.lsp.buf.format({ bufnr = bufnr })
      --   end,
      -- })
    end
  end,
}
return opts
