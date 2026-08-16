local M = {}

-- Nous Research — deep navy surface with electric cobalt accents.
-- Background: #1E3061. All values optimised for readability on dark navy.
local p = {
  bg        = "#1E3061",  -- main editor/terminal surface
  bg_raised  = "#243672",  -- floats, sidebars, inactive panes
  bg_active  = "#2C4080",  -- cursorline, selected rows
  bg_deep    = "#182650",  -- statusline, tabline fill
  fg        = "#E8EEFF",  -- primary text
  fg_soft    = "#A8BDED",  -- secondary text, parameters
  fg_dim     = "#6080C0",  -- line numbers, muted ui
  cobalt     = "#4D8FFF",  -- electric cobalt — primary accent
  cobalt_soft= "#6BA3FF",  -- softer accent, function calls
  line       = "#2E4A8A",  -- borders, dividers
  teal       = "#2EC4A0",  -- strings, success
  cyan       = "#4ECDE6",  -- types, constructors
  ochre      = "#E6B84A",  -- numbers, warnings
  coral      = "#F06070",  -- errors, exceptions
  lavender   = "#9BB0E8",  -- keywords, builtins
  white      = "#FFFFFF",
}

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

function M.setup()
  vim.g.colors_name = "nous"
  vim.o.background = "dark"
  vim.o.termguicolors = true
  vim.o.cursorline = true
  vim.o.signcolumn = "yes"
  vim.o.showmode = false
  vim.o.pumblend = 0
  vim.o.winblend = 0
  vim.opt.fillchars:append({ eob = " ", fold = "·", foldopen = "⌄", foldclose = "›", foldsep = " " })
  vim.opt.guicursor = {
    "n-v-c:block-NousCursor",
    "i-ci:ver25-NousInsert",
    "r-cr:hor20-NousReplace",
    "o:hor20-NousOperator",
    "a:blinkwait700-blinkon400-blinkoff250-NousInsert",
  }

  -- ── Editor foundation ────────────────────────────────────────────────────
  hi("Normal",        { fg = p.fg,       bg = p.bg })
  hi("NormalNC",      { fg = p.fg_soft,  bg = p.bg_raised })
  hi("NormalFloat",   { fg = p.fg,       bg = p.bg_raised })
  hi("FloatBorder",   { fg = p.cobalt,   bg = p.bg_raised })
  hi("FloatTitle",    { fg = p.white,    bg = p.cobalt,       bold = true })
  hi("SignColumn",    { fg = p.fg_dim,   bg = p.bg })
  hi("EndOfBuffer",   { fg = p.bg,       bg = p.bg })
  hi("ColorColumn",   { bg = p.bg_raised })
  hi("Cursor",        { fg = p.bg,       bg = p.fg })
  hi("NousCursor",    { fg = p.bg,       bg = p.cobalt })
  hi("NousInsert",    { fg = p.bg,       bg = p.cobalt_soft })
  hi("NousReplace",   { fg = p.bg,       bg = p.coral })
  hi("NousOperator",  { fg = p.bg,       bg = p.lavender })
  hi("lCursor",       { fg = p.bg,       bg = p.cobalt })
  hi("CursorLine",    { bg = p.bg_active })
  hi("CursorColumn",  { bg = p.bg_active })
  hi("CursorLineNr",  { fg = p.cobalt_soft, bg = p.bg_active, bold = true })
  hi("LineNr",        { fg = p.fg_dim,   bg = p.bg })
  hi("Folded",        { fg = p.lavender, bg = p.bg_raised })
  hi("FoldColumn",    { fg = p.cobalt,   bg = p.bg })
  hi("VertSplit",     { fg = p.line,     bg = p.bg })
  hi("WinSeparator",  { fg = p.line,     bg = p.bg })
  hi("Whitespace",    { fg = p.line })
  hi("NonText",       { fg = p.line })
  hi("SpecialKey",    { fg = p.fg_dim })
  hi("Directory",     { fg = p.cobalt_soft, bold = true })
  hi("Title",         { fg = p.cobalt,   bold = true })
  hi("MatchParen",    { fg = p.white,    bg = p.cobalt,       bold = true })

  -- ── Syntax ───────────────────────────────────────────────────────────────
  hi("Comment",       { fg = p.fg_dim,   italic = true })
  hi("Constant",      { fg = p.cobalt_soft })
  hi("String",        { fg = p.teal })
  hi("Character",     { fg = p.cyan })
  hi("Number",        { fg = p.ochre })
  hi("Boolean",       { fg = p.ochre,    bold = true })
  hi("Float",         { fg = p.ochre })
  hi("Identifier",    { fg = p.fg })
  hi("Function",      { fg = p.cobalt_soft, bold = true })
  hi("Statement",     { fg = p.lavender })
  hi("Conditional",   { fg = p.lavender })
  hi("Repeat",        { fg = p.lavender })
  hi("Label",         { fg = p.lavender })
  hi("Operator",      { fg = p.fg_soft })
  hi("Keyword",       { fg = p.lavender, italic = true })
  hi("Exception",     { fg = p.coral })
  hi("PreProc",       { fg = p.lavender })
  hi("Include",       { fg = p.cobalt_soft })
  hi("Define",        { fg = p.lavender })
  hi("Macro",         { fg = p.lavender })
  hi("Type",          { fg = p.cyan })
  hi("StorageClass",  { fg = p.cobalt_soft })
  hi("Structure",     { fg = p.cyan })
  hi("Typedef",       { fg = p.cyan })
  hi("Special",       { fg = p.cyan })
  hi("Delimiter",     { fg = p.fg_soft })
  hi("Error",         { fg = p.coral,    bold = true })
  hi("Todo",          { fg = p.bg,       bg = p.ochre,        bold = true })
  hi("Underlined",    { fg = p.cobalt_soft, underline = true })

  -- ── Treesitter ───────────────────────────────────────────────────────────
  local ts = {
    ["@comment"]                    = { fg = p.fg_dim,    italic = true },
    ["@string"]                     = { fg = p.teal },
    ["@string.escape"]              = { fg = p.cyan },
    ["@string.special"]             = { fg = p.cyan },
    ["@number"]                     = { fg = p.ochre },
    ["@boolean"]                    = { fg = p.ochre,     bold = true },
    ["@constant"]                   = { fg = p.cobalt_soft },
    ["@constant.builtin"]           = { fg = p.lavender },
    ["@variable"]                   = { fg = p.fg },
    ["@variable.builtin"]           = { fg = p.lavender },
    ["@variable.parameter"]         = { fg = p.fg_soft,   italic = true },
    ["@property"]                   = { fg = p.cyan },
    ["@field"]                      = { fg = p.cyan },
    ["@function"]                   = { fg = p.cobalt_soft, bold = true },
    ["@function.call"]              = { fg = p.cobalt_soft },
    ["@function.builtin"]           = { fg = p.cobalt },
    ["@method"]                     = { fg = p.cobalt_soft },
    ["@constructor"]                = { fg = p.cyan },
    ["@keyword"]                    = { fg = p.lavender,  italic = true },
    ["@keyword.return"]             = { fg = p.cobalt_soft, italic = true },
    ["@type"]                       = { fg = p.cyan },
    ["@type.builtin"]               = { fg = p.lavender },
    ["@namespace"]                  = { fg = p.cyan },
    ["@operator"]                   = { fg = p.fg_soft },
    ["@punctuation.bracket"]        = { fg = p.fg_soft },
    ["@punctuation.delimiter"]      = { fg = p.fg_dim },
    ["@tag"]                        = { fg = p.cobalt_soft },
    ["@tag.attribute"]              = { fg = p.cyan,      italic = true },
    ["@markup.heading"]             = { fg = p.cobalt_soft, bold = true },
    ["@markup.link"]                = { fg = p.cobalt_soft, underline = true },
    ["@diff.plus"]                  = { fg = p.teal },
    ["@diff.minus"]                 = { fg = p.coral },
  }
  for group, opts in pairs(ts) do hi(group, opts) end

  -- ── Selection, search, completion ────────────────────────────────────────
  hi("Visual",        { fg = p.white,    bg = p.cobalt })
  hi("VisualNOS",     { fg = p.white,    bg = p.cobalt })
  hi("Search",        { fg = p.bg,       bg = p.ochre,        bold = true })
  hi("IncSearch",     { fg = p.bg,       bg = p.cobalt,       bold = true })
  hi("CurSearch",     { fg = p.bg,       bg = p.cobalt_soft,  bold = true })
  hi("Pmenu",         { fg = p.fg,       bg = p.bg_raised })
  hi("PmenuSel",      { fg = p.white,    bg = p.cobalt,       bold = true })
  hi("PmenuSbar",     { bg = p.line })
  hi("PmenuThumb",    { bg = p.cobalt })
  hi("PmenuKind",     { fg = p.lavender })
  hi("PmenuExtra",    { fg = p.fg_dim })
  hi("WildMenu",      { fg = p.white,    bg = p.cobalt,       bold = true })
  hi("Question",      { fg = p.teal })
  hi("MoreMsg",       { fg = p.cobalt_soft })
  hi("WarningMsg",    { fg = p.ochre })
  hi("ErrorMsg",      { fg = p.coral })
  hi("ModeMsg",       { fg = p.cobalt_soft, bold = true })

  -- ── Diagnostics and LSP ──────────────────────────────────────────────────
  hi("DiagnosticError",             { fg = p.coral })
  hi("DiagnosticWarn",              { fg = p.ochre })
  hi("DiagnosticInfo",              { fg = p.cobalt_soft })
  hi("DiagnosticHint",              { fg = p.cyan })
  hi("DiagnosticUnderlineError",    { undercurl = true, sp = p.coral })
  hi("DiagnosticUnderlineWarn",     { undercurl = true, sp = p.ochre })
  hi("DiagnosticUnderlineInfo",     { undercurl = true, sp = p.cobalt_soft })
  hi("DiagnosticUnderlineHint",     { undercurl = true, sp = p.cyan })
  hi("DiagnosticVirtualTextError",  { fg = p.coral,      bg = "#271830", italic = true })
  hi("DiagnosticVirtualTextWarn",   { fg = p.ochre,      bg = "#272016", italic = true })
  hi("DiagnosticVirtualTextInfo",   { fg = p.cobalt_soft, bg = p.bg_raised, italic = true })
  hi("DiagnosticVirtualTextHint",   { fg = p.cyan,       bg = p.bg_raised, italic = true })
  hi("DiagnosticSignError",         { fg = p.coral })
  hi("DiagnosticSignWarn",          { fg = p.ochre })
  hi("DiagnosticSignInfo",          { fg = p.cobalt_soft })
  hi("DiagnosticSignHint",          { fg = p.cyan })
  hi("LspReferenceText",            { bg = p.bg_active })
  hi("LspReferenceRead",            { bg = p.bg_active })
  hi("LspReferenceWrite",           { bg = p.cobalt,     bold = true })
  hi("LspCodeLens",                 { fg = p.fg_dim,     italic = true })
  hi("LspInlayHint",                { fg = p.fg_dim,     bg = p.bg_raised, italic = true })

  -- ── Statusline, tabline, winbar ──────────────────────────────────────────
  hi("StatusLine",    { fg = p.fg,       bg = p.bg_deep })
  hi("StatusLineNC",  { fg = p.fg_dim,   bg = p.bg_raised })
  hi("TabLine",       { fg = p.fg_dim,   bg = p.bg_deep })
  hi("TabLineFill",   { fg = p.line,     bg = p.bg_deep })
  hi("TabLineSel",    { fg = p.white,    bg = p.cobalt,       bold = true })
  hi("WinBar",        { fg = p.cobalt_soft, bg = p.bg,        bold = true })
  hi("WinBarNC",      { fg = p.fg_dim,   bg = p.bg_raised })

  -- ── Git ──────────────────────────────────────────────────────────────────
  hi("GitSignsAdd",    { fg = p.teal })
  hi("GitSignsChange", { fg = p.cobalt_soft })
  hi("GitSignsDelete", { fg = p.coral })

  -- ── Telescope ────────────────────────────────────────────────────────────
  hi("TelescopeNormal",        { fg = p.fg,          bg = p.bg })
  hi("TelescopeBorder",        { fg = p.line,        bg = p.bg })
  hi("TelescopePromptNormal",  { fg = p.fg,          bg = p.bg_raised })
  hi("TelescopePromptBorder",  { fg = p.cobalt,      bg = p.bg_raised })
  hi("TelescopePromptTitle",   { fg = p.white,       bg = p.cobalt,      bold = true })
  hi("TelescopeResultsTitle",  { fg = p.white,       bg = p.bg_deep,     bold = true })
  hi("TelescopePreviewTitle",  { fg = p.white,       bg = p.teal,        bold = true })
  hi("TelescopeSelection",     { fg = p.white,       bg = p.cobalt,      bold = true })
  hi("TelescopeSelectionCaret",{ fg = p.cobalt })
  hi("TelescopeMatching",      { fg = p.ochre,       bold = true })

  -- ── WhichKey ─────────────────────────────────────────────────────────────
  hi("WhichKey",          { fg = p.cobalt_soft, bold = true })
  hi("WhichKeyGroup",     { fg = p.lavender })
  hi("WhichKeyDesc",      { fg = p.fg })
  hi("WhichKeySeparator", { fg = p.fg_dim })
  hi("WhichKeyFloat",     { bg = p.bg_raised })

  -- ── BufferLine ───────────────────────────────────────────────────────────
  hi("BufferLineFill",           { bg = p.bg_deep })
  hi("BufferLineBackground",     { fg = p.fg_dim,   bg = p.bg_deep })
  hi("BufferLineBufferSelected", { fg = p.fg,       bg = p.bg,          bold = true })

  -- ── Neo-tree ─────────────────────────────────────────────────────────────
  hi("NeoTreeNormal",        { fg = p.fg,       bg = p.bg_raised })
  hi("NeoTreeNormalNC",      { fg = p.fg_soft,  bg = p.bg_raised })
  hi("NeoTreeDirectoryIcon", { fg = p.cobalt_soft })
  hi("NeoTreeGitAdded",      { fg = p.teal })
  hi("NeoTreeGitModified",   { fg = p.ochre })
  hi("NeoTreeGitDeleted",    { fg = p.coral })

  -- ── Snacks picker / file explorer ────────────────────────────────────────
  hi("SnacksPicker",                   { fg = p.fg,          bg = p.bg })
  hi("SnacksPickerBorder",             { fg = p.cobalt,      bg = p.bg })
  hi("SnacksPickerTitle",              { fg = p.white,       bg = p.cobalt,      bold = true })
  hi("SnacksPickerPrompt",             { fg = p.cobalt,      bg = p.bg })
  hi("SnacksPickerInput",              { fg = p.fg,          bg = p.bg_raised })
  hi("SnacksPickerInputBorder",        { fg = p.cobalt,      bg = p.bg_raised })
  hi("SnacksPickerInputTitle",         { fg = p.white,       bg = p.cobalt,      bold = true })
  hi("SnacksPickerList",               { fg = p.fg,          bg = p.bg })
  hi("SnacksPickerListBorder",         { fg = p.line,        bg = p.bg })
  hi("SnacksPickerListTitle",          { fg = p.white,       bg = p.bg_deep,     bold = true })
  hi("SnacksPickerPreview",            { fg = p.fg,          bg = p.bg })
  hi("SnacksPickerPreviewBorder",      { fg = p.line,        bg = p.bg })
  hi("SnacksPickerPreviewTitle",       { fg = p.white,       bg = p.teal,        bold = true })
  hi("SnacksPickerSelected",           { fg = p.white,       bg = p.cobalt,      bold = true })
  hi("SnacksPickerCursorLine",         { fg = p.white,       bg = p.cobalt,      bold = true })
  hi("SnacksPickerListCursorLine",     { bg = p.bg_active })
  hi("SnacksPickerMatch",              { fg = p.ochre,       bold = true })
  hi("SnacksPickerDir",                { fg = p.cobalt_soft })
  hi("SnacksPickerPathHidden",         { fg = p.fg_dim })
  hi("SnacksPickerGitStatusUntracked", { fg = p.fg_dim })
  hi("SnacksPickerGitStatusAdded",     { fg = p.teal })
  hi("SnacksPickerGitStatusModified",  { fg = p.ochre })

  -- ── Mini.files / Oil / NvimTree ──────────────────────────────────────────
  hi("MiniFilesNormal",       { fg = p.fg,          bg = p.bg_raised })
  hi("MiniFilesBorder",       { fg = p.cobalt,      bg = p.bg_raised })
  hi("MiniFilesCursorLine",   { fg = p.white,       bg = p.cobalt,      bold = true })
  hi("MiniFilesDirectory",    { fg = p.cobalt_soft, bg = p.bg_raised,   bold = true })
  hi("MiniFilesFile",         { fg = p.fg,          bg = p.bg_raised })
  hi("MiniFilesTitle",        { fg = p.white,       bg = p.cobalt,      bold = true })
  hi("MiniFilesTitleFocused", { fg = p.white,       bg = p.cobalt_soft, bold = true })
  hi("OilNormal",             { fg = p.fg,          bg = p.bg })
  hi("OilDir",                { fg = p.cobalt_soft, bold = true })
  hi("OilFile",               { fg = p.fg })
  hi("OilTypeDir",            { fg = p.cyan })
  hi("OilTypeFile",           { fg = p.fg_dim })
  hi("NvimTreeNormal",        { fg = p.fg,          bg = p.bg_raised })
  hi("NvimTreeFolderName",    { fg = p.cobalt_soft, bold = true })
  hi("NvimTreeFolderIcon",    { fg = p.cyan })
  hi("NvimTreeCursorLine",    { fg = p.white,       bg = p.cobalt,      bold = true })

  -- ── nvim-cmp ─────────────────────────────────────────────────────────────
  hi("CmpItemAbbr",           { fg = p.fg })
  hi("CmpItemAbbrMatch",      { fg = p.ochre,       bold = true })
  hi("CmpItemAbbrMatchFuzzy", { fg = p.ochre,       bold = true })
  hi("CmpItemKind",           { fg = p.cyan })
  hi("CmpItemMenu",           { fg = p.fg_dim })

  -- ── Notify ───────────────────────────────────────────────────────────────
  hi("NotifyINFOBorder",         { fg = p.cobalt_soft })
  hi("NotifyWARNBorder",         { fg = p.ochre })
  hi("NotifyERRORBorder",        { fg = p.coral })
  hi("NoiceCmdlinePopupBorder",  { fg = p.cobalt })
end

return M
