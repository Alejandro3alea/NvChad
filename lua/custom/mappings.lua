local M = {}

M.dap = {
    plugin = true,
    n = {

        -- Movement
        ["<PageUp>"] = {
            "<C-u>zz",
            "Page Up + center cursor",
            opts = { noremap = true, silent = true },
        },
        ["<PageDown>"] = {
            "<C-d>zz",
            "Page Down + center cursor",
            opts = { noremap = true, silent = true },
        },
        ["<C-u>"] = {
            "<C-u>zz",
            "Page Up + center cursor",
            opts = { noremap = true, silent = true },
        },
        ["<C-d>"] = {
            "<C-d>zz",
            "Page Down + center cursor",
            opts = { noremap = true, silent = true },
        },
        ["<gb>"] = {
            "<C-o>zz",
            "Go back to previous cursor position",
            opts = { noremap = true, silent = true },
        },
        ["<C-a>"] = {
            "ggVG",
            "Select all",
            opts = { noremap = true, silent = true },
        },

        -- Dap
        ["<leader>b"] = {
            "<cmd> DapToggleBreakpoint <CR>",
            "Add breakpoint at line",
        },
        --["<leader>B"] = {
        --  function()
        --    dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
        --  end,
        --  "Add breakpoint at line",
        --},
        ["<F5>"] = {
            "<cmd> DapContinue <CR>",
            "Debugger: Start or Continue",
        },
        ["<F10>"] = {
            "<cmd> DapStepOver <CR>",
            "Debugger: Step Over",
        },
        ["<F12>"] = {
            "<cmd> DapStepInto <CR>",
            "Debugger: Step Into",
        },
        ["<S-<F12>>"] = {
            "<cmd> DapStepOut <CR>",
            "Debugger: Step Out",
        },
        ["<S-<F5>>"] = {
            "<cmd> DapTerminate <CR>",
            "Debugger: Stop",
        },


        -- CMake
        ["<leader>cg"] = {
            "<cmd> CMakeGenerate <CR>",
            "Generate project with CMake."
        },
        ["<leader>cb"] = {
            "<cmd> CMakeBuild <CR>",
            "Build project with CMake."
        }

        -- Other
    },
    v = {
        ["'"] = { "c'<C-r>\"'<ESC>", "Wrap selected text with single quotes" },
        ["\""] = { "c\"<C-r>\"\"<ESC>", "Wrap selected text with double quotes" },
        ["("] = { "c(<C-r>\")<ESC>", "Wrap selected text with parentheses" },
        [")"] = { "c(<C-r>\")<ESC>", "Wrap selected text with parentheses" },
        ["["] = { "c[<C-r>\"]<ESC>", "Wrap selected text with square brackets" },
        ["]"] = { "c[<C-r>\"]<ESC>", "Wrap selected text with square brackets" },
        ["{"] = { "c{<C-r>\"}<ESC>", "Wrap selected text with curly braces" },
        ["}"] = { "c{<C-r>\"}<ESC>", "Wrap selected text with curly braces" },
        ["<leader><"] = { "c<<C-r>\"><ESC>", "Wrap selected text with angle brackets" },
        ["<leader>>"] = { "c<<C-r>\"><ESC>", "Wrap selected text with angle brackets" },

        ["<leader>sc"] = { "<cmd> SSSelected <CR>", "Take screenshot just of selected lines" },
        ["<leader>ss"] = { "<cmd> SSSFocused <CR>", "Take screenshot of file and highlight selected lines" }, -- Take screenshot just of selected lines
    }
}

return M
