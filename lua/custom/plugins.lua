local plugins = {
  -- C++
  {
    "nvim-neotest/nvim-nio"
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function ()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function ()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function ()
        dapui.close()
      end
    end
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "willamboman/mason.nvim",
      "mfussenegger/nvim-dap"
    },
    opts = {
      handlers = {},
    }
  },
  {
    "mfussenegger/nvim-dap",
    config = function (_, _)
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "aznhe21/actions-preview.nvim",
    event = "LspAttach",
    config = function()
      require("actions-preview").setup {
        diff = {
          algorithm = "patience",
          ignore_whitespace = true,
        },
      }

    -- Keymap to trigger code actions
      vim.keymap.set({ "n", "v" }, "<leader>gf", require("actions-preview").code_actions)
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    ft = {"python", "c", "cpp"},
    opts = function()
      return require "custom.configs.none_ls"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- python
        "black",
        "mypy",
        "ruff",
        "pyright",

        -- cpp
        "clangd",
        "clang-format",
        "codelldb",

        -- lua
        "lua-language-server",

        -- html
        "html-lsp",
        "htmlhint",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require("plugins.configs.lspconfig")
      require("custom.configs.lspconfig")
    end,
  },
  {
    "Mofiqul/vscode.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("vscode").setup({
        -- Optionally enable transparent background    
        transparent = false,
      })
      vim.cmd.colorscheme("vscode")
    end,
  },

  -- git
  {
    "NeogitOrg/neogit",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "sindrets/diffview.nvim",        -- optional - Diff integration

      -- Only one of these is needed.
      "nvim-telescope/telescope.nvim", -- optional
    },
    config = function ()
      require("neogit").setup({
        -- config
      })
    end,
  },

  -- Code snapshots
  {
    "niuiic/code-shot.nvim",
    lazy = false,
    dependencies = {
      "Aloxaf/silicon",
      "niuiic/omega.nvim", -- required dependency
    },
  },
}
return plugins
