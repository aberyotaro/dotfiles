-- リーダーキーをスペース設定
vim.g.mapleader = " "

-- lazy.nvim のパスを定義し、存在しなければクローン
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

-- lazy.nvim 設定
local opts = {}
require("lazy").setup({
	{ import = "plugins" },
}, opts)
require("keymaps")
require("settings")
