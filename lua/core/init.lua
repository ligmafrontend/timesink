local opt = vim.opt
local g = vim.g

g.mapleader = " "

--- Identation
opt.backspace:append { "nostop" }
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

opt.colorcolumn = "120"
opt.relativenumber = true

opt.clipboard = "unnamedplus"
