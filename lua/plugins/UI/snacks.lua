return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = function()
        local function random_header()
            local headers_dir = vim.fn.expand("~/.config/nvim/headers/")
            local files = vim.fn.globpath(headers_dir, "*", false, true)
            if #files == 0 then return "" end
            math.randomseed(os.time())
            return files[math.random(#files)]
        end

        local function work_status()
            local day = tonumber(os.date("%u")) -- 1=Mon, 7=Sun
            local hour = tonumber(os.date("%H"))
            local min = tonumber(os.date("%M"))


            local header_start = "=============================================================\n       "
            local header_end = "\n=============================================================\n"

            local current_minutes = hour * 60 + min

            if day >= 1 and (day < 5 or (day == 5 and hour >= 18)) then
                -- weekday
                local end_of_cycle = 18 * 60 -- 18:00
                local remaining = end_of_cycle - current_minutes + (5 - day) * 24 * 60
                return header_start ..
                    string.format("⏰ Stuck in Time Loop — %dh %dm until escape.", math.floor(remaining / 60),
                        remaining % 60) ..
                    header_end
            else
                -- weekend
                local days_until_monday = 8 - day -- days remaining until Monday
                local minutes_until_monday = days_until_monday * 24 * 60 - current_minutes
                return string.format("🚬🗿 Escaped — %dh %dm until cycle reset", math.floor(minutes_until_monday / 60),
                    minutes_until_monday % 60)
            end
        end

        return {
            bigfile = { enabled = false },
            notifier = { enabled = false },
            quickfile = { enabled = false },
            statuscolumn = { enabled = false },
            words = { enabled = false },
            bufdelete = { enabled = false },
            git = { enabled = false },
            gitbrowse = { enabled = false },
            lazygit = { enabled = false },
            notify = { enabled = false },
            terminal = { enabled = false },
            toggle = { enabled = false },
            win = { enabled = false },
            zen = { enabled = false },
            indent = { enabled = false },
            input = { enabled = false },
            picker = { enabled = false },
            scope = { enabled = false },
            scroll = { enabled = false },
            dashboard = {
                enabled = true,
                preset = {
                    keys = {
                        { action = ":Telescope find_files", icon = "󰮗", desc = "Find file", key = "f" },
                        { action = ":Telescope oldfiles", icon = "", desc = "Recent files", key = "r" },
                        { icon = "", key = "w", desc = "Find word", action = "Telescope live_grep" },
                        { icon = "", key = "t", desc = "Find Text", action = ":Telescope live_grep" },
                        { icon = "", desc = "Leetcode", key = "l", action = ":Leet" },
                        { action = ":LazyGit", icon = "", desc = "Git", key = "g" },
                        { action = ":Lazy", icon = "󰒲", desc = "Lazy", key = "z" },
                        { action = ":qa", icon = "󰩈", desc = "Quit", key = "q" },
                    },
                    header = [[
       ▐ ▄ ▄▄▄ .       ▌ ▐·▪  • ▌ ▄ ·.
       •█▌▐█▀▄.▀· ▄█▀▄ ▪█·█▌██ ·██ ▐███▪
       ▐█▐▐▌▐▀▀▪▄▐█▌.▐▌▐█▐█•▐█·▐█ ▌▐▌▐█·
       ██▐█▌▐█▄▄▌▐█▌.▐▌ ███ ▐█▌██ ██▌▐█▌
       ▀▀ █▪ ▀▀▀  ▀█▄▀▪. ▀  ▀▀▀▀▀  █▪▀▀▀  ]]
                },
                sections = {
                    {
                        section = "header",
                        height = 20,
                        width = 90,
                        pane = 1,
                        padding = 1,
                        align = "left"
                    },
                    {
                        section = "terminal",
                        cmd = "chafa --format symbols --symbols vhalf --size 45x20 --stretch --colors full " ..
                            random_header(),
                        height = 20,
                        width = 45,
                        padding = 1,
                        align = "center",
                    },
                    {
                        pane = 2,
                        text = {
                            { work_status(), hl = "SnacksDashboardFooter" },
                        },
                        padding = 1,
                    },
                    {
                        pane = 2,
                        { section = "keys",                                                       gap = 1, padding = 1 },
                        { text = "-------------------------------------------------------------", gap = 1, padding = 1 },
                    },
                    { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
                    { section = "startup", align = "left" },
                },
            },
        }
    end,
}
