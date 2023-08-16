vim.opt.backspace:append { "nostop" } -- don't stop backspace at insert

local opt = vim.opt
local g = vim.g
local config = require("core.utils").get_config()


--- Identation
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

g.mapleader = " "