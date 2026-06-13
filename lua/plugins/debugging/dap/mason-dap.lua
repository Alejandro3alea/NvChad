return {
    "jay-babu/mason-nvim-dap.nvim",
    keys = {
        "<leader>b",
        "<F5>",
    },
    cmd = {
        "DapClearBreakpoints",
        "DapClearBreakpoints",
        "DapContinue",
        "DapDisconnect",
        "DapEval",
        "DapInstall",
        "DapNew",
        "DapPause",
        "DapRestartFrame",
        "DapSetLogLevel",
        "DapShowLog",
        "DapStepInto",
        "DapStepOut",
        "DapStepOver",
        "DapTerminate",
        "DapToggleBreakpoint",
        "DapToggleRepl",
        "DapUninstall"
    },
    dependencies = {
        "willamboman/mason.nvim",
        "mfussenegger/nvim-dap"
    },
    opts = {
        handlers = {},
    }
}
