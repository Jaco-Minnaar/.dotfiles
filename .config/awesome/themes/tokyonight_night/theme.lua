local awful = require("awful")
awful.util = require("awful.util")

-- local naughty = require("naughty")

Theme_path = awful.util.getdir("config") .. "themes/tokyonight_night/"

-- naughty.notify({text = Theme_path})
-- default variables

Theme = {}

dofile(Theme_path .. "elements.lua");
dofile(Theme_path .. "layouts.lua");
dofile(Theme_path .. "titlebar.lua");

Theme.wallpaper = Theme_path .. "wallpaper.png"

return Theme
