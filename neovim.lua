-- Nous Research — Neovim. Electric blue background, white text.
-- Pure #0000F2 ground, white fg, lighter blues for syntax.
return {
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    priority = 1000,
    opts = {
      style = "night",
      transparent = false,
      terminal_colors = true,
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
      },
      on_colors = function(colors)
        colors.bg            = "#0000F2"
        colors.bg_dark       = "#0000CC"
        colors.bg_float      = "#0000F2"
        colors.bg_popup      = "#0000CC"
        colors.bg_sidebar    = "#0000CC"
        colors.bg_statusline = "#0000CC"
        colors.bg_highlight  = "#2222CC"
        colors.bg_visual     = "#2222CC"

        colors.fg        = "#FFFFFF"
        colors.fg_dark   = "#CCDDFF"
        colors.fg_gutter = "#8888FF"
        colors.comment   = "#6666FF"

        colors.blue   = "#FFFFFF"
        colors.blue1  = "#CCDDFF"
        colors.blue2  = "#AABBFF"
        colors.blue5  = "#8888FF"
        colors.blue6  = "#6666FF"
        colors.blue7  = "#2222CC"

        colors.cyan    = "#66CCFF"
        colors.teal    = "#44DDAA"
        colors.green   = "#44DDAA"
        colors.green1  = "#66FFCC"
        colors.green2  = "#44DDAA"

        colors.red     = "#FF4455"
        colors.red1    = "#FF6677"

        colors.yellow  = "#FFCC44"
        colors.orange  = "#FFDD66"

        colors.magenta = "#CC99FF"
        colors.purple  = "#AA88FF"

        colors.border           = "#2222CC"
        colors.border_highlight = "#FFFFFF"
      end,
      on_highlights = function(hl, c)
        hl.Normal         = { fg = "#FFFFFF", bg = "#0000F2" }
        hl.NormalFloat    = { fg = "#CCDDFF", bg = "#0000CC" }
        hl.NormalNC       = { fg = "#CCDDFF", bg = "#0000F2" }

        -- Keywords — bright white, bold
        hl.Keyword        = { fg = "#FFFFFF", bold = true }
        hl.Statement      = { fg = "#FFFFFF", bold = true }
        hl.Conditional    = { fg = "#FFFFFF", bold = true }
        hl.Repeat         = { fg = "#FFFFFF", bold = true }

        -- Functions — white
        hl.Function              = { fg = "#FFFFFF" }
        hl["@function"]          = { fg = "#FFFFFF" }
        hl["@function.call"]     = { fg = "#FFFFFF" }
        hl["@function.builtin"]  = { fg = "#CCDDFF" }

        -- Types — light blue
        hl.Type           = { fg = "#CCDDFF" }
        hl["@type"]       = { fg = "#CCDDFF" }
        hl["@type.builtin"] = { fg = "#AABBFF" }

        -- Strings — lighter blue
        hl.String         = { fg = "#AABBFF" }
        hl["@string"]     = { fg = "#AABBFF" }

        -- Numbers, booleans
        hl.Number         = { fg = "#66CCFF" }
        hl.Boolean        = { fg = "#66CCFF" }
        hl["@number"]     = { fg = "#66CCFF" }
        hl["@boolean"]    = { fg = "#66CCFF" }

        -- Constants
        hl.Constant       = { fg = "#CCDDFF" }
        hl["@constant"]   = { fg = "#CCDDFF" }

        -- Variables
        hl.Identifier       = { fg = "#FFFFFF" }
        hl["@variable"]     = { fg = "#FFFFFF" }
        hl["@parameter"]    = { fg = "#FFFFFF" }
        hl["@property"]     = { fg = "#AABBFF" }
        hl["@field"]        = { fg = "#AABBFF" }

        -- Comments — muted blue
        hl.Comment        = { fg = "#6666FF" }
        hl["@comment"]    = { fg = "#6666FF" }

        -- Operators
        hl.Operator       = { fg = "#FFFFFF" }
        hl["@operator"]   = { fg = "#FFFFFF" }
        hl["@punctuation"] = { fg = "#AABBFF" }

        -- Line numbers
        hl.LineNr         = { fg = "#2222CC" }
        hl.CursorLineNr   = { fg = "#FFFFFF", bold = true }
        hl.CursorLine     = { bg = "#2222CC" }

        -- Visual selection
        hl.Visual         = { bg = "#2222CC" }

        -- Search
        hl.Search         = { fg = "#0000F2", bg = "#FFFFFF" }
        hl.IncSearch      = { fg = "#0000F2", bg = "#FFCC44", bold = true }

        -- Status line
        hl.StatusLine     = { fg = "#CCDDFF", bg = "#0000CC" }
        hl.StatusLineNC   = { fg = "#6666FF",  bg = "#0000CC" }

        -- Pmenu
        hl.Pmenu          = { fg = "#FFFFFF",  bg = "#0000CC" }
        hl.PmenuSel       = { fg = "#0000F2",  bg = "#FFFFFF" }
        hl.PmenuSbar      = { bg = "#0000CC" }
        hl.PmenuThumb     = { bg = "#2222CC" }

        -- Borders
        hl.WinSeparator   = { fg = "#2222CC" }
        hl.FloatBorder    = { fg = "#FFFFFF",  bg = "#0000CC" }

        -- Telescope
        hl.TelescopeBorder         = { fg = "#2222CC",  bg = "#0000F2" }
        hl.TelescopeNormal         = { fg = "#FFFFFF",  bg = "#0000F2" }
        hl.TelescopeSelection      = { fg = "#0000F2",  bg = "#FFFFFF" }
        hl.TelescopeSelectionCaret = { fg = "#0000F2" }
        hl.TelescopeMatching       = { fg = "#FFCC44",  bold = true }
        hl.TelescopePromptBorder   = { fg = "#FFFFFF" }
        hl.TelescopePromptTitle    = { fg = "#FFFFFF",  bold = true }

        -- Git signs
        hl.GitSignsAdd    = { fg = "#44DDAA" }
        hl.GitSignsChange = { fg = "#AABBFF" }
        hl.GitSignsDelete = { fg = "#FF4455" }

        -- Diagnostics
        hl.DiagnosticError = { fg = "#FF4455" }
        hl.DiagnosticWarn  = { fg = "#FFCC44" }
        hl.DiagnosticInfo  = { fg = "#AABBFF" }
        hl.DiagnosticHint  = { fg = "#8888FF" }
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "tokyonight-night" },
  },
}
