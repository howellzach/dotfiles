vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Lazy bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Vim settings
require("howellzach.remap")
require("howellzach.set")
require("howellzach.numbertoggle")

-- Plugin settings
require('lazy').setup('plugins')
-- require("howellzach.alpha")
