-- Nous Research — a standalone local colorscheme for LazyVim.
-- The theme lives in lua/nous and has no runtime plugin dependency.
return {
  {
    dir = "~/.config/omarchy/current/theme",
    name = "nous-research-theme",
    priority = 1000,
    lazy = false,
    config = function()
      vim.cmd.colorscheme("nous")
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "nous" },
  },
}
