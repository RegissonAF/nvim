vim.g.mapleader = " "

vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")


--Oil

vim.keymap.set("n", "<leader>pv", "<CMD>Oil<CR>", { desc = "Open parent directory" })


--Vim set

vim.cmd("set rnu")
vim.cmd("set nu")
vim.cmd("set expandtab")
vim.cmd("set smartindent")
