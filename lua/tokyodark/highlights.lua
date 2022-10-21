local p = require("tokyodark.palette")
local cfg = require("tokyodark.config")
local u = require("tokyodark.utils")

local M = {}
local hl = { langs = {}, plugins = {} }

local highlight = vim.api.nvim_set_hl

local function load_highlights(highlights)
    for group_name, group_settings in pairs(highlights) do
        highlight(0, group_name, group_settings)
    end
end

hl.predef = {
    Fg = { fg = p.fg },
    Grey = { fg = p.grey },
    Red = { fg = p.red },
    Orange = { fg = p.orange },
    Yellow = { fg = p.yellow },
    Green = { fg = p.green },
    Blue = { fg = p.blue },
    Purple = { fg = p.purple },
    BlueItalic = { fg = p.blue, italic = cfg.italic },
    GreenItalic = { fg = p.green, italic = cfg.italic },
    OrangeItalic = { fg = p.orange, italic = cfg.italic },
    RedItalic = { fg = p.red, italic = cfg.italic },
    YellowItalic = { fg = p.yellow, italic = cfg.italic },
}

hl.common = {
    Normal = { fg = p.fg, bg = cfg.bg and p.none or p.bg0 },
    NormalNC = { fg = p.fg, bg = cfg.bg and p.none or p.bg0 },
    NormalSB = { fg = p.fg, bg = cfg.bg and p.none or p.bg0 },
    NormalFloat = { fg = p.fg, bg = cfg.bg and p.none or p.bg0 },
    Terminal = { fg = p.fg, bg = cfg.bg and p.none or p.bg0 },
    EndOfBuffer = { fg = p.bg2, bg = cfg.bg and p.none or p.bg0 },
    FoldColumn = { fg = p.fg, bg = cfg.bg and p.none or p.bg1 },
    Folded = { fg = p.fg, bg = cfg.bg and p.none or p.bg1 },
    SignColumn = { fg = p.fg, bg = cfg.bg and p.none or p.bg0 },
    ToolbarLine = { fg = p.fg },
    Cursor = { reverse = true },
    vCursor = { reverse = true },
    iCursor = { reverse = true },
    lCursor = { reverse = true },
    CursorIM = { reverse = true },
    CursorColumn = { bg = p.bg1 },
    CursorLine = { bg = p.bg1 },
    ColorColumn = { bg = p.bg1 },
    CursorLineNr = { fg = p.fg },
    LineNr = { fg = p.bg4 },
    Conceal = { fg = p.grey, bg = p.bg1 },
    DiffAdd = { fg = p.none, bg = p.diff_add },
    DiffChange = { fg = p.none, bg = p.diff_change },
    DiffDelete = { fg = p.none, bg = p.diff_delete },
    DiffText = { fg = p.none, bg = p.diff_text },
    Directory = { fg = p.green },
    ErrorMsg = { fg = p.red, bold = true, underline = true },
    WarningMsg = { fg = p.yellow, bold = true },
    MoreMsg = { fg = p.blue, bold = true },
    IncSearch = { fg = p.bg0, bg = p.bg_red },
    Search = { fg = p.bg0, bg = p.bg_green },
    CurSearch = { fg = p.bg0, bg = p.bg_red },
    MatchParen = { fg = p.none, bg = p.bg4 },
    NonText = { fg = p.bg4 },
    Whitespace = { fg = p.bg4 },
    SpecialKey = { fg = p.bg4 },
    Pmenu = { fg = p.fg, bg = p.bg0 },
    PmenuSbar = { fg = p.none, bg = p.bg0 },
    PmenuSel = { fg = p.bg0, bg = p.bg_green },
    PmenuThumb = { fg = p.none, bg = p.bg2 },
    WildMenu = { fg = p.bg0, bg = p.blue },
    Question = { fg = p.yellow },
    SpellBad = { fg = p.red, underline = true, sp = p.red },
    SpellCap = { fg = p.yellow, underline = true, sp = p.yellow },
    SpellLocal = { fg = p.blue, underline = true, sp = p.blue },
    SpellRare = { fg = p.purple, underline = true, sp = p.purple },
    StatusLine = { fg = p.fg, bg = p.bg2 },
    StatusLineTerm = { fg = p.fg, bg = p.bg2 },
    StatusLineNC = { fg = p.grey, bg = p.bg1 },
    StatusLineTermNC = { fg = p.grey, bg = p.bg1 },
    TabLine = { fg = p.fg, bg = p.bg4 },
    TabLineFill = { fg = p.grey, bg = p.bg1 },
    TabLineSel = { fg = p.bg0, bg = p.bg_red },
    VertSplit = { fg = p.bg5 },
    Visual = { bg = p.bg2 },
    VisualNOS = { fg = p.none, bg = p.bg2, underline = true },
    QuickFixLine = { fg = p.blue, underline = true },
    Debug = { fg = p.yellow },
    debugPC = { fg = p.bg0, bg = p.green },
    debugBreakpoint = { fg = p.bg0, bg = p.red },
    ToolbarButton = { fg = p.bg0, bg = p.bg_blue },
    FocusedSymbol = { bg = p.bg3 },
}

hl.syntax = {
    Type = hl.predef.BlueItalic,
    Structure = hl.predef.BlueItalic,
    StorageClass = hl.predef.BlueItalic,
    Identifier = hl.predef.OrangeItalic,
    Constant = hl.predef.OrangeItalic,
    PreProc = hl.predef.Red,
    PreCondit = hl.predef.Red,
    Include = hl.predef.Red,
    Keyword = hl.predef.Red,
    Define = hl.predef.Red,
    Typedef = hl.predef.Red,
    Exception = hl.predef.Red,
    Conditional = hl.predef.Red,
    Repeat = hl.predef.Red,
    Statement = hl.predef.Red,
    Macro = hl.predef.Purple,
    Error = hl.predef.Red,
    Label = hl.predef.Purple,
    Special = hl.predef.Purple,
    SpecialChar = hl.predef.Purple,
    Boolean = hl.predef.Purple,
    String = hl.predef.Yellow,
    Character = hl.predef.Yellow,
    Number = hl.predef.Purple,
    Float = hl.predef.Purple,
    Function = hl.predef.Green,
    Operator = hl.predef.Red,
    Title = hl.predef.Yellow,
    Tag = hl.predef.Orange,
    Delimiter = hl.predef.Fg,
    Comment = { fg = p.bg4, italic = cfg.italic_comment },
    SpecialComment = { fg = p.bg4, italic = cfg.italic_comment },
    Todo = { fg = p.blue, italic = cfg.italic_comment },
}

hl.plugins.lsp = {
    LspCxxHlGroupEnumConstant = hl.predef.Orange,
    LspCxxHlGroupMemberVariable = hl.predef.Orange,
    LspCxxHlGroupNamespace = hl.predef.Blue,
    LspCxxHlSkippedRegion = hl.predef.Grey,
    LspCxxHlSkippedRegionBeginEnd = hl.predef.Red,
    LspDiagnosticsDefaultError = { fg = u.color_gamma(p.red, 0.5) },
    LspDiagnosticsDefaultHint = { fg = u.color_gamma(p.purple, 0.5) },
    LspDiagnosticsDefaultInformation = { fg = u.color_gamma(p.blue, 0.5) },
    LspDiagnosticsDefaultWarning = { fg = u.color_gamma(p.yellow, 0.5) },
    LspDiagnosticsUnderlineError = { underline = true, sp = u.color_gamma(p.red, 0.5) },
    LspDiagnosticsUnderlineHint = { underline = true, sp = u.color_gamma(p.purple, 0.5) },
    LspDiagnosticsUnderlineInformation = { underline = true, sp = u.color_gamma(p.blue, 0.5) },
    LspDiagnosticsUnderlineWarning = { underline = true, sp = u.color_gamma(p.yellow, 0.5) },
    DiagnosticSignError = { fg = u.color_gamma(p.red, 0.5) },
    DiagnosticSignHint = { fg = u.color_gamma(p.purple, 0.5) },
    DiagnosticSignInfo = { fg = u.color_gamma(p.blue, 0.5) },
    DiagnosticSignWarn = { fg = u.color_gamma(p.yellow, 0.5) },
    LspReferenceRead = { bg = p.bg3 },
    LspReferenceWrite = { bg = p.bg3 },
    LspReferenceText = { bg = p.bg3 },
    LspInfoBorder = { fg = p.bg4 },
}

hl.plugins.whichkey = {
    WhichKey = hl.predef.Red,
    WhichKeyDesc = hl.predef.Blue,
    WhichKeyGroup = hl.predef.Orange,
    WhichKeySeperator = hl.predef.Green,
}

hl.plugins.gitgutter = {
    GitGutterAdd = { fg = p.diff_green },
    GitGutterChange = { fg = p.diff_blue },
    GitGutterDelete = { fg = p.diff_red },
}

hl.plugins.diffview = {
    DiffviewFilePanelTitle = { fg = p.blue, bold = true },
    DiffviewFilePanelCounter = { fg = p.purple, bold = true },
    DiffviewFilePanelFileName = hl.predef.Fg,
    DiffviewNormal = hl.common.Normal,
    DiffviewCursorLine = hl.common.CursorLine,
    DiffviewVertSplit = hl.common.VertSplit,
    DiffviewSignColumn = hl.common.SignColumn,
    DiffviewStatusLine = hl.common.StatusLine,
    DiffviewStatusLineNC = hl.common.StatusLineNC,
    DiffviewEndOfBuffer = hl.common.EndOfBuffer,
    DiffviewFilePanelRootPath = hl.predef.Grey,
    DiffviewFilePanelPath = hl.predef.Grey,
    DiffviewFilePanelInsertions = hl.predef.Green,
    DiffviewFilePanelDeletions = hl.predef.Red,
    DiffviewStatusAdded = hl.predef.Green,
    DiffviewStatusUntracked = hl.predef.Blue,
    DiffviewStatusModified = hl.predef.Blue,
    DiffviewStatusRenamed = hl.predef.Blue,
    DiffviewStatusCopied = hl.predef.Blue,
    DiffviewStatusTypeChange = hl.predef.Blue,
    DiffviewStatusUnmerged = hl.predef.Blue,
    DiffviewStatusUnknown = hl.predef.Red,
    DiffviewStatusDeleted = hl.predef.Red,
    DiffviewStatusBroken = hl.predef.Red,
}

hl.plugins.treesitter = {
    commentTSDanger = hl.predef.RedItalic,
    commentTSNote = hl.predef.BlueItalic,
    commentTSWarning = hl.predef.YellowItalic,
}

if u.check_min_version(0, 8, 0) then
    hl.plugins.treesitter = {
        ["@comment"] = { link = "Comment" },
        ["@error"] = { link = "Error" },
        ["@none"] = { bg = "NONE", fg = "NONE" },
        ["@preproc"] = { link = "PreProc" },
        ["@define"] = { link = "Define" },
        ["@operator"] = { link = "Operator" },
        ["@punctuation.delimiter"] = { link = "Delimiter" },
        ["@punctuation.bracket"] = { link = "Delimiter" },
        ["@punctuation.special"] = { link = "Delimiter" },
        ["@string"] = { link = "String" },
        ["@string.regex"] = { link = "String" },
        ["@string.escape"] = { link = "SpecialChar" },
        ["@string.special"] = { link = "SpecialChar" },
        ["@character"] = { link = "Character" },
        ["@character.special"] = { link = "SpecialChar" },
        ["@boolean"] = { link = "Boolean" },
        ["@number"] = { link = "Number" },
        ["@float"] = { link = "Float" },
        ["@function"] = { link = "Function" },
        ["@function.call"] = { link = "Function" },
        ["@function.builtin"] = { link = "Special" },
        ["@function.macro"] = { link = "Macro" },
        ["@method"] = { link = "Function" },
        ["@method.call"] = { link = "Function" },
        ["@constructor"] = { link = "Special" },
        ["@parameter"] = { link = "Identifier" },
        ["@keyword"] = { link = "Keyword" },
        ["@keyword.function"] = { link = "Keyword" },
        ["@keyword.operator"] = { link = "Keyword" },
        ["@keyword.return"] = { link = "Keyword" },
        ["@conditional"] = { link = "Conditional" },
        ["@repeat"] = { link = "Repeat" },
        ["@debug"] = { link = "Debug" },
        ["@label"] = { link = "Label" },
        ["@include"] = { link = "Include" },
        ["@exception"] = { link = "Exception" },
        ["@type"] = { link = "Type" },
        ["@type.builtin"] = { link = "Type" },
        ["@type.qualifier"] = { link = "Type" },
        ["@type.definition"] = { link = "Typedef" },
        ["@storageclass"] = { link = "StorageClass" },
        ["@attribute"] = { link = "PreProc" },
        ["@field"] = { link = "Identifier" },
        ["@property"] = { link = "Function" },
        ["@variable"] = { link = "Normal" },
        ["@variable.builtin"] = { link = "Special" },
        ["@constant"] = { link = "Constant" },
        ["@constant.builtin"] = { link = "Special" },
        ["@constant.macro"] = { link = "Define" },
        ["@namespace"] = { link = "Include" },
        ["@symbol"] = { link = "Identifier" },
        ["@text"] = { link = "Normal" },
        ["@text.strong"] = { bold = true },
        ["@text.emphasis"] = { italic = true },
        ["@text.underline"] = { underline = true },
        ["@text.strike"] = { strikethrough = true },
        ["@text.title"] = { link = "Title" },
        ["@text.literal"] = { link = "String" },
        ["@text.uri"] = { link = "Underlined" },
        ["@text.math"] = { link = "Special" },
        ["@text.environment"] = { link = "Macro" },
        ["@text.environment.name"] = { link = "Type" },
        ["@text.reference"] = { link = "Constant" },
        ["@text.todo"] = { link = "Todo" },
        ["@text.note"] = hl.predef.BlueItalic,
        ["@text.warning"] = hl.predef.YellowItalic,
        ["@text.danger"] = hl.predef.RedItalic,
        ["@tag"] = { link = "Tag" },
        ["@tag.attribute"] = { link = "Identifier" },
        ["@tag.delimiter"] = { link = "Delimiter" },
    }

    hl.plugins.lsp_semantic_tokens = {
        LspNamespace = { link = "@namespace" },
        LspType = { link = "@type" },
        LspClass = { link = "@type" },
        LspEnum = { link = "@constant" },
        LspInterface = { link = "@constant" },
        LspStruct = { link = "@constant" },
        LspTypeParameter = { link = "@type" },
        LspParameter = { link = "@parameter" },
        LspVariable = { link = "@variable" },
        LspProperty = { link = "@property" },
        LspEnumMember = { link = "@constant" },
        LspEvent = { link = "@constant" },
        LspFunction = { link = "@function" },
        LspMethod = { link = "@method" },
        LspMacro = { link = "@constant.macro" },
        LspKeyword = { link = "@keyword" },
        LspModifier = { link = "TSModifier" },
        LspComment = { link = "@comment" },
        LspString = { link = "@string" },
        LspNumber = { link = "@number" },
        LspRegexp = { link = "@string.regex" },
        LspOperator = { link = "@operator" },
        LspDecorator = { link = "@symbol" },
        LspDeprecated = { link = "@text.strike" },
    }
end

hl.plugins.cmp = {
    CmpItemKindDefault = { fg = p.blue, bg = p.none },
    CmpItemAbbrMatch = { fg = p.blue, bg = p.none },
    CmpItemAbbrMatchFuzzy = { fg = p.blue, bg = p.none },

    CmpItemKindKeyword = { fg = p.fg, bg = p.none },

    CmpItemKindVariable = { fg = p.cyan, bg = p.none },
    CmpItemKindConstant = { fg = p.cyan, bg = p.none },
    CmpItemKindReference = { fg = p.cyan, bg = p.none },
    CmpItemKindValue = { fg = p.cyan, bg = p.none },

    CmpItemKindFunction = { fg = p.purple, bg = p.none },
    CmpItemKindMethod = { fg = p.purple, bg = p.none },
    CmpItemKindConstructor = { fg = p.purple, bg = p.none },

    CmpItemKindClass = { fg = p.yellow, bg = p.none },
    CmpItemKindInterface = { fg = p.yellow, bg = p.none },
    CmpItemKindStruct = { fg = p.yellow, bg = p.none },
    CmpItemKindEvent = { fg = p.yellow, bg = p.none },
    CmpItemKindEnum = { fg = p.yellow, bg = p.none },
    CmpItemKindUnit = { fg = p.yellow, bg = p.none },
    CmpItemKindModule = { fg = p.yellow, bg = p.none },

    CmpItemKindProperty = { fg = p.green, bg = p.none },
    CmpItemKindField = { fg = p.green, bg = p.none },
    CmpItemKindTypeParameter = { fg = p.green, bg = p.none },
    CmpItemKindEnumMember = { fg = p.green, bg = p.none },
    CmpItemKindOperator = { fg = p.green, bg = p.none },

    CmpItemKindSnippet = { fg = p.red, bg = p.none },
}

hl.plugins.coc = {
    CocErrorSign = { fg = u.color_gamma(p.red, 0.5) },
    CocHintSign = { fg = u.color_gamma(p.red, 0.5) },
    CocInfoSign = { fg = u.color_gamma(p.red, 0.5) },
    CocWarningSign = { fg = u.color_gamma(p.red, 0.5) },
    FgCocErrorFloatBgCocFloating = { fg = u.color_gamma(p.red, 0.5), bg = p.bg2 },
    FgCocHintFloatBgCocFloating = { fg = u.color_gamma(p.purple, 0.5), bg = p.bg2 },
    FgCocInfoFloatBgCocFloating = { fg = u.color_gamma(p.blue, 0.5), bg = p.bg2 },
    FgCocWarningFloatBgCocFloating = { fg = u.color_gamma(p.yellow, 0.5), bg = p.bg2 },
}

hl.plugins.gitsigns = {
    GitSignsAdd = hl.predef.Green,
    GitSignsAddLn = hl.predef.Green,
    GitSignsAddNr = hl.predef.Green,
    GitSignsChange = hl.predef.Blue,
    GitSignsChangeLn = hl.predef.Blue,
    GitSignsChangeNr = hl.predef.Blue,
    GitSignsDelete = hl.predef.Red,
    GitSignsDeleteLn = hl.predef.Red,
    GitSignsDeleteNr = hl.predef.Red,
}

hl.langs.markdown = {
    markdownBlockquote = hl.predef.Grey,
    markdownBold = { fg = p.none, bold = true },
    markdownBoldDelimiter = hl.predef.Grey,
    markdownCode = hl.predef.Yellow,
    markdownCodeBlock = hl.predef.Yellow,
    markdownCodeDelimiter = hl.predef.Green,
    markdownH1 = { fg = p.red, bold = true },
    markdownH2 = { fg = p.red, bold = true },
    markdownH3 = { fg = p.red, bold = true },
    markdownH4 = { fg = p.red, bold = true },
    markdownH5 = { fg = p.red, bold = true },
    markdownH6 = { fg = p.red, bold = true },
    markdownHeadingDelimiter = hl.predef.Grey,
    markdownHeadingRule = hl.predef.Grey,
    markdownId = hl.predef.Yellow,
    markdownIdDeclaration = hl.predef.Red,
    markdownItalic = { fg = p.none, italic = true },
    markdownItalicDelimiter = { fg = p.grey, italic = true },
    markdownLinkDelimiter = hl.predef.Grey,
    markdownLinkText = hl.predef.Red,
    markdownLinkTextDelimiter = hl.predef.Grey,
    markdownListMarker = hl.predef.Red,
    markdownOrderedListMarker = hl.predef.Red,
    markdownRule = hl.predef.Purple,
    markdownUrl = { fg = p.blue, underline = true },
    markdownUrlDelimiter = hl.predef.Grey,
    markdownUrlTitleDelimiter = hl.predef.Green,
}

hl.langs.scala = {
    scalaNameDefinition = hl.predef.Fg,
    scalaInterpolationBoundary = hl.predef.Purple,
    scalaInterpolation = hl.predef.Purple,
    scalaTypeOperator = hl.predef.Red,
    scalaOperator = hl.predef.Red,
    scalaKeywordModifier = hl.predef.Red,
}

local function load_sync()
    load_highlights(hl.predef)
    load_highlights(hl.common)
    load_highlights(hl.syntax)
    for _, group in pairs(hl.langs) do
        load_highlights(group)
    end
    for _, group in pairs(hl.plugins) do
        load_highlights(group)
    end
end

function M.setup()
    load_sync()
end

return M
