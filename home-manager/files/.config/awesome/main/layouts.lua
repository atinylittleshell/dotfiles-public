local awful = require("awful")
local lain = require("lain")

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
  lain.layout.centerwork,
  awful.layout.suit.floating,
}
