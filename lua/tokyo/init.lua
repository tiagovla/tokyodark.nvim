local M = {}

function M.setup() require('tokyo.theme').set_hl() end


-- vim.cmd [[augroup Tokyo]]
-- vim.cmd [[  autocmd!]]
-- vim.cmd [[  autocmd ColorScheme * lua require("tokyo.theme").set_hl()]]

return M
