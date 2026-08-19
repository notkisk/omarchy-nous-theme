-- Nous Research — LazyVim theme and optional Kitty artwork layer.
return {
  {
    dir = "~/.local/state/omarchy/current/theme",
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
  {
    "3rd/image.nvim",
    build = false,
    opts = {
      backend = "kitty",
      processor = "magick_cli",
      kitty_method = "normal",
      editor_only_render_when_focused = true,
      window_overlap_clear_enabled = true,
      window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "snacks_notif", "scrollview", "scrollview_sign" },
      integrations = {
        markdown = { enabled = false },
        asciidoc = { enabled = false },
        typst = { enabled = false },
        neorg = { enabled = false },
        syslang = { enabled = false },
        html = { enabled = false },
        css = { enabled = false },
        org = { enabled = false },
      },
      hijack_file_patterns = {},
    },
    config = function(_, opts)
      require("image").setup(opts)
      require("nous.image").setup()
    end,
  },
}
