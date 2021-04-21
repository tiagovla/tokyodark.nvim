local M = {}
local p = require 'tokyo.palette'
local utils = require 'tokyo.utils'
local function opt_italic(lhs, rhs) vim.tbl_extend('force', lhs, {italic = rhs}) end
local hl = {}

local cfg = {bg_transparent = false, italic_enabled = true}

hl.predef = {
    Fg = {fg = p.fg},
    Gray = {fg = p.gray},
    Red = {fg = p.red},
    Orange = {fg = p.orange},
    Yellow = {fg = p.yellow},
    Green = {fg = p.green},
    Blue = {fg = p.blue},
    Purple = {fg = p.purple},
    BlueItalic = {fg = p.blue, italic = true},
    GreenItalic = {fg = p.green, italic = true},
    RedItalic = {fg = p.red, italic = true}
}

hl.common = {
    Normal = {fg = p.fg, bg = not cfg.bg_transparent and p.bg0},
    Terminal = {fg = p.fg, bg = not cfg.bg_transparent and p.bg0},
    EndOfBuffer = {fg = p.bg2, bg = not cfg.bg_transparent and p.bg0},
    FoldColumn = {fg = p.fg, bg = not cfg.bg_transparent and p.bg1},
    Folded = {fg = p.fg, bg = not cfg.bg_transparent and p.bg1},
    SignColumn = {fg = p.fg, bg = not cfg.bg_transparent and p.bg0},
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
    Conceal = {fg = p.grey, bg = p.bg1},
    DiffAdd = {fg = p.none, bg = p.diff_green},
    DiffChange = {fg = p.none, bg = p.diff_blue},
    DiffDelete = {fg = p.none, bg = p.diff_red},
    DiffText = {fg = p.none, reverse = true},
    Directory = {fg = p.green},
    ErrorMsg = {fg = p.red, bold = true, underline = true},
    WarningMsg = {fg = p.yellow, bg = p.none, bold = true},
    ModeMsg = {fg = p.fg, bg = p.none, bold = true},
    MoreMsg = {fg = p.blue, bg = p.none, bold = true},
    IncSearch = {fg = p.bg0, bg = p.bg_red},
    Search = {fg = p.bg0, bg = p.bg_green},
    MatchParen = {fg = p.none, bg = p.bg4},
    NonText = {fg = p.bg4},
    Whitespace = {fg = p.bg4},
    SpecialKey = {fg = p.bg4},
    Pmenu = {fg = p.fg, bg = p.bg2},
    PmenuSbar = {fg = p.none, bg = p.bg2},
    PmenuSel = {fg = p.bg0, bg = p.blue},
    WildMenu = {fg = p.bg0, bg = p.blue},
    PmenuThumb = {fg = p.none, bg = p.grey},
    Question = {fg = p.yellow, bg = p.none},
    SpellBad = {fg = p.red, bg = p.none, underline = true, sp = p.red},
    SpellCap = {fg = p.yellow, bg = p.none, underline = true, sp = p.yellow},
    SpellLocal = {fg = p.blue, bg = p.none, underline = true, sp = p.blue},
    SpellRare = {fg = p.purple, bg = p.none, underline = true, sp = p.purple},
    StatusLine = {fg = p.fg, bg = p.bg3},
    StatusLineTerm = {fg = p.fg, bg = p.bg3},
    StatusLineNC = {fg = p.grey, bg = p.bg1},
    StatusLineTermNC = {fg = p.grey, bg = p.bg1},
    TabLine = {fg = p.fg, bg = p.bg4},
    TabLineFill = {fg = p.grey, bg = p.bg1},
    TabLineSel = {fg = p.bg0, bg = p.bg_red},
    VertSplit = {fg = p.black, bg = p.none},
    Visual = {fg = p.none, bg = p.bg3},
    VisualNOS = {fg = p.none, bg = p.bg3, underline = true},
    QuickFixLine = {fg = p.blue, bg = p.none, underline = true},
    Debug = {fg = p.yellow, bg = p.none},
    debugPC = {fg = p.bg0, bg = p.green},
    debugBreakpoint = {fg = p.bg0, bg = p.red},
    ToolbarButton = {fg = p.bg0, bg = p.bg_blue}
}

hl.syntax = {
    Type = {fg = p.blue, italic = cfg.italic_enabled},
    Structure = {fg = p.blue, italic = cfg.italic_enabled},
    StorageClass = {fg = p.blue, italic = cfg.italic_enabled},
    Identifier = {fg = p.orange, italic = cfg.italic_enabled},
    Constant = {fg = p.orange, italic = cfg.italic_enabled},
    PreProc = {fg = p.red},
    PreCondit = {fg = p.red},
    Include = {fg = p.red},
    Keyword = {fg = p.red},
    Define = {fg = p.red},
    Typedef = {fg = p.red},
    Exception = {fg = p.red},
    Conditional = {fg = p.red},
    Repeat = {fg = p.red},
    Statement = {fg = p.red},
    Macro = {fg = p.purple},
    Error = {fg = p.red},
    Label = {fg = p.purple},
    Special = {fg = p.purple},
    SpecialChar = {fg = p.purple},
    Boolean = {fg = p.purple},
    String = {fg = p.yellow},
    Character = {fg = p.yellow},
    Number = {fg = p.purple},
    Float = {fg = p.purple},
    Function = {fg = p.green},
    Operator = {fg = p.red},
    Title = {fg = p.red},
    Tag = {fg = p.orange},
    Delimiter = {fg = p.fg},
    Comment = {fg = p.gray, italic = true},
    SpecialComment = {fg = p.grey},
    Todo = {fg = p.blue}
}

hl.lua = {
    luaFunc = hl.predef.Green,
    luaFunction = hl.predef.Red,
    luaTable = hl.predef.Fg,
    luaIn = hl.predef.Red,
    luaFuncCall = hl.predef.Green,
    luaLocalRed = hl.predef.Red,
    luaSpecialValue = hl.predef.Green,
    luaBraces = hl.predef.Fg,
    luaBuiltIn = opt_italic(hl.predef.Blue, cfg.italic_enabled),
    luaNoise = hl.predef.Grey,
    luaLabel = hl.predef.Purple,
    luaFuncTable = opt_italic(hl.predef.Blue, cfg.italic_enabled),
    luaFuncArgName = hl.predef.Fg,
    luaEllipsis = hl.predef.Red,
    luaDocTag = hl.predef.Green
}

hl.python = {
    pythonBuiltin = opt_italic(hl.predef.Blue, {italic = cfg.italic_enabled}),
    pythonExceptio = hl.predef.Red,
    pythonDecoratorName = opt_italic(hl.predef.Orange, cfg.italic_enabled),
    pythonExClass = opt_italic(hl.predef.Blue, cfg.italic_enabled),
    pythonBuiltinType = opt_italic(hl.predef.Blue, cfg.italic_enabled),
    pythonBuiltinObj = opt_italic(hl.predef.Orange, cfg.italic_enabled),
    pythonDottedName = opt_italic(hl.predef.Orange, cfg.italic_enabled),
    pythonBuiltinFunc = hl.predef.Green,
    pythonFunction = hl.predef.Green,
    pythonDecorator = opt_italic(hl.predef.Orange, cfg.italic_enabled),
    pythonInclude = hl.syntax.Include,
    pythonImport = hl.syntax.PreProc,
    pythonOperator = hl.predef.Red,
    pythonConditional = hl.predef.Red,
    pythonRepeat = hl.predef.Red,
    pythonException = hl.predef.Red,
    pythonNone = opt_italic(hl.predef.Orange, cfg.italic_enabled),
    pythonCoding = hl.predef.Grey,
    pythonDot = hl.predef.Grey
}

hl.lsp = {
    LspCxxHlSkippedRegion = hl.predef.Gray,
    LspCxxHlSkippedRegionBeginEnd = hl.predef.Red,
    LspCxxHlGroupEnumConstant = hl.predef.Orange,
    LspCxxHlGroupNamespace = hl.predef.Blue,
    LspCxxHlGroupMemberVariable = hl.predef.Orange
}

hl.json = {
    jsonKeyword = hl.predef.Red,
    jsonString = hl.predef.Green,
    jsonBoolean = hl.predef.Blue,
    jsonNoise = hl.predef.Grey,
    jsonQuote = hl.predef.Grey,
    jsonBraces = hl.predef.Fg
}

hl.yaml = {
    yamlKey = hl.predef.Red,
    yamlConstant = hl.predef.BlueItalic,
    yamlString = hl.predef.Green
}

hl.git_commit = {
    gitcommitSummary = hl.predef.Red,
    gitcommitUntracked = hl.predef.Grey,
    gitcommitDiscarded = hl.predef.Grey,
    gitcommitSelected = hl.predef.Grey,
    gitcommitUnmerged = hl.predef.Grey,
    gitcommitOnBranch = hl.predef.Grey,
    gitcommitArrow = hl.predef.Grey,
    gitcommitFile = hl.predef.Green
}

hl.cmake = {
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

local highlight = vim.api.nvim_set_hl
local set_hl_ns = vim.api.nvim__set_hl_ns
local create_namespace = vim.api.nvim_create_namespace

function M.set_hl()
    vim.cmd("hi clear")
    if vim.fn.exists("syntax_on") then vim.cmd("syntax reset") end
    vim.o.background = "dark"
    vim.o.termguicolors = true
    vim.g.colors_name = "tokyo"
    local ns = create_namespace("tokyo")
    for _, group in pairs(hl) do
        for group_name, group_settings in pairs(group) do
            if group_settings.link ~= nil then
                print(group_settings.link)
            end
            highlight(ns, group_name, group_settings)
            -- print(group_name)
        end
    end
    set_hl_ns(ns)

end

return M
-- utils.tprint(hl)

