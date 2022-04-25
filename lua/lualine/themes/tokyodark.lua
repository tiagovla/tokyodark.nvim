-- Copyright (c) 2021-2022 tiagovla
-- License: MIT
--
local p = require("tokyodark.palette")
local colors = {
    bg = p.bg1,
    fg = p.fg,
    red = p.red,
    green = p.green,
    yellow = p.yellow,
    blue = p.blue,
    purple = p.purple,
    cyan = p.cyan,
    grey = p.grey,
}

local tokyo_dark = {
    inactive = {
        a = { fg = colors.grey, bg = colors.bg, gui = "bold" },
        b = { fg = colors.grey, bg = colors.bg },
        c = { fg = colors.grey, bg = colors.bg },
        x = { fg = colors.grey, bg = colors.bg },
        y = { fg = colors.grey, bg = colors.bg },
        z = { fg = colors.grey, bg = colors.bg },
    },
    normal = {
        a = { fg = colors.bg, bg = colors.green, gui = "bold" },
        b = { fg = colors.fg, bg = colors.bg },
        c = { fg = colors.fg, bg = colors.bg },
        x = { fg = colors.fg, bg = colors.bg },
        y = { fg = colors.fg, bg = colors.bg },
        z = { fg = colors.fg, bg = colors.bg },
    },
    visual = { a = { fg = colors.bg, bg = colors.purple, gui = "bold" } },
    replace = { a = { fg = colors.bg, bg = colors.red, gui = "bold" } },
    insert = { a = { fg = colors.bg, bg = colors.blue, gui = "bold" } },
}

local mt = {}
function mt:__index(k)
    if k == "colors" then
        return colors
    end
end

tokyo_dark = setmetatable(tokyo_dark, mt)

return tokyo_dark
