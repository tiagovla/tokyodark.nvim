local color_gamma = require('tokyo.utils').color_gamma
local gamma = require('tokyo.config').gamma

local colors = {
    black = '#06080A',
    bg0 = '#11121D',
    bg1 = '#1A1B2A',
    bg2 = '#212234',
    bg3 = '#392B41',
    bg4 = '#4A5057',
    bg_red = '#F6718A',
    diff_red = '#773440',
    bg_green = '#B0E973',
    diff_green = '#587738',
    bg_blue = '#749DF6',
    diff_blue = '#354A77',
    fg = '#A0A8CD',
    red = '#EE6D85',
    orange = '#F6955B',
    yellow = '#D7A65F',
    green = '#95C561',
    blue = '#7199EE',
    purple = '#A485DD',
    grey = '#3b4261',
    none = 'NONE'
}
local function gamma_correction(colors)
    local colors_corrected = {}
    for k, v in pairs(colors) do colors_corrected[k] = color_gamma(v, gamma) end
    return colors_corrected
end

return gamma_correction(colors)
