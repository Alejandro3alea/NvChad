---@type ChadrcConfig
local M = {}

M.ui = { theme = 'vscodedarkplus' }
M.plugins = "custom.plugins"
M.mappings = require("custom.mappings")

M.base46 = {
	theme = "vscodedarkplus",

	hl_override = {
   	Comment = { italic = true },
	 	["@comment"] = { italic = true },
	},
}

return M
