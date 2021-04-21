local M = {}
local p = require 'tokyo.palette'
local utils = require 'tokyo.utils'
local hl = {}

local config = {bg_transparent = true}

hl.predefined = {
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
    Normal = {fg = p.fg, bg = p.bg0},
    Terminal = {fg = p.fg, bg = p.bg0},
    EndOfBuffer = {fg = p.fg, bg = p.bg0},
    FoldColumn = {fg = p.fg, bg = p.bg1},
    Folded = {fg = p.fg, bg = p.bg1},
    SignColumn = {fg = p.fg, bg = p.bg1},
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
    PmenuSbar = {fg = p.none, bg = p.bg2}
}

hl.syntax = {
    Type = {fg = p.blue},
    Structure = {fg = p.blue},
    StorageClass = {fg = p.blue},
    Identifier = {fg = p.orange},
    Constant = {fg = p.orange},
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
    luaFunc = hl.predefined.Green,
    luaFunction = hl.predefined.Red,
    luaTable = hl.predefined.Fg,
    luaIn = hl.predefined.Red,
    luaFuncCall = hl.predefined.Green,
    luaLocalRed = hl.predefined.Red,
    luaSpecialValue = hl.predefined.Green,
    luaBraces = hl.predefined.Fg,
    luaBuiltIn = hl.predefined.Blue,
    luaNoise = hl.predefined.Grey,
    luaFuncTable = hl.predefined.Blue,
    luaFuncArgName = hl.predefined.Fg,
    luaEllipsis = hl.predefined.Red,
    luaDocTag = hl.predefined.Green
}

hl.python = {
    pythonBuiltin = hl.predefined.BlueItalic,
    pythonExceptio = hl.predefined.Red,
    pythonDecoratorName = hl.predefined.OrangeItalic,
    pythonExClass = hl.predefined.BlueItalic,
    pythonBuiltinType = hl.predefined.BlueItalic,
    pythonBuiltinObj = hl.predefined.OrangeItalic,
    pythonDottedName = hl.predefined.OrangeItalic,
    pythonBuiltinFunc = hl.predefined.Green,
    pythonFunction = hl.predefined.Green,
    pythonDecorator = hl.predefined.OrangeItalic,
    pythonInclude = hl.predefined.Include,
    pythonImport = hl.predefined.PreProc,
    pythonOperator = hl.predefined.Red,
    pythonConditional = hl.predefined.Red,
    pythonRepeat = hl.predefined.Red,
    pythonException = hl.predefined.Red,
    pythonNone = hl.predefined.OrangeItalic,
    pythonCoding = hl.predefined.Grey,
    pythonDot = hl.predefined.Grey
}

hl.lsp = {
    LspCxxHlSkippedRegion = hl.predefined.Gray,
    LspCxxHlSkippedRegionBeginEnd = hl.predefined.Red,
    LspCxxHlGroupEnumConstant = hl.predefined.Orange,
    LspCxxHlGroupNamespace = hl.predefined.Blue,
    LspCxxHlGroupMemberVariable = hl.predefined.Orange
}

hl.json = {
    jsonKeyword = hl.predefined.Red,
    jsonString = hl.predefined.Green,
    jsonBoolean = hl.predefined.Blue,
    jsonNoise = hl.predefined.Grey,
    jsonQuote = hl.predefined.Grey,
    jsonBraces = hl.predefined.Fg
}

hl.yaml = {
    yamlKey = hl.predefined.Red,
    yamlConstant = hl.predefined.BlueItalic,
    yamlString = hl.predefined.Green
}

hl.git_commit = {
    gitcommitSummary = hl.predefined.Red,
    gitcommitUntracked = hl.predefined.Grey,
    gitcommitDiscarded = hl.predefined.Grey,
    gitcommitSelected = hl.predefined.Grey,
    gitcommitUnmerged = hl.predefined.Grey,
    gitcommitOnBranch = hl.predefined.Grey,
    gitcommitArrow = hl.predefined.Grey,
    gitcommitFile = hl.predefined.Green
}

hl.cmake = {
    cmakeCommand = hl.predefined.Red,
    cmakeKWconfigure_package_config_file = hl.predefined.BlueItalic,
    cmakeKWwrite_basic_package_version_file = hl.predefined.BlueItalic,
    cmakeKWExternalProject = hl.predefined.Green,
    cmakeKWadd_compile_definitions = hl.predefined.Green,
    cmakeKWadd_compile_options = hl.predefined.Green,
    cmakeKWadd_custom_command = hl.predefined.Green,
    cmakeKWadd_custom_target = hl.predefined.Green,
    cmakeKWadd_definitions = hl.predefined.Green,
    cmakeKWadd_dependencies = hl.predefined.Green,
    cmakeKWadd_executable = hl.predefined.Green,
    cmakeKWadd_library = hl.predefined.Green,
    cmakeKWadd_link_options = hl.predefined.Green,
    cmakeKWadd_subdirectory = hl.predefined.Green,
    cmakeKWadd_test = hl.predefined.Green,
    cmakeKWbuild_command = hl.predefined.Green,
    cmakeKWcmake_host_system_information = hl.predefined.Green,
    cmakeKWcmake_minimum_required = hl.predefined.Green,
    cmakeKWcmake_parse_arguments = hl.predefined.Green,
    cmakeKWcmake_policy = hl.predefined.Green,
    cmakeKWconfigure_file = hl.predefined.Green,
    cmakeKWcreate_test_sourcelist = hl.predefined.Green,
    cmakeKWctest_build = hl.predefined.Green,
    cmakeKWctest_configure = hl.predefined.Green,
    cmakeKWctest_coverage = hl.predefined.Green,
    cmakeKWctest_memcheck = hl.predefined.Green,
    cmakeKWctest_run_script = hl.predefined.Green,
    cmakeKWctest_start = hl.predefined.Green,
    cmakeKWctest_submit = hl.predefined.Green,
    cmakeKWctest_test = hl.predefined.Green,
    cmakeKWctest_update = hl.predefined.Green,
    cmakeKWctest_upload = hl.predefined.Green,
    cmakeKWdefine_property = hl.predefined.Green,
    cmakeKWdoxygen_add_docs = hl.predefined.Green,
    cmakeKWenable_language = hl.predefined.Green,
    cmakeKWenable_testing = hl.predefined.Green,
    cmakeKWexec_program = hl.predefined.Green,
    cmakeKWexecute_process = hl.predefined.Green,
    cmakeKWexport = hl.predefined.Green,
    cmakeKWexport_library_dependencies = hl.predefined.Green,
    cmakeKWfile = hl.predefined.Green,
    cmakeKWfind_file = hl.predefined.Green,
    cmakeKWfind_library = hl.predefined.Green,
    cmakeKWfind_package = hl.predefined.Green,
    cmakeKWfind_path = hl.predefined.Green,
    cmakeKWfind_program = hl.predefined.Green,
    cmakeKWfltk_wrap_ui = hl.predefined.Green,
    cmakeKWforeach = hl.predefined.Green,
    cmakeKWfunction = hl.predefined.Green,
    cmakeKWget_cmake_property = hl.predefined.Green,
    cmakeKWget_directory_property = hl.predefined.Green,
    cmakeKWget_filename_component = hl.predefined.Green,
    cmakeKWget_property = hl.predefined.Green,
    cmakeKWget_source_file_property = hl.predefined.Green,
    cmakeKWget_target_property = hl.predefined.Green,
    cmakeKWget_test_property = hl.predefined.Green,
    cmakeKWif = hl.predefined.Green,
    cmakeKWinclude = hl.predefined.Green,
    cmakeKWinclude_directories = hl.predefined.Green,
    cmakeKWinclude_external_msproject = hl.predefined.Green,
    cmakeKWinclude_guard = hl.predefined.Green,
    cmakeKWinstall = hl.predefined.Green,
    cmakeKWinstall_files = hl.predefined.Green,
    cmakeKWinstall_programs = hl.predefined.Green,
    cmakeKWinstall_targets = hl.predefined.Green,
    cmakeKWlink_directories = hl.predefined.Green,
    cmakeKWlist = hl.predefined.Green,
    cmakeKWload_cache = hl.predefined.Green,
    cmakeKWload_command = hl.predefined.Green,
    cmakeKWmacro = hl.predefined.Green,
    cmakeKWmark_as_advanced = hl.predefined.Green,
    cmakeKWmath = hl.predefined.Green,
    cmakeKWmessage = hl.predefined.Green,
    cmakeKWoption = hl.predefined.Green,
    cmakeKWproject = hl.predefined.Green,
    cmakeKWqt_wrap_cpp = hl.predefined.Green,
    cmakeKWqt_wrap_ui = hl.predefined.Green,
    cmakeKWremove = hl.predefined.Green,
    cmakeKWseparate_arguments = hl.predefined.Green,
    cmakeKWset = hl.predefined.Green,
    cmakeKWset_directory_properties = hl.predefined.Green,
    cmakeKWset_property = hl.predefined.Green,
    cmakeKWset_source_files_properties = hl.predefined.Green,
    cmakeKWset_target_properties = hl.predefined.Green,
    cmakeKWset_tests_properties = hl.predefined.Green,
    cmakeKWsource_group = hl.predefined.Green,
    cmakeKWstring = hl.predefined.Green,
    cmakeKWsubdirs = hl.predefined.Green,
    cmakeKWtarget_compile_definitions = hl.predefined.Green,
    cmakeKWtarget_compile_features = hl.predefined.Green,
    cmakeKWtarget_compile_options = hl.predefined.Green,
    cmakeKWtarget_include_directories = hl.predefined.Green,
    cmakeKWtarget_link_directories = hl.predefined.Green,
    cmakeKWtarget_link_libraries = hl.predefined.Green,
    cmakeKWtarget_link_options = hl.predefined.Green,
    cmakeKWtarget_precompile_headers = hl.predefined.Green,
    cmakeKWtarget_sources = hl.predefined.Green,
    cmakeKWtry_compile = hl.predefined.Green,
    cmakeKWtry_run = hl.predefined.Green,
    cmakeKWunset = hl.predefined.Green,
    cmakeKWuse_mangled_mesa = hl.predefined.Green,
    cmakeKWvariable_requires = hl.predefined.Green,
    cmakeKWvariable_watch = hl.predefined.Green,
    cmakeKWwrite_file = hl.predefined.Green
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

