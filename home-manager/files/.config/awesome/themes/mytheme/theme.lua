local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local theme = {}

--Colorscheme
theme.background_dark = "#23213660"
theme.background_lighter = "#39355260"
theme.white = "#e0def4"
theme.blueish_white = "#89b4fa"
theme.red = "#eb6f92"
theme.green = "#9ccfd8"
theme.yellow = "#f6c177"
theme.blue = "#3e8fb0"
theme.magenta = "#c4a7e7"
theme.cyan = "#9ccfd8"

theme.font = "Hack Nerd Font 10"
theme.fg = theme.white
theme.bg = theme.background_dark
theme.bg_normal = theme.background_dark
theme.fg_normal = theme.white
theme.bg_focus = theme.background_lighter
theme.fg_focus = theme.white
theme.border_width = 2
theme.border_normal = theme.background_dark
theme.border_focus = theme.blue
theme.useless_gap = 3
theme.bg_systray = theme.background_dark

theme.logout_box_bg = "#00000090"

--Default wallpaper
theme.wallpaper = "~/.wallpapers/5.png"

--Close Button
theme.titlebar_close_button_normal = "~/.config/awesome/themes/mytheme/titlebar_icons/inactive.png"
theme.titlebar_close_button_focus = "~/.config/awesome/themes/mytheme/titlebar_icons/close.png"
theme.titlebar_close_button_normal_hover = "~/.config/awesome/themes/mytheme/titlebar_icons/close_hover.png"
theme.titlebar_close_button_focus_hover = "~/.config/awesome/themes/mytheme/titlebar_icons/close_hover.png"

--Maximized Button
theme.titlebar_maximized_button_normal_inactive = "~/.config/awesome/themes/mytheme/titlebar_icons/inactive.png"
theme.titlebar_maximized_button_focus_inactive = "~/.config/awesome/themes/mytheme/titlebar_icons/maximize.png"
theme.titlebar_maximized_button_normal_active = "~/.config/awesome/themes/mytheme/titlebar_icons/inactive.png"
theme.titlebar_maximized_button_focus_active = "~/.config/awesome/themes/mytheme/titlebar_icons/maximize.png"
theme.titlebar_maximized_button_normal_inactive_hover =
  "~/.config/awesome/themes/mytheme/titlebar_icons/maximize-hover.png"
theme.titlebar_maximized_button_focus_inactive_hover =
  "~/.config/awesome/themes/mytheme/titlebar_icons/maximize-hover.png"
theme.titlebar_maximized_button_normal_active_hover =
  "~/.config/awesome/themes/mytheme/titlebar_icons/maximize-hover.png"
theme.titlebar_maximized_button_focus_active_hover =
  "~/.config/awesome/themes/mytheme/titlebar_icons/maximize-hover.png"

--Minimize Button
theme.titlebar_minimize_button_normal = "~/.config/awesome/themes/mytheme/titlebar_icons/inactive.png"
theme.titlebar_minimize_button_focus = "~/.config/awesome/themes/mytheme/titlebar_icons/minimize.png"
theme.titlebar_minimize_button_normal_hover = "~/.config/awesome/themes/mytheme/titlebar_icons/minimize_hover.png"

theme.titlebar_minimize_button_focus_hover = "~/.config/awesome/themes/mytheme/titlebar_icons/minimize_hover.png"

--Sticky Button
theme.titlebar_sticky_button_normal_inactive = "~/.config/awesome/themes/mytheme/titlebar_icons/inactive.png"
theme.titlebar_sticky_button_focus_inactive = "~/.config/awesome/themes/mytheme/titlebar_icons/pin.png"
theme.titlebar_sticky_button_normal_active = "~/.config/awesome/themes/mytheme/titlebar_icons/inactive.png"
theme.titlebar_sticky_button_focus_active = "~/.config/awesome/themes/mytheme/titlebar_icons/pin2.png"

--Disable icons in tasklist
theme.tasklist_disable_task_name = true

--Tasklist Themesmin
theme.tasklist_bg_minimize = theme.background_lighter
theme.tasklist_bg_focus = theme.background_lighter
theme.tasklist_shape_border_width = 3
theme.tasklist_shape_border_color = theme.background_lighter
theme.tasklist_shape_border_color_focus = theme.cyan
theme.tasklist_shape_border_color_minimized = theme.magenta
theme.tasklist_shape_border_color_urgent = theme.yellow

-- Default layout icons
theme.layout_fairh = "/usr/share/awesome/themes/default/layouts/fairhw.png"
theme.layout_fairv = "/usr/share/awesome/themes/default/layouts/fairvw.png"
theme.layout_floating = "/usr/share/awesome/themes/default/layouts/floatingw.png"
theme.layout_magnifier = "/usr/share/awesome/themes/default/layouts/magnifierw.png"
theme.layout_max = "/usr/share/awesome/themes/default/layouts/maxw.png"
theme.layout_fullscreen = "/usr/share/awesome/themes/default/layouts/fullscreenw.png"
theme.layout_tilebottom = "/usr/share/awesome/themes/default/layouts/tilebottomw.png"
theme.layout_tileleft = "/usr/share/awesome/themes/default/layouts/tileleftw.png"
theme.layout_tile = "/usr/share/awesome/themes/default/layouts/tilew.png"
theme.layout_tiletop = "/usr/share/awesome/themes/default/layouts/tiletopw.png"
theme.layout_spiral = "/usr/share/awesome/themes/default/layouts/spiralw.png"
theme.layout_dwindle = "/usr/share/awesome/themes/default/layouts/dwindlew.png"
theme.layout_cornernw = "/usr/share/awesome/themes/default/layouts/cornernw.png"
theme.layout_cornerne = "/usr/share/awesome/themes/default/layouts/cornerne.png"
theme.layout_cornersw = "/usr/share/awesome/themes/default/layouts/cornersw.png"
theme.layout_cornerse = "/usr/share/awesome/themes/default/layouts/cornerse.png"

--------------------------------
--Taglist-----------------------
--------------------------------
theme.taglist_bg_empty = "#00000000"
theme.taglist_fg_empty = theme.fg
-- theme.taglist_bg_occupied                       = "#434c5e"
theme.taglist_bg_occupied = theme.bg
theme.taglist_fg_occupied = theme.fg
theme.taglist_bg_focus = theme.background_lighter
theme.taglist_fg_focus = theme.red
theme.taglist_fg_urgent = theme.yellow
-- Other Taglist settings
theme.taglist_spacing = 4
theme.taglist_shape_border_width = 0
theme.taglist_shape_border_radius = 20
theme.taglist_shape_border_color = "#00000000"

---------------------------------------
-----Notifications---------------------
---------------------------------------
theme.notification_font = "Noto Sans 12"
theme.notification_fg = theme.fg
theme.notification_position = "top_right"
theme.notification_margin = dpi(10)
theme.notification_border_width = dpi(0)
theme.notification_spacing = dpi(15)
theme.notification_icon_resize_strategy = "center"
theme.notification_icon_size = dpi(300)

--Shortcut key list popup theme
theme.hotkeys_font = "Noto Sans Bold 12"
theme.hotkeys_description_font = "Noto Sans 12"
theme.hotkeys_group_margin = dpi(12)
theme.hotkeys_modifiers_fg = theme.blue

--Theme
theme.icon_empty_notibox = "~/.config/awesome/themes/mytheme/icons/mail-receive.svg"

return theme
