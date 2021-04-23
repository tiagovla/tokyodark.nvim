-- Copyright (c) 2021-2021 tiagovla
-- License: MIT
--
local p = require('tokyodark.palette')
local colors = {
    bg = p.bg0,
    fg = p.fg,
    red = p.red,
    green = p.green,
    yellow = p.yellow,
    blue = p.blue,
    purple = p.purple,
    cyan = p.cyan,
    gray = p.grey
}

local tokyo_night = {
    inactive = {
        a = {fg = colors.gray, bg = colors.bg, gui = 'bold'},
        b = {fg = colors.gray, bg = colors.bg},
        c = {fg = colors.bg, bg = colors.bg},
        z = {fg = colors.gray, bg = colors.bg}
    },
    normal = {
        a = {fg = colors.bg, bg = colors.green, gui = 'bold'},
        b = {fg = colors.fg, bg = colors.bg},
        c = {fg = colors.fg, bg = colors.bg},
        z = {fg = colors.fg, bg = colors.bg}
    },
    visual = {a = {fg = colors.bg, bg = colors.purple, gui = 'bold'}},
    replace = {a = {fg = colors.bg, bg = colors.red, gui = 'bold'}},
    insert = {a = {fg = colors.bg, bg = colors.blue, gui = 'bold'}}
}

return tokyo_night
