require "core"

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
  dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)
require "plugins"

-- Rainbow Delimiters
local rainbow_delimiters = require 'rainbow-delimiters'

---@type rainbow_delimiters.config
vim.g.rainbow_delimiters = {
    strategy = {
        [''] = rainbow_delimiters.strategy['global'],
        vim = rainbow_delimiters.strategy['local'],
    },
    query = {
        [''] = 'rainbow-delimiters',
        lua = 'rainbow-blocks',
    },
    priority = {
        [''] = 110,
        lua = 210,
    },
    highlight = {
        'RainbowDelimiterYellow',
        'RainbowDelimiterViolet',
        'RainbowDelimiterBlue',
        'RainbowDelimiterYellow',
        'RainbowDelimiterViolet',
        'RainbowDelimiterBlue',
        'RainbowDelimiterRed',
    },
}

-- VSCode Dark+ rainbow delimiter colors
vim.cmd("highlight RainbowDelimiterYellow  guifg=#ffc912 ctermfg=White")
vim.cmd("highlight RainbowDelimiterViolet  guifg=#d26ad6 ctermfg=White")
vim.cmd("highlight RainbowDelimiterBlue  guifg=#179efe ctermfg=White")
