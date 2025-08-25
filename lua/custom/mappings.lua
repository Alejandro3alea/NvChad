local M = {}

M.dap = {
  plugin = true,
  n = {
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
  }
}

return M
