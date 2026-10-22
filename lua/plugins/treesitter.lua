return  {
  "nvim-treesitter/nvim-treesitter",
  -- The default branch is now "main", a rewrite without nvim-treesitter.configs
  -- that needs Neovim 0.12. This config uses the frozen "master" branch.
  branch = "master",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = {
        "lua",
        "javascript",
        "rust",
        "go",
        "python"
      },
      auto_install = true,
      highlight = {enable = true},
      indent = {enable = true},
    }
  )
  end
}

