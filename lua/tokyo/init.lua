local M = {}
local hl = require('tokyo.theme')

local highlight = vim.api.nvim_set_hl
local set_hl_ns = vim.api.nvim__set_hl_ns or vim.api.nvim_set_hl_ns
local create_namespace = vim.api.nvim_create_namespace

local function colorscheme()
    vim.cmd("hi clear")
    if vim.fn.exists("syntax_on") then vim.cmd("syntax reset") end
    vim.o.background = "dark"
    vim.o.termguicolors = true
    local ns = create_namespace("tokyo")
    for _, group in pairs(hl) do
        for group_name, group_settings in pairs(group) do
            highlight(ns, group_name, group_settings)
        end
    end
    set_hl_ns(ns)
end

function M.setup() colorscheme() end

return M
