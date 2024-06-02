local awful = require("awful")
local gears = require("gears")
local vars = require("main.vars")

local M = gears.table.join(
  -- Float
  awful.key({ vars.modkey }, "f", awful.client.floating.toggle, { description = "toggle floating", group = "client" }),

  -- Kill
  awful.key({ vars.modkey }, "q", function(c)
    c:kill()
  end, { description = "close", group = "client" }),

  -- Master
  awful.key({ vars.modkey }, "m", function(c)
    c:swap(awful.client.getmaster())
  end, { description = "move to master", group = "client" })
)

return M
