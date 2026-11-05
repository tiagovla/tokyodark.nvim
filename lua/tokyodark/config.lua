local config = {}

local default_config = {
    transparent_background = false,
    gamma = 1.00,
    styles = {
        comments = { italic = true },
        keywords = { italic = true },
        identifiers = { italic = true },
        functions = {},
        variables = {},
    },
    custom_highlights = {} or function(highlights, palette) end,
    custom_palette = {} or function(palette) end,
    terminal_colors = true,
}

function config.setup(opts)
    for k, v in pairs(opts or {}) do
        if k == "styles" then
            config[k] = vim.tbl_extend("force", {}, default_config.styles, v)
        elseif type(v) == "table" then
            config[k] = {}
            for kk, vv in pairs(v) do
                config[k][kk] = vv
            end
        else
            config[k] = v
        end
    end
end

return setmetatable(config, { __index = default_config })
