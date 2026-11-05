vim.opt.runtimepath:prepend(vim.fn.getcwd())

local function highlight(name)
    return vim.api.nvim_get_hl(0, { name = name, link = false })
end

-- Each case needs fresh configuration so setup() state cannot leak between tests.
local function test(name, run)
    for module in pairs(package.loaded) do
        if
            module:match("^tokyodark")
            or module == "lualine.themes.tokyodark"
        then
            package.loaded[module] = nil
        end
    end
    run(require("tokyodark"))
    print("PASS: " .. name)
end

-- Loading without setup() must apply defaults and initialize terminal colors.
test("default colorscheme loads with terminal colors", function()
    vim.cmd("colorscheme tokyodark")
    assert(vim.g.colors_name == "tokyodark", "wrong colorscheme name")
    assert(highlight("Normal").bg == 0x11121D, "wrong default background")
    assert(highlight("Comment").italic, "comments should default to italic")
    assert(vim.g.terminal_color_1 == "#ee6d85", "wrong terminal red")
end)

-- Partial style overrides must preserve defaults for unspecified categories.
test("partial styles preserve other defaults", function(theme)
    theme.setup({ styles = { comments = { italic = false } } })
    theme.colorscheme()
    assert(not highlight("Comment").italic, "comment style was ignored")
    assert(highlight("Keyword").italic, "default keyword style was lost")
end)

-- Empty category tables disable styles; a deep merge would restore italics.
test("empty comment style disables italic", function(theme)
    theme.setup({ styles = { comments = {} } })
    theme.colorscheme()
    assert(not highlight("Comment").italic, "empty comment style was ignored")
    assert(highlight("Keyword").italic, "default keyword style was lost")
end)

-- Reapplying must use new options instead of values captured by cached modules.
test("reapplying uses new palette, styles, and transparency", function(theme)
    theme.colorscheme()
    theme.setup({
        custom_palette = { fg = "#123456", bg0 = "#234567", red = "#345678" },
        styles = { comments = { italic = false } },
        transparent_background = true,
    })
    theme.colorscheme()
    assert(highlight("Normal").fg == 0x123456, "foreground is stale")
    assert(highlight("Normal").bg == nil, "transparency was ignored")
    assert(not highlight("Comment").italic, "comment style is stale")
    assert(vim.g.terminal_color_1 == "#345678", "terminal palette is stale")
    theme.setup({ transparent_background = false })
    vim.cmd("colorscheme tokyodark")
    assert(highlight("Normal").bg == 0x234567, "background was not restored")
end)

-- Lualine can load the palette before setup(), so its cache must refresh too.
test("preloading Lualine does not freeze its palette", function(theme)
    require("lualine.themes.tokyodark")
    theme.setup({ custom_palette = { bg1 = "#123456" } })
    theme.colorscheme()
    local lualine = require("lualine.themes.tokyodark")
    assert(lualine.normal.c.bg == "#123456", "Lualine palette is stale")
end)

-- Rebuild from fresh colors so repeated loads do not compound gamma correction.
-- Custom callbacks must rerun, and removed overrides must disappear.
test("callbacks rerun without compounding gamma", function(theme)
    local calls = 0
    theme.setup({
        gamma = 2,
        custom_palette = function()
            calls = calls + 1
            return { red = "#404040" }
        end,
        custom_highlights = function(_, palette)
            return { TestProbe = { fg = palette.red } }
        end,
    })
    for _ = 1, 2 do
        theme.colorscheme()
        assert(highlight("TestProbe").fg == 0x7F7F7F, "wrong callback color")
        assert(vim.g.terminal_color_1 == "#7f7f7f", "gamma compounded")
    end
    assert(calls == 2, "palette callback did not rerun")
    theme.setup({ gamma = 1, custom_palette = {}, custom_highlights = {} })
    theme.colorscheme()
    assert(highlight("TestProbe").fg == nil, "removed override survived")
    assert(highlight("Error").fg == 0xEE6D85, "default red was not restored")
end)

-- Opting out must preserve terminal colors supplied by another theme or plugin.
test("disabled terminal colors preserve existing values", function(theme)
    vim.g.terminal_color_1 = "#123456"
    theme.setup({ terminal_colors = false })
    theme.colorscheme()
    assert(vim.g.terminal_color_1 == "#123456", "terminal color changed")
end)
