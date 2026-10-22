return {
  "echasnovski/mini.icons",
  lazy = false,
  -- Before the plugins that look for nvim-web-devicons when they load (lualine,
  -- Telescope), after the colorscheme (1000).
  priority = 900,
  opts = {},
  config = function(_, opts)
    require("mini.icons").setup(opts)
    -- Answers as nvim-web-devicons, so every plugin uses the same icons.
    MiniIcons.mock_nvim_web_devicons()
  end,
}
