local awful = require("awful")

awful.spawn.with_shell("xset r rate 200 30")
awful.spawn.with_shell("xrandr --output DP-4 --mode 5120x1440")
awful.spawn.with_shell("picom -b")

awful.spawn.with_shell("gsettings set org.gnome.desktop.interface font-name \"Noto Sans\"")
awful.spawn.with_shell("gsettings set org.gnome.desktop.interface document-font-name \"Noto Serif\"")
awful.spawn.with_shell("gsettings set org.gnome.desktop.interface monospace-font-name \"Hack Nerd Font\"")
awful.spawn.with_shell("gsettings set org.gnome.desktop.interface font-antialiasing \"rgba\"")
awful.spawn.with_shell("gsettings set org.gnome.desktop.interface font-hinting \"full\"")
awful.spawn.with_shell("gsettings set org.gnome.desktop.interface color-scheme \"prefer-dark\"")

