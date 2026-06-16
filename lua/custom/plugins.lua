local plugins = {
    -- C++
    {
        "nvim-neotest/nvim-nio"
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
    -- {
    --     "nvimtools/none-ls.nvim",
    --     ft = { "python", "c", "cpp" },
    --     opts = function()
    --         return require "custom.configs.none_ls"
    --     end,
    -- },
    {
        "mason-org/mason.nvim",
        opts = {
        },
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        dependencies = { "mason-org/mason.nvim" },
        opts = {
            ensure_installed = {
                -- python
                "black", "mypy", "ruff", "pyright",
                -- cpp
                "clangd", "clang-format", "codelldb",
                -- rust
                "rust-analyzer",
                -- lua
                "lua-language-server",
                -- html
                "html-lsp", "htmlhint",
                -- JS/TS
                "eslint-lsp", "prettier", "typescript-language-server",
                -- css
                "stylelint",
                -- go
                "gofumpt", "golangci-lint", "gopls",
                -- json
                "json-lsp",
                -- yaml
                "yaml-language-server",
                -- bash
                "bash-language-server", "shellcheck", "shfmt",
                -- env/md
                "dotenv-linter", "marksman",
            },
            auto_update = false,
            run_on_start = true,
        },
    },
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        opts = {},
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
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
                transparent = true,
            })
            vim.cmd.colorscheme("vscode")
        end,
    },

    -- C++ / cmake
    require("plugins.cpp.cmake"),
    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        event = "LspAttach",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons",
        },
        opts = {},
    },

    {
        "j-hui/fidget.nvim",
        event = "LspAttach",
        opts = {},
    },

    -- JS/TS/HTML
    {
        "b0o/schemastore.nvim",
        ft = { "ts", "js", "javascript", "typescript", "javascriptreact", "typescriptreact" },
    },

    -- Debugging
    require("plugins.debugging.dap.dap"),
    require("plugins.debugging.dap.ui"),
    require("plugins.debugging.dap.mason-dap"),

    -- UI
    {
        "catgoose/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup({
                "*",
                css = { rgb_fn = true },
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = "nvim-treesitter/nvim-treesitter",
        event = "BufReadPost",
    },
    require("plugins.UI.noice"),
    require("plugins.UI.snacks"),

    -- UX
    -- require("plugins.UX.tabout"),
    -- {
    --     "ziontee113/icon-picker.nvim",
    --     lazy = false,
    --     config = function()
    --         require("icon-picker").setup({ disable_legacy_commands = true })
    --
    --         local opts = { noremap = true, silent = true }
    --
    --         vim.keymap.set("n", "<Leader>i", "<cmd>IconPickerNormal<cr>", opts)
    --         vim.keymap.set("n", "<Leader>y", "<cmd>IconPickerYank<cr>", opts) --> Yank the selected icon into register
    --         vim.keymap.set("i", "<C-i>", "<cmd>IconPickerInsert<cr>", opts)
    --     end
    -- },

    -- git
    require("plugins.utils.lazygit"),

    -- Code snapshots
    {
        "SergioRibera/codeshot.nvim",
        lazy = false,
        config = function()
            require("codeshot").setup({
                -- config
                use_current_theme = true,
                background = '#FFFFFF00',
                theme = 'catppuccin',
            })
            -- output = "CodeShot_${year}-${month}-${date}_${time}.png", -- Auto generate file name based on time (absolute or relative to cwd)
        end,
    },

    -- Leetcode
    {
        "kawre/leetcode.nvim",
        build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
        cmd = "Leet",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        opts = {
            lang = "cpp",
            plugins = {
                non_standalone = true,
            },
        },
    },

    -- DevContainers
    {
        'https://codeberg.org/esensar/nvim-dev-container',
        dependencies = 'nvim-treesitter/nvim-treesitter',
        -- @TODO - improve this loading config
        cmd = { "Devcontainer" },
        config = function()
            require("devcontainer").setup({
                -- mounts setup
                attach_mounts = {
                    neovim_config = { enabled = true, options = { "readonly" } },
                    neovim_data = { enabled = true, options = {} },
                },
                nvim_install_as_root = true,
            })
        end,
    },

    -- Notifications
    {
        "rcarriga/nvim-notify",
        config = function()
            vim.notify = require("notify")
        end
    },

    -- Fun
    {
        "ThePrimeagen/vim-be-good",
        cmd = "VimBeGood"
    }
}
return plugins
