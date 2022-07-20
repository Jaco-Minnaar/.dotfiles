local WB = wibox_package
local wibox = require("wibox")
local awful = require("awful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local spacing = dpi(8)
local mytextclock = wibox.widget.textclock("%a %b %d, %H:%M:%S", 1)

local volume_widget = require('awesome-wm-widgets.volume-widget.volume')
local cpu_widget = require("awesome-wm-widgets.cpu-widget.cpu-widget")
local fs_widget = require("awesome-wm-widgets.fs-widget.fs-widget")
local spotify_widget = require("awesome-wm-widgets.spotify-widget.spotify")

function WB.generate_wibox_one (s)
    s.mywibox = awful.wibar({
		position = "top",
        screen = s,
        -- shape = custom_shape,
        width = s.geometry.width - spacing,
        height = 25,
		opacity = 1,
        bg = "#28282899",
        border_color = "#00000000",
    })

    s.mywibox.x = s.geometry.x + dpi(4);

    s.mywibox : setup{
        layout = wibox.layout.align.horizontal,
        s.mytaglist,
        {
            layout = wibox.layout.fixed.horizontal,
            wibox.widget.textbox(" ")
        },
        {
            layout = wibox.layout.fixed.horizontal,
			fs_widget(),
			wibox.widget.textbox("  │  "),
			cpu_widget({
        	    width = 70,
        	    step_width = 2,
        	    step_spacing = 0,
        	    color = '#434c5e'
        	}),
			wibox.widget.textbox("  │  "),
			volume_widget{
				widget_type = 'icon_and_text'
			},
			wibox.widget.textbox("  │  "),
            mytextclock,
            wibox.widget.textbox("  "),
            wibox.widget.systray()
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
