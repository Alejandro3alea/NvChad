return {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
        require("dashboard").setup({
            theme = "doom",
            config = {
                header = {},
                week_header = { enable = false },
                center = {
                    { action = "enew",                 icon = " ", desc = " New file",     key = "e" },
                    { action = "Telescope find_files", icon = " ", desc = " Find file",    key = "f" },
                    { action = "Telescope oldfiles",   icon = " ", desc = " Recent files", key = "r" },
                    { action = "Telescope live_grep",  icon = " ", desc = " Find word",    key = "g" },
                    { action = "qa",                   icon = " ", desc = " Quit",         key = "q" },
                },
                footer = {},
            },
            hide = { statusline = true, tabline = true },
            preview = {
                command =
                "chafa ~/.config/nvim/headers/polish_cow.gif --format symbols --symbols vhalf --size 60x20 --stretch",
                file_path = "~/.config/nvim/headers/polish_cow.gif",
                file_height = 20,
                file_width = 60,
            },
        })

        -- close nvim-tree when dashboard opens
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
