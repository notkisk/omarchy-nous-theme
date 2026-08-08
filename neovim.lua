-- Nous Research — Neovim color scheme.
-- High contrast cobalt: deep navy background, pure white text,
-- vivid signal blue accents. Matches the Nous Research terminal aesthetic.
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
      -- Override palette to match Field Notes exactly
      on_colors = function(colors)
        colors.bg         = "#060E1F"
        colors.bg_dark    = "#040A16"
        colors.bg_float   = "#060E1F"
        colors.bg_popup   = "#0C1A32"
        colors.bg_sidebar = "#0C1A32"
        colors.bg_statusline = "#060E1F"
        colors.bg_highlight  = "#0C1A32"
        colors.bg_visual     = "#1E3560"

        colors.fg       = "#FFFFFF"
        colors.fg_dark  = "#EAF0FF"
        colors.fg_gutter = "#526987"
        colors.comment  = "#526987"

        colors.blue   = "#2B5CE6"
        colors.blue1  = "#4A7AFF"
        colors.blue2  = "#6E98F5"
        colors.blue5  = "#AAB8F5"
        colors.blue6  = "#AAB8F5"
        colors.blue7  = "#1E3560"

        colors.cyan   = "#4C9CB2"
        colors.teal   = "#4F9B8C"
        colors.green  = "#4F9B8C"
        colors.green1 = "#66B5A5"
        colors.green2 = "#4F9B8C"

        colors.red    = "#C75E6A"
        colors.red1   = "#E57984"

        colors.yellow  = "#C28A39"
        colors.orange  = "#DFAC5B"

        colors.magenta  = "#8E7CD6"
        colors.purple   = "#8E7CD6"

        colors.border         = "#1E3560"
        colors.border_highlight = "#2B5CE6"

        -- Selection and search
        colors.selection = "#1E3560"
      end,
      on_highlights = function(hl, colors)
        -- Make text elements pure white / very bright for maximum contrast
        hl.Normal          = { fg = "#FFFFFF", bg = "#060E1F" }
        hl.NormalFloat     = { fg = "#EAF0FF", bg = "#0C1A32" }
        hl.NormalNC        = { fg = "#EAF0FF", bg = "#060E1F" }

        -- Keywords, types, functions — cobalt blue family
        hl.Keyword         = { fg = "#4A7AFF", bold = false }
        hl.Statement       = { fg = "#4A7AFF" }
        hl.Conditional     = { fg = "#4A7AFF" }
        hl.Repeat          = { fg = "#4A7AFF" }
        hl.Function        = { fg = "#FFFFFF", bold = true }
        hl["@function"]    = { fg = "#FFFFFF", bold = true }
        hl["@function.call"] = { fg = "#FFFFFF" }
        hl.Type            = { fg = "#6E98F5" }
        hl["@type"]        = { fg = "#6E98F5" }
        hl["@type.builtin"] = { fg = "#6E98F5" }

        -- Strings — periwinkle
        hl.String          = { fg = "#AAB8F5" }
        hl["@string"]      = { fg = "#AAB8F5" }

        -- Numbers, booleans — cyan
        hl.Number          = { fg = "#76C5D9" }
        hl.Boolean         = { fg = "#76C5D9" }
        hl["@number"]      = { fg = "#76C5D9" }
        hl["@boolean"]     = { fg = "#76C5D9" }

        -- Constants — bright blue
        hl.Constant        = { fg = "#6E98F5" }
        hl["@constant"]    = { fg = "#6E98F5" }

        -- Variables
        hl.Identifier      = { fg = "#EAF0FF" }
        hl["@variable"]    = { fg = "#EAF0FF" }
        hl["@parameter"]   = { fg = "#EAF0FF" }
        hl["@property"]    = { fg = "#AAB8F5" }
        hl["@field"]       = { fg = "#AAB8F5" }

        -- Comments — muted, clearly secondary
        hl.Comment         = { fg = "#526987", italic = false }
        hl["@comment"]     = { fg = "#526987" }

        -- Operators, punctuation
        hl.Operator        = { fg = "#FFFFFF" }
        hl["@operator"]    = { fg = "#FFFFFF" }
        hl["@punctuation"] = { fg = "#8FA0BD" }

        -- Line numbers
        hl.LineNr          = { fg = "#1E3560" }
        hl.CursorLineNr    = { fg = "#2B5CE6", bold = true }
        hl.CursorLine      = { bg = "#0C1A32" }

        -- Visual selection
        hl.Visual          = { bg = "#1E3560" }

        -- Search
        hl.Search          = { fg = "#FFFFFF", bg = "#2B5CE6" }
        hl.IncSearch       = { fg = "#060E1F", bg = "#AAB8F5", bold = true }

        -- Status line
        hl.StatusLine      = { fg = "#AAB8F5", bg = "#060E1F" }
        hl.StatusLineNC    = { fg = "#526987", bg = "#060E1F" }

        -- Pmenu (autocomplete)
        hl.Pmenu           = { fg = "#EAF0FF", bg = "#0C1A32" }
        hl.PmenuSel        = { fg = "#FFFFFF", bg = "#2B5CE6" }
        hl.PmenuSbar       = { bg = "#0C1A32" }
        hl.PmenuThumb      = { bg = "#1E3560" }

        -- Borders and splits
        hl.WinSeparator    = { fg = "#1E3560" }
        hl.FloatBorder     = { fg = "#2B5CE6", bg = "#0C1A32" }
        hl.NormalFloat     = { bg = "#0C1A32" }

        -- Telescope
        hl.TelescopeBorder         = { fg = "#1E3560", bg = "#060E1F" }
        hl.TelescopeNormal         = { fg = "#EAF0FF", bg = "#060E1F" }
        hl.TelescopeSelection      = { fg = "#FFFFFF", bg = "#1E3560" }
        hl.TelescopeSelectionCaret = { fg = "#2B5CE6" }
        hl.TelescopeMatching       = { fg = "#2B5CE6", bold = true }
        hl.TelescopePromptBorder   = { fg = "#2B5CE6" }
        hl.TelescopePromptTitle    = { fg = "#FFFFFF", bold = true }

        -- Git signs
        hl.GitSignsAdd    = { fg = "#4F9B8C" }
        hl.GitSignsChange = { fg = "#2B5CE6" }
        hl.GitSignsDelete = { fg = "#C75E6A" }

        -- Diagnostics
        hl.DiagnosticError = { fg = "#C75E6A" }
        hl.DiagnosticWarn  = { fg = "#C28A39" }
        hl.DiagnosticInfo  = { fg = "#2B5CE6" }
        hl.DiagnosticHint  = { fg = "#AAB8F5" }
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
