local M = {}

M.dap = {
  plugin = true,
  n = {

    -- Common
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
    }

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

    ["<leader>ss"] = { "<cmd> SSSelected <CR>", "Take screenshot just of selected lines" },
    ["<leader>sc"] = { "<cmd> SSSFocused <CR>", "Take screenshot of file and highlight selected lines" },-- Take screenshot just of selected lines
  }
}

return M
