local awful = require("awful")
local gears = require("gears")
local menus = require("main.menus")

root.buttons(gears.table.join(awful.button({}, 3, function()
  menus.right_click_menu:toggle()
end)))
