-- Nous Research — Neovim color scheme.
-- Void black background, near-white text, electric cobalt accents.
-- Matches the Nous Research manga/HUD aesthetic.
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
        functions = {},
        variables = {},
        sidebars = "dark",
        floats = "dark",
      },
      -- Override palette to match Nous Research exactly
      on_colors = function(colors)
        colors.bg         = "#010109"
        colors.bg_dark    = "#010109"
        colors.bg_float   = "#010109"
        colors.bg_popup   = "#010288"
        colors.bg_sidebar = "#010288"
        colors.bg_statusline = "#010109"
        colors.bg_highlight  = "#010288"
        colors.bg_visual     = "#010288"

        colors.fg       = "#F6F7FF"
        colors.fg_dark  = "#C2C2FC"
        colors.fg_gutter = "#6F70FA"
        colors.comment  = "#6F70FA"

        colors.blue   = "#0305F6"
        colors.blue1  = "#3032D4"
        colors.blue2  = "#6F70FA"
        colors.blue5  = "#C2C2FC"
        colors.blue6  = "#C2C2FC"
        colors.blue7  = "#010288"

        colors.cyan   = "#4C9CB2"
        colors.teal   = "#4F9B8C"
        colors.green  = "#4F9B8C"
        colors.green1 = "#66B5A5"
        colors.green2 = "#4F9B8C"

        colors.red    = "#C75E6A"
        colors.red1   = "#E57984"

        colors.yellow  = "#C28A39"
        colors.orange  = "#DFAC5B"

        colors.magenta  = "#6F70FA"
        colors.purple   = "#C2C2FC"

        colors.border         = "#010288"
        colors.border_highlight = "#0305F6"

        colors.selection = "#010288"
      end,
      on_highlights = function(hl, colors)
        hl.Normal          = { fg = "#F6F7FF", bg = "#010109" }
        hl.NormalFloat     = { fg = "#F6F7FF", bg = "#010288" }
        hl.NormalNC        = { fg = "#C2C2FC", bg = "#010109" }

        -- Keywords, types — cobalt blue family
        hl.Keyword         = { fg = "#6F70FA", bold = false }
        hl.Statement       = { fg = "#6F70FA" }
        hl.Conditional     = { fg = "#6F70FA" }
        hl.Repeat          = { fg = "#6F70FA" }
        hl.Function        = { fg = "#F6F7FF", bold = true }
        hl["@function"]    = { fg = "#F6F7FF", bold = true }
        hl["@function.call"] = { fg = "#F6F7FF" }
        hl.Type            = { fg = "#C2C2FC" }
        hl["@type"]        = { fg = "#C2C2FC" }
        hl["@type.builtin"] = { fg = "#C2C2FC" }

        -- Strings — soft lavender
        hl.String          = { fg = "#C2C2FC" }
        hl["@string"]      = { fg = "#C2C2FC" }

        -- Numbers, booleans
        hl.Number          = { fg = "#6F70FA" }
        hl.Boolean         = { fg = "#6F70FA" }
        hl["@number"]      = { fg = "#6F70FA" }
        hl["@boolean"]     = { fg = "#6F70FA" }

        -- Constants — bright cobalt
        hl.Constant        = { fg = "#C2C2FC" }
        hl["@constant"]    = { fg = "#C2C2FC" }

        -- Variables
        hl.Identifier      = { fg = "#F6F7FF" }
        hl["@variable"]    = { fg = "#F6F7FF" }
        hl["@parameter"]   = { fg = "#F6F7FF" }
        hl["@property"]    = { fg = "#C2C2FC" }
        hl["@field"]       = { fg = "#C2C2FC" }

        -- Comments — muted cobalt
        hl.Comment         = { fg = "#6F70FA", italic = false }
        hl["@comment"]     = { fg = "#6F70FA" }

        -- Operators, punctuation
        hl.Operator        = { fg = "#F6F7FF" }
        hl["@operator"]    = { fg = "#F6F7FF" }
        hl["@punctuation"] = { fg = "#C2C2FC" }

        -- Line numbers
        hl.LineNr          = { fg = "#010288" }
        hl.CursorLineNr    = { fg = "#0305F6", bold = true }
        hl.CursorLine      = { bg = "#010288" }

        -- Visual selection
        hl.Visual          = { bg = "#010288" }

        -- Search
        hl.Search          = { fg = "#F6F7FF", bg = "#0305F6" }
        hl.IncSearch       = { fg = "#010109", bg = "#C2C2FC", bold = true }

        -- Status line
        hl.StatusLine      = { fg = "#C2C2FC", bg = "#010109" }
        hl.StatusLineNC    = { fg = "#6F70FA", bg = "#010109" }

        -- Pmenu (autocomplete)
        hl.Pmenu           = { fg = "#F6F7FF", bg = "#010288" }
        hl.PmenuSel        = { fg = "#F6F7FF", bg = "#0305F6" }
        hl.PmenuSbar       = { bg = "#010288" }
        hl.PmenuThumb      = { bg = "#0305F6" }

        -- Borders and splits
        hl.WinSeparator    = { fg = "#010288" }
        hl.FloatBorder     = { fg = "#0305F6", bg = "#010288" }

        -- Telescope
        hl.TelescopeBorder         = { fg = "#010288", bg = "#010109" }
        hl.TelescopeNormal         = { fg = "#F6F7FF", bg = "#010109" }
        hl.TelescopeSelection      = { fg = "#F6F7FF", bg = "#010288" }
        hl.TelescopeSelectionCaret = { fg = "#0305F6" }
        hl.TelescopeMatching       = { fg = "#0305F6", bold = true }
        hl.TelescopePromptBorder   = { fg = "#0305F6" }
        hl.TelescopePromptTitle    = { fg = "#F6F7FF", bold = true }

        -- Git signs
        hl.GitSignsAdd    = { fg = "#4F9B8C" }
        hl.GitSignsChange = { fg = "#0305F6" }
        hl.GitSignsDelete = { fg = "#C75E6A" }

        -- Diagnostics
        hl.DiagnosticError = { fg = "#C75E6A" }
        hl.DiagnosticWarn  = { fg = "#C28A39" }
        hl.DiagnosticInfo  = { fg = "#0305F6" }
        hl.DiagnosticHint  = { fg = "#C2C2FC" }
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-night",
    },
  },
}
