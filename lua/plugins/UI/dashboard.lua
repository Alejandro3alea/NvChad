return {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
        local function random_header()
            local headers_dir = vim.fn.expand("~/.config/nvim/headers/")
            local files = vim.fn.globpath(headers_dir, "*", false, true)
            if #files == 0 then return nil end
            math.randomseed(os.time())
            return files[math.random(#files)]
        end
        local header = random_header()

        require("dashboard").setup({
            theme = "doom",
            config = {
                header = {},
                week_header = { enable = false },
                center = {
                    -- { action = "enew", icon = " ", desc = "New file", key = "e", icon_hl = "DashboardIcon", desc_hl = "DashboardDesc", key_hl = "DashboardKey" },
                    { action = "Telescope find_files", icon = "󰮗 ", desc = "Find file", key = "f", icon_hl = "DashboardIcon", desc_hl = "DashboardDesc", key_hl = "DashboardKey" },
                    { action = "Telescope oldfiles", icon = " ", desc = "Recent files", key = "r", icon_hl = "DashboardIcon", desc_hl = "DashboardDesc", key_hl = "DashboardKey" },
                    { action = "Telescope live_grep", icon = " ", desc = "Find word", key = "w", icon_hl = "DashboardIcon", desc_hl = "DashboardDesc", key_hl = "DashboardKey" },
                    { action = "Leet", icon = " ", desc = "Leetcode", key = "l", icon_hl = "DashboardIcon", desc_hl = "DashboardDesc", key_hl = "DashboardKey" },
                    { action = "LazyGit", icon = " ", desc = "Git", key = "g", icon_hl = "DashboardIcon", desc_hl = "DashboardDesc", key_hl = "DashboardKey" },
                    { action = "Lazy", icon = "󰒲 ", desc = "Lazy", key = "z", icon_hl = "DashboardIcon", desc_hl = "DashboardDesc", key_hl = "DashboardKey" },
                    { action = "qa", icon = "󰩈 ", desc = "Quit", key = "q", icon_hl = "DashboardIcon", desc_hl = "DashboardDesc", key_hl = "DashboardKey" }
                },
                footer = function()
                    local stats = require("lazy").stats()
                    return { "⚡ " .. stats.count .. " plugins loaded in " .. stats.startuptime .. "ms" }
                end,
            },
            hide = { statusline = true, tabline = true },
            preview = {
                command = "chafa --format symbols --symbols vhalf --size 60x20 --stretch --colors full " .. header,
                file_path = header,
                file_height = 20,
                file_width = 60,
            },
        })

        -- Highlight overrides for a nicer look
        vim.api.nvim_set_hl(0, "DashboardIcon", { fg = "#7aa2f7" })
        vim.api.nvim_set_hl(0, "DashboardDesc", { fg = "#c0caf5" })
        vim.api.nvim_set_hl(0, "DashboardKey", { fg = "#f7768e", bold = true })

        vim.api.nvim_create_autocmd("FileType", {
            pattern = "dashboard",
            callback = function()
                local ok, tree = pcall(require, "nvim-tree.api")
                if ok then tree.tree.close() end
            end,
        })
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
}
