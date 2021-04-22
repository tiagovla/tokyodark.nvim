local p = require('tokyodark.palette')
local cfg = require('tokyodark.config')
local u = require('tokyodark.utils')

local M = {}
local hl = {langs = {}, plugins = {}}

local highlight = vim.api.nvim_set_hl
local set_hl_ns = vim.api.nvim__set_hl_ns or vim.api.nvim_set_hl_ns
local create_namespace = vim.api.nvim_create_namespace

local function load_highlights(ns, highlights)
    for group_name, group_settings in pairs(highlights) do
        highlight(ns, group_name, group_settings)
    end
end

hl.predef = {
    Fg = {fg = p.fg},
    Gray = {fg = p.gray},
    Red = {fg = p.red},
    Orange = {fg = p.orange},
    Yellow = {fg = p.yellow},
    Green = {fg = p.green},
    Blue = {fg = p.blue},
    Purple = {fg = p.purple},
    BlueItalic = {fg = p.blue, italic = cfg.enable_italic},
    RedItalic = {fg = p.red, italic = cfg.enable_italic},
    GreenItalic = {fg = p.green, italic = cfg.enable_italic},
    OrangeItalic = {fg = p.orange, italic = cfg.enable_italic}
}

hl.common = {
    Normal = {fg = p.fg, bg = cfg.transparent_background and p.none or p.bg0},
    Terminal = {fg = p.fg, bg = cfg.transparent_background and p.none or p.bg0},
    EndOfBuffer = {fg = p.bg2, bg = cfg.transparent_background and p.none or p.bg0},
    FoldColumn = {fg = p.fg, bg = cfg.transparent_background and p.none or p.bg1},
    Folded = {fg = p.fg, bg = cfg.transparent_background and p.none or p.bg1},
    SignColumn = {fg = p.fg, bg = cfg.transparent_background and p.none or p.bg0},
    ToolbarLine = {fg = p.fg},
    Cursor = {reverse = true},
    vCursor = {reverse = true},
    iCursor = {reverse = true},
    lCursor = {reverse = true},
    CursorIM = {reverse = true},
    CursorColumn = {bg = p.bg1},
    CursorLine = {bg = p.bg1},
    ColorColumn = {bg = p.bg1},
    CursorLineNr = {fg = p.fg},
    LineNr = {fg = p.bg4},
    Conceal = {fg = p.grey, bg = p.bg1},
    DiffAdd = {fg = p.none, bg = p.diff_green},
    DiffChange = {fg = p.none, bg = p.diff_blue},
    DiffDelete = {fg = p.none, bg = p.diff_red},
    DiffText = {fg = p.none, reverse = true},
    Directory = {fg = p.green},
    ErrorMsg = {fg = p.red, bold = true, underline = true},
    WarningMsg = {fg = p.yellow, bold = true},
    ModeMsg = {fg = p.fg, bold = true},
    MoreMsg = {fg = p.blue, bold = true},
    IncSearch = {fg = p.bg0, bg = p.bg_red},
    Search = {fg = p.bg0, bg = p.bg_green},
    MatchParen = {fg = p.none, bg = p.bg4},
    NonText = {fg = p.bg4},
    Whitespace = {fg = p.bg4},
    SpecialKey = {fg = p.bg4},
    Pmenu = {fg = p.fg, bg = p.bg2},
    PmenuSbar = {fg = p.none, bg = p.bg2},
    PmenuSel = {fg = p.bg0, bg = p.bg_green},
    WildMenu = {fg = p.bg0, bg = p.blue},
    PmenuThumb = {fg = p.none, bg = p.grey},
    Question = {fg = p.yellow},
    SpellBad = {fg = p.red, underline = true, sp = p.red},
    SpellCap = {fg = p.yellow, underline = true, sp = p.yellow},
    SpellLocal = {fg = p.blue, underline = true, sp = p.blue},
    SpellRare = {fg = p.purple, underline = true, sp = p.purple},
    StatusLine = {fg = p.fg, bg = p.bg3},
    StatusLineTerm = {fg = p.fg, bg = p.bg3},
    StatusLineNC = {fg = p.grey, bg = p.bg1},
    StatusLineTermNC = {fg = p.grey, bg = p.bg1},
    TabLine = {fg = p.fg, bg = p.bg4},
    TabLineFill = {fg = p.grey, bg = p.bg1},
    TabLineSel = {fg = p.bg0, bg = p.bg_red},
    VertSplit = {fg = p.black},
    Visual = {fg = p.none, bg = p.bg3},
    VisualNOS = {fg = p.none, bg = p.bg3, underline = true},
    QuickFixLine = {fg = p.blue, underline = true},
    Debug = {fg = p.yellow},
    debugPC = {fg = p.bg0, bg = p.green},
    debugBreakpoint = {fg = p.bg0, bg = p.red},
    ToolbarButton = {fg = p.bg0, bg = p.bg_blue}
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
    Comment = {fg = p.bg4, italic = cfg.enable_italic_comment},
    SpecialComment = {fg = p.bg4, italic = cfg.enable_italic_comment},
    Todo = {fg = p.blue, italic = cfg.enable_italic_comment}
}

hl.plugins.lsp = {
    LspCxxHlSkippedRegion = hl.predef.Gray,
    LspCxxHlSkippedRegionBeginEnd = hl.predef.Red,
    LspCxxHlGroupEnumConstant = hl.predef.Orange,
    LspCxxHlGroupNamespace = hl.predef.Blue,
    LspCxxHlGroupMemberVariable = hl.predef.Orange,
    LspDiagnosticsDefaultError = {fg = u.color_gamma(p.red, 0.5)},
    LspDiagnosticsDefaultWarning = {fg = u.color_gamma(p.yellow, 0.5)},
    LspDiagnosticsDefaultInformation = {fg = u.color_gamma(p.blue, 0.5)},
    LspDiagnosticsDefaultHint = {fg = u.color_gamma(p.purple, 0.5)},
    LspDiagnosticsUnderlineError = {underline = true, sp = u.color_gamma(p.red, 0.5)},
    LspDiagnosticsUnderlineWarning = {underline = true, sp = u.color_gamma(p.yellow, 0.5)},
    LspDiagnosticsUnderlineInformation = {underline = true, sp = u.color_gamma(p.blue, 0.5)},
    LspDiagnosticsUnderlineHint = {underline = true, sp = u.color_gamma(p.purple, 0.5)}
}

function M.setup()
    local ns = create_namespace("tokyodark")
    load_highlights(ns, hl.predef)
    load_highlights(ns, hl.common)
    load_highlights(ns, hl.syntax)
    for _, group in pairs(hl.langs) do load_highlights(ns, group) end
    for _, group in pairs(hl.plugins) do load_highlights(ns, group) end
    set_hl_ns(ns)
end

return M

