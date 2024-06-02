local awful = require("awful")
local gears = require("gears")
local hotkeys_popup = require("awful.hotkeys_popup")
local vars = require("main.vars")

local globalkeys = gears.table.join(
  -- Hotkeys
  awful.key({ vars.modkey }, "s", hotkeys_popup.show_help, { description = "show help", group = "awesome" }),

  -- Switch clients
  awful.key({ vars.modkey }, "j", function()
    awful.client.focus.byidx(1)
  end, { description = "focus next by index", group = "client" }),
  awful.key({ vars.modkey }, "k", function()
    awful.client.focus.byidx(-1)
  end, { description = "focus previous by index", group = "client" }),

  -- Layout manipulation
  awful.key({ vars.modkey, "Shift" }, "j", function()
    awful.client.swap.byidx(1)
  end, { description = "swap with next client by index", group = "client" }),
  awful.key({ vars.modkey, "Shift" }, "k", function()
    awful.client.swap.byidx(-1)
  end, { description = "swap with previous client by index", group = "client" }),

  -- Rofi
  awful.key({ vars.modkey }, "a", function()
    awful.spawn("rofi -show drun -theme ~/.config/rofi/launchers/theme.rasi")
  end, { description = "launcher", group = "launcher" }),

  -- Terminal
  awful.key({ vars.modkey }, "t", function()
    awful.spawn(vars.terminal)
  end, { description = "open a terminal", group = "launcher" }),

  -- Browser
  awful.key({ vars.modkey }, "b", function()
    awful.spawn("google-chrome-stable")
  end, { description = "browser", group = "launcher" }),

  -- File explorer
  awful.key({ vars.modkey }, "e", function()
    awful.spawn("thunar")
  end, { description = "file explorer", group = "launcher" }),

  -- Master width
  awful.key({ vars.modkey }, "l", function()
    awful.tag.incmwfact(0.05)
  end, { description = "increase master width factor", group = "layout" }),
  awful.key({ vars.modkey }, "h", function()
    awful.tag.incmwfact(-0.05)
  end, { description = "decrease master width factor", group = "layout" }),

  -- Prompt
  awful.key({ vars.modkey }, "r", function()
    awful.screen.focused().mypromptbox:run()
  end, { description = "run prompt", group = "launcher" })
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
  globalkeys = gears.table.join(
    globalkeys,
    -- View tag only.
    awful.key({ vars.modkey }, "#" .. i + 9, function()
      local screen = awful.screen.focused()
      local tag = screen.tags[i]
      if tag then
        tag:view_only()
      end
    end, { description = "view tag #" .. i, group = "tag" }),
    -- Toggle tag display.
    awful.key({ vars.modkey, "Control" }, "#" .. i + 9, function()
      local screen = awful.screen.focused()
      local tag = screen.tags[i]
      if tag then
        awful.tag.viewtoggle(tag)
      end
    end, { description = "toggle tag #" .. i, group = "tag" }),
    -- Move client to tag.
    awful.key({ vars.modkey, "Shift" }, "#" .. i + 9, function()
      if client.focus then
        local tag = client.focus.screen.tags[i]
        if tag then
          client.focus:move_to_tag(tag)
        end
      end
    end, { description = "move focused client to tag #" .. i, group = "tag" }),
    -- Toggle tag on focused client.
    awful.key({ vars.modkey, "Control", "Shift" }, "#" .. i + 9, function()
      if client.focus then
        local tag = client.focus.screen.tags[i]
        if tag then
          client.focus:toggle_tag(tag)
        end
      end
    end, { description = "toggle focused client on tag #" .. i, group = "tag" })
  )
end

root.keys(globalkeys)
