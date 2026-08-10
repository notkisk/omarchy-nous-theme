local M = {}

local palette = {
  ink = "#142B63",
  ink_deep = "#0D1D47",
  ink_soft = "#1F3D81",
  paper = "#DCE8FF",
  paper_bright = "#F4F7FF",
  cobalt = "#0000F2",
  cobalt_soft = "#9FB7FF",
  lavender = "#BFC5FF",
  lavender_dark = "#6D83D7",
  muted = "#91A7D1",
  line = "#46639A",
  coral = "#EB8195",
  teal = "#6BC2B0",
  cyan = "#8BD6E5",
  ochre = "#D9B88A",
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

  -- Editor foundation and navigation chrome.
  hi("Normal", { fg = palette.paper, bg = palette.ink })
  hi("NormalNC", { fg = palette.muted, bg = palette.ink_deep })
  hi("NormalFloat", { fg = palette.paper, bg = palette.ink_soft })
  hi("FloatBorder", { fg = palette.cobalt_soft, bg = palette.ink_soft })
  hi("FloatTitle", { fg = palette.paper_bright, bg = palette.cobalt, bold = true })
  hi("SignColumn", { fg = palette.muted, bg = palette.ink })
  hi("EndOfBuffer", { fg = palette.ink, bg = palette.ink })
  hi("ColorColumn", { bg = palette.ink_soft })
  hi("Cursor", { fg = palette.ink, bg = palette.paper_bright })
  hi("NousCursor", { fg = palette.ink, bg = palette.paper_bright })
  hi("NousInsert", { fg = palette.ink, bg = palette.cobalt_soft })
  hi("NousReplace", { fg = palette.ink, bg = palette.coral })
  hi("NousOperator", { fg = palette.ink, bg = palette.lavender })
  hi("lCursor", { fg = palette.ink, bg = palette.paper_bright })
  hi("CursorLine", { bg = "#1C3673" })
  hi("CursorColumn", { bg = "#1C3673" })
  hi("CursorLineNr", { fg = palette.paper_bright, bg = palette.ink_soft, bold = true })
  hi("LineNr", { fg = palette.line, bg = palette.ink })
  hi("Folded", { fg = palette.lavender, bg = palette.ink_soft })
  hi("FoldColumn", { fg = palette.cobalt_soft, bg = palette.ink })
  hi("VertSplit", { fg = palette.line, bg = palette.ink })
  hi("WinSeparator", { fg = palette.line, bg = palette.ink })
  hi("Whitespace", { fg = "#28345F" })
  hi("NonText", { fg = "#28345F" })
  hi("SpecialKey", { fg = palette.lavender_dark })
  hi("Directory", { fg = palette.cobalt_soft, bold = true })

  -- Syntax and Treesitter: cobalt is structure, lavender is language, teal is data.
  hi("Comment", { fg = "#9FB7D9", italic = true })
  hi("Constant", { fg = palette.cobalt_soft })
  hi("String", { fg = palette.teal })
  hi("Character", { fg = palette.cyan })
  hi("Number", { fg = palette.ochre })
  hi("Boolean", { fg = palette.ochre, bold = true })
  hi("Float", { fg = palette.ochre })
  hi("Identifier", { fg = "#E8F0FF" })
  hi("Function", { fg = palette.paper_bright, bold = true })
  hi("Statement", { fg = palette.cobalt_soft })
  hi("Conditional", { fg = palette.cobalt_soft })
  hi("Repeat", { fg = palette.cobalt_soft })
  hi("Label", { fg = palette.lavender })
  hi("Operator", { fg = palette.paper_bright })
  hi("Keyword", { fg = palette.lavender, italic = true })
  hi("Exception", { fg = palette.coral })
  hi("PreProc", { fg = palette.lavender })
  hi("Include", { fg = palette.cobalt_soft })
  hi("Define", { fg = palette.lavender })
  hi("Macro", { fg = palette.lavender })
  hi("Type", { fg = palette.cyan })
  hi("StorageClass", { fg = palette.cobalt_soft })
  hi("Structure", { fg = palette.cyan })
  hi("Typedef", { fg = palette.cyan })
  hi("Special", { fg = palette.cyan })
  hi("Delimiter", { fg = "#C9D7F2" })
  hi("Error", { fg = palette.coral, bold = true })
  hi("Todo", { fg = palette.ink, bg = palette.ochre, bold = true })

  local treesitter = {
    ["@comment"] = { fg = palette.muted, italic = true },
    ["@string"] = { fg = palette.teal },
    ["@string.escape"] = { fg = palette.cyan },
    ["@string.special"] = { fg = palette.cyan },
    ["@number"] = { fg = palette.ochre },
    ["@boolean"] = { fg = palette.ochre, bold = true },
    ["@constant"] = { fg = palette.cobalt_soft },
    ["@constant.builtin"] = { fg = palette.lavender },
    ["@variable"] = { fg = palette.paper },
    ["@variable.builtin"] = { fg = palette.lavender },
    ["@variable.parameter"] = { fg = "#C9D7F2", italic = true },
    ["@property"] = { fg = palette.cyan },
    ["@field"] = { fg = palette.cyan },
    ["@function"] = { fg = palette.paper_bright, bold = true },
    ["@function.call"] = { fg = palette.paper_bright },
    ["@function.builtin"] = { fg = palette.cobalt_soft },
    ["@method"] = { fg = palette.paper_bright },
    ["@constructor"] = { fg = palette.cyan },
    ["@keyword"] = { fg = palette.lavender, italic = true },
    ["@keyword.return"] = { fg = palette.cobalt_soft, italic = true },
    ["@type"] = { fg = palette.cyan },
    ["@type.builtin"] = { fg = palette.lavender },
    ["@namespace"] = { fg = palette.cyan },
    ["@operator"] = { fg = palette.paper_bright },
    ["@punctuation.bracket"] = { fg = "#C9D7F2" },
    ["@punctuation.delimiter"] = { fg = "#AFC1DE" },
    ["@tag"] = { fg = palette.cobalt_soft },
    ["@tag.attribute"] = { fg = palette.cyan, italic = true },
    ["@markup.heading"] = { fg = palette.paper_bright, bold = true },
    ["@markup.link"] = { fg = palette.cobalt_soft, underline = true },
    ["@diff.plus"] = { fg = palette.teal },
    ["@diff.minus"] = { fg = palette.coral },
  }
  for group, opts in pairs(treesitter) do hi(group, opts) end

  -- Selection, search, completion, and floating tools.
  hi("Visual", { bg = "#304FCA", fg = "#F4F7FF" })
  hi("VisualNOS", { bg = "#304FCA", fg = "#F4F7FF" })
  hi("Search", { fg = palette.ink, bg = palette.ochre, bold = true })
  hi("IncSearch", { fg = palette.ink, bg = palette.paper_bright, bold = true })
  hi("CurSearch", { fg = palette.ink, bg = palette.cobalt_soft, bold = true })
  hi("MatchParen", { fg = palette.paper_bright, bg = palette.lavender_dark, bold = true })
  hi("Pmenu", { fg = palette.paper, bg = palette.ink_soft })
  hi("PmenuSel", { fg = palette.ink, bg = palette.cobalt_soft, bold = true })
  hi("PmenuSbar", { bg = palette.line })
  hi("PmenuThumb", { bg = palette.cobalt_soft })
  hi("PmenuKind", { fg = palette.lavender })
  hi("PmenuExtra", { fg = palette.muted })
  hi("WildMenu", { fg = palette.ink, bg = palette.cobalt_soft, bold = true })
  hi("Question", { fg = palette.teal })
  hi("MoreMsg", { fg = palette.cobalt_soft })
  hi("WarningMsg", { fg = palette.ochre })
  hi("ErrorMsg", { fg = palette.coral })
  hi("ModeMsg", { fg = palette.cobalt_soft, bold = true })

  -- Diagnostics, LSP, and references.
  hi("DiagnosticError", { fg = palette.coral })
  hi("DiagnosticWarn", { fg = palette.ochre })
  hi("DiagnosticInfo", { fg = palette.cobalt_soft })
  hi("DiagnosticHint", { fg = palette.cyan })
  hi("DiagnosticUnderlineError", { undercurl = true, sp = palette.coral })
  hi("DiagnosticUnderlineWarn", { undercurl = true, sp = palette.ochre })
  hi("DiagnosticUnderlineInfo", { undercurl = true, sp = palette.cobalt_soft })
  hi("DiagnosticUnderlineHint", { undercurl = true, sp = palette.cyan })
  hi("LspReferenceText", { bg = "#253361" })
  hi("LspReferenceRead", { bg = "#253361" })
  hi("LspReferenceWrite", { bg = "#304FCA", bold = true })
  hi("LspCodeLens", { fg = palette.muted, italic = true })
  hi("LspInlayHint", { fg = palette.muted, bg = palette.ink_soft, italic = true })

  -- Statusline, tabline, Git, Telescope, and WhichKey.
  hi("StatusLine", { fg = palette.paper, bg = palette.ink_soft })
  hi("StatusLineNC", { fg = palette.muted, bg = palette.ink_deep })
  hi("TabLine", { fg = palette.muted, bg = palette.ink_deep })
  hi("TabLineFill", { fg = palette.line, bg = palette.ink_deep })
  hi("TabLineSel", { fg = palette.ink, bg = palette.cobalt_soft, bold = true })
  hi("WinBar", { fg = palette.cobalt_soft, bg = palette.ink, bold = true })
  hi("WinBarNC", { fg = palette.muted, bg = palette.ink_deep })
  hi("GitSignsAdd", { fg = palette.teal })
  hi("GitSignsChange", { fg = palette.cobalt_soft })
  hi("GitSignsDelete", { fg = palette.coral })
  hi("TelescopeNormal", { fg = palette.paper, bg = palette.ink })
  hi("TelescopeBorder", { fg = palette.line, bg = palette.ink })
  hi("TelescopePromptNormal", { fg = palette.paper_bright, bg = palette.ink_soft })
  hi("TelescopePromptBorder", { fg = palette.cobalt_soft, bg = palette.ink_soft })
  hi("TelescopePromptTitle", { fg = palette.ink, bg = palette.cobalt_soft, bold = true })
  hi("TelescopeResultsTitle", { fg = palette.ink, bg = palette.lavender })
  hi("TelescopePreviewTitle", { fg = palette.ink, bg = palette.teal })
  hi("TelescopeSelection", { fg = palette.paper_bright, bg = "#253361", bold = true })
  hi("TelescopeSelectionCaret", { fg = palette.cobalt_soft })
  hi("TelescopeMatching", { fg = palette.ochre, bold = true })
  hi("WhichKey", { fg = palette.cobalt_soft, bold = true })
  hi("WhichKeyGroup", { fg = palette.lavender })
  hi("WhichKeyDesc", { fg = palette.paper })
  hi("WhichKeySeparator", { fg = palette.muted })
  hi("WhichKeyFloat", { bg = palette.ink_soft })

  -- General plugin surfaces that LazyVim users commonly encounter.
  hi("BufferLineFill", { bg = palette.ink_deep })
  hi("BufferLineBackground", { fg = palette.muted, bg = palette.ink_deep })
  hi("BufferLineBufferSelected", { fg = palette.paper_bright, bg = palette.ink, bold = true })
  hi("NeoTreeNormal", { fg = palette.paper, bg = palette.ink })
  hi("NeoTreeNormalNC", { fg = palette.muted, bg = palette.ink_deep })
  hi("NeoTreeDirectoryIcon", { fg = palette.cobalt_soft })
  hi("NeoTreeGitAdded", { fg = palette.teal })
  hi("NeoTreeGitModified", { fg = palette.ochre })
  hi("NeoTreeGitDeleted", { fg = palette.coral })
  hi("NotifyINFOBorder", { fg = palette.cobalt_soft })
  hi("NotifyWARNBorder", { fg = palette.ochre })
  hi("NotifyERRORBorder", { fg = palette.coral })
  hi("NoiceCmdlinePopupBorder", { fg = palette.cobalt_soft })

  -- Snacks picker/explorer: the Files panel in current LazyVim uses these
  -- groups rather than Neo-tree's namespace.
  hi("SnacksPicker", { fg = "#E8F0FF", bg = palette.ink })
  hi("SnacksPickerBorder", { fg = palette.cobalt_soft, bg = palette.ink })
  hi("SnacksPickerTitle", { fg = palette.ink, bg = palette.cobalt_soft, bold = true })
  hi("SnacksPickerPrompt", { fg = palette.cyan, bg = palette.ink })
  hi("SnacksPickerInput", { fg = "#F4F7FF", bg = palette.ink_soft })
  hi("SnacksPickerInputBorder", { fg = palette.cobalt_soft, bg = palette.ink_soft })
  hi("SnacksPickerInputTitle", { fg = palette.ink, bg = palette.cobalt_soft, bold = true })
  hi("SnacksPickerList", { fg = "#E8F0FF", bg = palette.ink })
  hi("SnacksPickerListBorder", { fg = palette.line, bg = palette.ink })
  hi("SnacksPickerListTitle", { fg = palette.ink, bg = palette.lavender, bold = true })
  hi("SnacksPickerPreview", { fg = "#E8F0FF", bg = palette.ink })
  hi("SnacksPickerPreviewBorder", { fg = palette.line, bg = palette.ink })
  hi("SnacksPickerPreviewTitle", { fg = palette.ink, bg = palette.teal, bold = true })
  hi("SnacksPickerSelected", { fg = "#FFFFFF", bg = "#304FCA", bold = true })
  hi("SnacksPickerCursorLine", { fg = "#FFFFFF", bg = "#304FCA", bold = true })
  hi("SnacksPickerListCursorLine", { bg = "#1F3D81" })
  hi("SnacksPickerMatch", { fg = palette.ochre, bold = true })
  hi("SnacksPickerDir", { fg = palette.cobalt_soft })
  hi("SnacksPickerPathHidden", { fg = "#9FB7D9" })
  hi("SnacksPickerGitStatusUntracked", { fg = palette.muted })
  hi("SnacksPickerGitStatusAdded", { fg = palette.teal })
  hi("SnacksPickerGitStatusModified", { fg = palette.ochre })

  -- Mini.files, Oil, and NvimTree use separate integration namespaces.
  hi("MiniFilesNormal", { fg = "#E8F0FF", bg = palette.ink_soft })
  hi("MiniFilesBorder", { fg = palette.cobalt_soft, bg = palette.ink_soft })
  hi("MiniFilesCursorLine", { fg = "#FFFFFF", bg = "#304FCA", bold = true })
  hi("MiniFilesDirectory", { fg = palette.cobalt_soft, bg = palette.ink_soft, bold = true })
  hi("MiniFilesFile", { fg = "#E8F0FF", bg = palette.ink_soft })
  hi("MiniFilesTitle", { fg = palette.paper_bright, bg = palette.cobalt, bold = true })
  hi("MiniFilesTitleFocused", { fg = palette.paper_bright, bg = palette.cobalt_soft, bold = true })
  hi("OilNormal", { fg = "#E8F0FF", bg = palette.ink })
  hi("OilDir", { fg = palette.cobalt_soft, bold = true })
  hi("OilFile", { fg = "#E8F0FF" })
  hi("OilTypeDir", { fg = palette.cyan })
  hi("OilTypeFile", { fg = palette.muted })
  hi("NvimTreeNormal", { fg = "#E8F0FF", bg = palette.ink })
  hi("NvimTreeFolderName", { fg = palette.cobalt_soft, bold = true })
  hi("NvimTreeFolderIcon", { fg = palette.cyan })
  hi("NvimTreeCursorLine", { fg = "#FFFFFF", bg = "#304FCA", bold = true })

  -- Completion and diagnostics stay bright enough on the navy field.
  hi("CmpItemAbbr", { fg = "#E8F0FF" })
  hi("CmpItemAbbrMatch", { fg = palette.ochre, bold = true })
  hi("CmpItemAbbrMatchFuzzy", { fg = palette.ochre, bold = true })
  hi("CmpItemKind", { fg = palette.cyan })
  hi("CmpItemMenu", { fg = palette.muted })
  hi("DiagnosticVirtualTextError", { fg = "#FF9AAA", bg = "#4A203B" })
  hi("DiagnosticVirtualTextWarn", { fg = "#F1D39B", bg = "#493B25" })
  hi("DiagnosticVirtualTextInfo", { fg = palette.cobalt_soft, bg = "#203D78" })
  hi("DiagnosticVirtualTextHint", { fg = palette.cyan, bg = "#1B485A" })
  hi("DiagnosticSignError", { fg = palette.coral })
  hi("DiagnosticSignWarn", { fg = palette.ochre })
  hi("DiagnosticSignInfo", { fg = palette.cobalt_soft })
  hi("DiagnosticSignHint", { fg = palette.cyan })
end

return M
