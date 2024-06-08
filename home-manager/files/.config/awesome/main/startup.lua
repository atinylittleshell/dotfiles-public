local awful = require("awful")

awful.spawn.with_shell("xset r rate 200 30")
awful.spawn.with_shell("xrandr --output DP-4 --mode 5120x1440")
awful.spawn.with_shell("picom -b")
