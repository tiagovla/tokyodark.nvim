-- for k in pairs(package.loaded) do
--     if k:match(".*tokyodark.*") then
--         package.loaded[k] = nil
--     end
-- end

require("tokyodark").colorscheme()
