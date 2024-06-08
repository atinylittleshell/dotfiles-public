-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

require("main.error-handling")
require("main.startup")
require("main.theme")
require("main.layouts")
require("main.client")

require("binding.global_buttons")
require("binding.global_keys")

require("layout.topbar")
