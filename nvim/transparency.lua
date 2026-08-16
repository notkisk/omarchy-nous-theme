-- Nous Research — background reinforcement layer.
-- Omarchy's theme hot-reloader sources this file after every colorscheme
-- change. We re-assert the navy backgrounds here so any Lazy reload or
-- transparency pass lands on the correct #1E3061 surface.
local backgrounds = {
  Normal         = "#1E3061",
  NormalNC       = "#243672",
  EndOfBuffer    = "#1E3061",
  FoldColumn     = "#1E3061",
  SignColumn     = "#1E3061",
  LineNr         = "#1E3061",
  Terminal       = "#1E3061",
  NormalFloat    = "#243672",
  FloatBorder    = "#243672",
  Pmenu          = "#243672",
  PmenuSbar      = "#2C4080",
  PmenuThumb     = "#4D8FFF",
  Folded         = "#243672",
  WhichKeyFloat  = "#243672",
  TelescopeBorder        = "#1E3061",
  TelescopeNormal        = "#1E3061",
  TelescopePromptBorder  = "#243672",
  TelescopePromptNormal  = "#243672",
  NeoTreeNormal          = "#243672",
  NeoTreeNormalNC        = "#243672",
  NeoTreeVertSplit       = "#1E3061",
  NeoTreeWinSeparator    = "#1E3061",
  NeoTreeEndOfBuffer     = "#243672",
  NvimTreeNormal         = "#243672",
  NvimTreeVertSplit      = "#1E3061",
  NvimTreeEndOfBuffer    = "#243672",
  CursorLine     = "#2C4080",
  CursorLineNr   = "#2C4080",
}

for name, background in pairs(backgrounds) do
  local ok, highlight = pcall(vim.api.nvim_get_hl, 0, { name = name, link = false })
  if ok then
    highlight.bg = background
    vim.api.nvim_set_hl(0, name, highlight)
  end
end
