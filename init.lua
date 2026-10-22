local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
 local out = vim.fn.system({
  "git",
  "clone",
  "--filter=blob:none",
  "https://github.com/folke/lazy.nvim.git",
  "--branch=stable", -- latest stable release
  lazypath,
 })
 if vim.v.shell_error ~= 0 then
  vim.api.nvim_echo({
   { "Couldn't clone lazy.nvim, so starting without plugins:\n", "ErrorMsg" },
   { out, "WarningMsg" },
  }, true, {})
 end
end
vim.opt.rtp:prepend(lazypath)

require("vim-options")
-- Without lazy.nvim (no network on the very first start) Neovim still opens,
-- as a plain editor, so a file can be fixed even then.
if (vim.uv or vim.loop).fs_stat(lazypath) then
 require("lazy").setup("plugins")
end
