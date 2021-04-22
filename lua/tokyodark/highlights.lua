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
    Title = hl.predef.Red,
    Tag = hl.predef.Orange,
    Delimiter = hl.predef.Fg,
    Comment = {fg = p.bg4, italic = cfg.enable_italic_comment},
    SpecialComment = {fg = p.bg4, italic = cfg.enable_italic_comment},
    Todo = {fg = p.blue, italic = cfg.enable_italic_comment}
}

hl.langs.lua = {
    luaFunc = hl.predef.Green,
    luaFunction = hl.predef.Red,
    luaTable = hl.predef.Fg,
    luaIn = hl.predef.Red,
    luaFuncCall = hl.predef.Green,
    luaLocalRed = hl.predef.Red,
    luaSpecialValue = hl.predef.Green,
    luaBraces = hl.predef.Fg,
    luaBuiltIn = hl.predef.BlueItalic,
    luaNoise = hl.predef.Grey,
    luaLabel = hl.predef.Purple,
    luaFuncTable = hl.predef.BlueItalic,
    luaFuncArgName = hl.predef.Fg,
    luaEllipsis = hl.predef.Red,
    luaDocTag = hl.predef.Green
}

hl.langs.python = {
    pythonBuiltin = hl.predef.BlueItalic,
    pythonExceptio = hl.predef.Red,
    pythonDecoratorName = hl.predef.OrangeItalic,
    pythonExClass = hl.predef.BlueItalic,
    pythonBuiltinType = hl.predef.BlueItalic,
    pythonBuiltinObj = hl.predef.OrangeItalic,
    pythonDottedName = hl.predef.OrangeItalic,
    pythonBuiltinFunc = hl.predef.Green,
    pythonFunction = hl.predef.Green,
    pythonDecorator = hl.predef.OrangeItalic,
    pythonInclude = hl.syntax.Include,
    pythonImport = hl.syntax.PreProc,
    pythonOperator = hl.predef.Red,
    pythonConditional = hl.predef.Red,
    pythonRepeat = hl.predef.Red,
    pythonException = hl.predef.Red,
    pythonNone = hl.predef.OrangeItalic,
    pythonCoding = hl.predef.Grey,
    pythonDot = hl.predef.Grey
}

hl.langs.json = {
    jsonKeyword = hl.predef.Red,
    jsonString = hl.predef.Green,
    jsonBoolean = hl.predef.Blue,
    jsonNoise = hl.predef.Grey,
    jsonQuote = hl.predef.Grey,
    jsonBraces = hl.predef.Fg
}

hl.langs.yaml = {
    yamlKey = hl.predef.Red,
    yamlConstant = hl.predef.BlueItalic,
    yamlString = hl.predef.Green
}

hl.langs.latex = {
    texStatement = hl.predef.BlueItalic,
    texOnlyMath = hl.predef.Grey,
    texDefName = hl.predef.Yellow,
    texNewCmd = hl.predef.Orange,
    texCmdName = hl.predef.Blue,
    texBeginEnd = hl.predef.Red,
    texBeginEndName = hl.predef.Green,
    texDocType = hl.predef.RedItalic,
    ttexDocTypeArgs = hl.predef.Orange,
    texInputFile = hl.predef.Green
}

hl.langs.cmake = {
    cmakeCommand = hl.predef.Red,
    cmakeKWconfigure_package_config_file = hl.predef.BlueItalic,
    cmakeKWwrite_basic_package_version_file = hl.predef.BlueItalic,
    cmakeKWExternalProject = hl.predef.Green,
    cmakeKWadd_compile_definitions = hl.predef.Green,
    cmakeKWadd_compile_options = hl.predef.Green,
    cmakeKWadd_custom_command = hl.predef.Green,
    cmakeKWadd_custom_target = hl.predef.Green,
    cmakeKWadd_definitions = hl.predef.Green,
    cmakeKWadd_dependencies = hl.predef.Green,
    cmakeKWadd_executable = hl.predef.Green,
    cmakeKWadd_library = hl.predef.Green,
    cmakeKWadd_link_options = hl.predef.Green,
    cmakeKWadd_subdirectory = hl.predef.Green,
    cmakeKWadd_test = hl.predef.Green,
    cmakeKWbuild_command = hl.predef.Green,
    cmakeKWcmake_host_system_information = hl.predef.Green,
    cmakeKWcmake_minimum_required = hl.predef.Green,
    cmakeKWcmake_parse_arguments = hl.predef.Green,
    cmakeKWcmake_policy = hl.predef.Green,
    cmakeKWconfigure_file = hl.predef.Green,
    cmakeKWcreate_test_sourcelist = hl.predef.Green,
    cmakeKWctest_build = hl.predef.Green,
    cmakeKWctest_configure = hl.predef.Green,
    cmakeKWctest_coverage = hl.predef.Green,
    cmakeKWctest_memcheck = hl.predef.Green,
    cmakeKWctest_run_script = hl.predef.Green,
    cmakeKWctest_start = hl.predef.Green,
    cmakeKWctest_submit = hl.predef.Green,
    cmakeKWctest_test = hl.predef.Green,
    cmakeKWctest_update = hl.predef.Green,
    cmakeKWctest_upload = hl.predef.Green,
    cmakeKWdefine_property = hl.predef.Green,
    cmakeKWdoxygen_add_docs = hl.predef.Green,
    cmakeKWenable_language = hl.predef.Green,
    cmakeKWenable_testing = hl.predef.Green,
    cmakeKWexec_program = hl.predef.Green,
    cmakeKWexecute_process = hl.predef.Green,
    cmakeKWexport = hl.predef.Green,
    cmakeKWexport_library_dependencies = hl.predef.Green,
    cmakeKWfile = hl.predef.Green,
    cmakeKWfind_file = hl.predef.Green,
    cmakeKWfind_library = hl.predef.Green,
    cmakeKWfind_package = hl.predef.Green,
    cmakeKWfind_path = hl.predef.Green,
    cmakeKWfind_program = hl.predef.Green,
    cmakeKWfltk_wrap_ui = hl.predef.Green,
    cmakeKWforeach = hl.predef.Green,
    cmakeKWfunction = hl.predef.Green,
    cmakeKWget_cmake_property = hl.predef.Green,
    cmakeKWget_directory_property = hl.predef.Green,
    cmakeKWget_filename_component = hl.predef.Green,
    cmakeKWget_property = hl.predef.Green,
    cmakeKWget_source_file_property = hl.predef.Green,
    cmakeKWget_target_property = hl.predef.Green,
    cmakeKWget_test_property = hl.predef.Green,
    cmakeKWif = hl.predef.Green,
    cmakeKWinclude = hl.predef.Green,
    cmakeKWinclude_directories = hl.predef.Green,
    cmakeKWinclude_external_msproject = hl.predef.Green,
    cmakeKWinclude_guard = hl.predef.Green,
    cmakeKWinstall = hl.predef.Green,
    cmakeKWinstall_files = hl.predef.Green,
    cmakeKWinstall_programs = hl.predef.Green,
    cmakeKWinstall_targets = hl.predef.Green,
    cmakeKWlink_directories = hl.predef.Green,
    cmakeKWlist = hl.predef.Green,
    cmakeKWload_cache = hl.predef.Green,
    cmakeKWload_command = hl.predef.Green,
    cmakeKWmacro = hl.predef.Green,
    cmakeKWmark_as_advanced = hl.predef.Green,
    cmakeKWmath = hl.predef.Green,
    cmakeKWmessage = hl.predef.Green,
    cmakeKWoption = hl.predef.Green,
    cmakeKWproject = hl.predef.Green,
    cmakeKWqt_wrap_cpp = hl.predef.Green,
    cmakeKWqt_wrap_ui = hl.predef.Green,
    cmakeKWremove = hl.predef.Green,
    cmakeKWseparate_arguments = hl.predef.Green,
    cmakeKWset = hl.predef.Green,
    cmakeKWset_directory_properties = hl.predef.Green,
    cmakeKWset_property = hl.predef.Green,
    cmakeKWset_source_files_properties = hl.predef.Green,
    cmakeKWset_target_properties = hl.predef.Green,
    cmakeKWset_tests_properties = hl.predef.Green,
    cmakeKWsource_group = hl.predef.Green,
    cmakeKWstring = hl.predef.Green,
    cmakeKWsubdirs = hl.predef.Green,
    cmakeKWtarget_compile_definitions = hl.predef.Green,
    cmakeKWtarget_compile_features = hl.predef.Green,
    cmakeKWtarget_compile_options = hl.predef.Green,
    cmakeKWtarget_include_directories = hl.predef.Green,
    cmakeKWtarget_link_directories = hl.predef.Green,
    cmakeKWtarget_link_libraries = hl.predef.Green,
    cmakeKWtarget_link_options = hl.predef.Green,
    cmakeKWtarget_precompile_headers = hl.predef.Green,
    cmakeKWtarget_sources = hl.predef.Green,
    cmakeKWtry_compile = hl.predef.Green,
    cmakeKWtry_run = hl.predef.Green,
    cmakeKWunset = hl.predef.Green,
    cmakeKWuse_mangled_mesa = hl.predef.Green,
    cmakeKWvariable_requires = hl.predef.Green,
    cmakeKWvariable_watch = hl.predef.Green,
    cmakeKWwrite_file = hl.predef.Green
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

hl.plugins.git_commit = {
    gitcommitSummary = hl.predef.Red,
    gitcommitUntracked = hl.predef.Grey,
    gitcommitDiscarded = hl.predef.Grey,
    gitcommitSelected = hl.predef.Grey,
    gitcommitUnmerged = hl.predef.Grey,
    gitcommitOnBranch = hl.predef.Grey,
    gitcommitArrow = hl.predef.Grey,
    gitcommitFile = hl.predef.Green
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

