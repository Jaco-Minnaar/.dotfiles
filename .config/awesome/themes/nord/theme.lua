local awful = require("awful")
awful.util = require("awful.util")

Theme_path = awful.util.getdir("config") .. "themes/nord/"

-- default variables

Theme = {}

dofile(Theme_path .. "elements.lua");
dofile(Theme_path .. "layouts.lua");
dofile(Theme_path .. "titlebar.lua");

Theme.wallpaper = Theme_path .. "background.png"

return Theme
