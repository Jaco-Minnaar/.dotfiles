local WB = wibox_package
local wibox = require("wibox")
local awful = require("awful")
local xresources = require("beautiful.xresources")
local fs = require("gears.filesystem")
local dpi = xresources.apply_dpi

local mytextclock = wibox.widget.textclock("%a %b %d, %H:%M:%S", 1)

local volume_widget = require('awesome-wm-widgets.volume-widget.volume')
local cpu_widget = require("awesome-wm-widgets.cpu-widget.cpu-widget")
local fs_widget = require("awesome-wm-widgets.fs-widget.fs-widget")
local logout_menu_widget = require(
                               "awesome-wm-widgets.logout-menu-widget.logout-menu")
local ram_widget = require("awesome-wm-widgets.ram-widget.ram-widget")
local spotify_widget = require("awesome-wm-widgets.spotify-widget.spotify")
local weather_widget = require("awesome-wm-widgets.weather-widget.weather")

local seperator = wibox.widget.textbox("    ");
local naughty = require("naughty")

local data_home = fs.get_xdg_config_home()
local file = io.open(data_home .. "/../.openweather/key", "r")
if not file then
    naughty.notify("Could not find file for openweatherapi key")
    return
end

local key = file:read("*l")
file:close()

function WB.generate_wibox_one(s)
    s.mywibox = awful.wibar({
        position = "top",
        screen = s,
        -- shape = custom_shape,
        width = s.geometry.width,
        height = dpi(25),
        opacity = 1,
        bg = "#282828",
        border_color = "#00000000"
    })

    s.mywibox.x = s.geometry.x;

    s.mywibox:setup{
        layout = wibox.layout.align.horizontal,
        {layout = wibox.layout.align.horizontal, s.mypromptbox, s.mytaglist},
        {
            layout = wibox.layout.align.horizontal,
            wibox.widget.textbox(" "),
            s.mytasklist,
            seperator
        },
        {
            layout = wibox.layout.fixed.horizontal,
            spotify_widget({font = "Source Code Pro Semibold 9"}),
            seperator,
            cpu_widget(),
            seperator,
            ram_widget(),
            seperator,
            fs_widget(),
            seperator,
            volume_widget {widget_type = 'icon_and_text'},
            seperator,
            weather_widget({
                api_key = key,
                coordinates = {-29.1526, 26.172835},
                show_hourly_forecast = true,
                show_daily_forecast = true,
                timeout = 300
            }),
            seperator,
            mytextclock,
            seperator,
            wibox.widget.systray(),
            seperator,
            logout_menu_widget()
        }
    }

    -- s.mywibox:struts{left = 10, right = 10, bottom = 10, top = 10}
end

-- function WB.generate_wibox_two (s)
--     s.mybottomwibox = awful.wibar({
-- 		position = "bottom",
--         screen = s,
--         -- shape = custom_shape,
--         width = s.geometry.width - spacing,
--         height = 15,
-- 		opacity = 1,
--         bg = "#28282899",
--         border_color = "#00000000",
--     })
--
--     s.mybottomwibox.y = s.geometry.height - 15 - dpi(4);
--     s.mybottomwibox.x = s.geometry.x + dpi(4);
--
--     s.mybottomwibox : setup{
--         layout = wibox.layout.align.horizontal,
--         {
--             layout = wibox.layout.fixed.horizontal,
--             s.mytasklist
--         },
--         {
--             layout = wibox.layout.fixed.horizontal,
--             wibox.widget.textbox(" ")
--         },
--         {
--             layout = wibox.layout.fixed.horizontal,
--             wibox.widget.systray(),
--         }
--     }
--
--     -- s.mywiboxmiddle = awful.wibox({
--     --     screen = s,
--     --     -- shape = custom_shape, 
--     --     width = s.geometry.width * 0.7 - spacing - 4,
--     --     height = 28,
--     --     bg = "#000000AA", 
--     --     border_color = "00000000",
--     --     x = s.geometry.x + (s.geometry.width * 0.1 + spacing + 4),
--     --     y = s.geometry.y + 4
--     -- })
--
--     -- s.mywiboxmiddle:setup{
--     --     layout = wibox.layout.align.horizontal,
--     -- }
-- end
--
--
-- function WB.generate_wibox_three(s)
-- 	-- s.mywiboxright = wibox({
-- 	-- 	screen = s,
-- 	-- 	-- shape = custom_shape, 
-- 	-- 	width = s.geometry.width * 0.2 - spacing - 4,
-- 	-- 	height = 28,
-- 	-- 	bg = "#000000AA", 
-- 	-- 	border_color = "#00000000",
-- 	-- 	x = s.geometry.x + (s.geometry.width * 0.8 + spacing),
-- 	-- 	y = s.geometry.y + 4
-- 	-- })
--
--     -- s.mywiboxright:setup{
--     --     layout = wibox.layout.align.horizontal,
--     -- }
-- end
