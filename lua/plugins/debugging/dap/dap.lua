return {
    "mfussenegger/nvim-dap",
    keys = {
        "<leader>b",
        "<F5>",
        "<F10>",
        "<F12>",
        "<S-F12>",
        "<S-F5>",
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
    config = function(_, _)
        require("core.utils").load_mappings("dap")
    end
}
