local awful = require("awful")
local vars = require("main.vars")

local M = {}

M.right_click_menu = awful.menu({
  items = {
    { "manual", vars.terminal .. " -e man awesome" },
    { "restart", awesome.restart },
  },
})

return M
