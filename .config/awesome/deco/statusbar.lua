-- Standard awesome library
local gears = require("gears")
local awful = require("awful")

-- Wibox handling library
local wibox = require("wibox")

local _M = {}

local deco = {
    wallpaper = require("deco.wallpaper"),
    taglist = require("deco.taglist"),
    tasklist = require("deco.tasklist")
};

local taglist_buttons = deco.taglist()
local tasklist_buttons = deco.tasklist()

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Wibar

local mytextclock = wibox.widget.textclock()
local mykeyboardlayout = awful.widget.keyboardlayout()
function statusbar_shape(cr, width, height)
    gears.shape.rounded_rect(cr, width,height, 5)
end

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)
    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()

    -- Create an imagebox widget
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
        awful.button({}, 1, function() awful.layout.inc(1) end),
        awful.button({}, 3, function() awful.layout.inc(-1) end),
        awful.button({}, 4, function() awful.layout.inc(1) end),
        awful.button({}, 5, function() awful.layout.inc(-1) end)
    ))

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen = s,
        filter = awful.widget.taglist.filter.all,
        buttons = taglist_buttons
    }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen = s,
        filter = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons
    }

    -- Create the wibox
    -- s.mywibox = awful.wibar({position = "top", screen = s, height = 25, shape = statusbar_shape, border_width = 5})
    local spacing = 8
    -- Create the top wiboxs
    s.mywibox = wibox({
        screen = s,
        -- shape = custom_shape,
        width = s.geometry.width * 0.1,
        height = 28,
        bg = "#000000AA",
        border_color = "00000000",
        x = s.geometry.x + 4,
        y = s.geometry.y + 4
    })
    s.mywiboxmiddle = wibox({
        screen = s,
        -- shape = custom_shape, 
        width = s.geometry.width * 0.7 - spacing - 4,
        height = 28,
        bg = "#000000AA", 
        border_color = "00000000",
        x = s.geometry.x + (s.geometry.width * 0.1 + spacing + 4),
        y = s.geometry.y + 4
    })
    s.mywiboxright = wibox({
        screen = s, 
        -- shape = custom_shape, 
        width = s.geometry.width * 0.2 - spacing - 4,
        height = 28,
        bg = "#000000AA", 
        border_color = "#00000000",
        x = s.geometry.x + (s.geometry.width * 0.8 + spacing),
        y = s.geometry.y + 4
    })




    -- s.mywibox.x = s.geometry.x + 4
    -- s.mywibox.y = s.geometry.y + 4

    -- s.mywiboxmiddle.x = s.geometry.x + (s.geometry.width * 0.1 + spacing + 4)
    -- s.mywiboxmiddle.y = s.geometry.y + 4

    -- s.mywiboxright.x = s.geometry.x + (s.geometry.width * 0.8 + spacing)
    -- s.mywiboxright.y = s.geometry.y + 4

    -- s.mywiboxbottom.x = 4
    -- s.mywiboxbottom.y = 768 - s.mywiboxbottom.height - 4

    -- Add widgets to the wibox
    s.mywibox:setup{
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            s.mytaglist,
            s.mypromptbox
        },
    }

    s.mywiboxmiddle:setup{
        layout = wibox.layout.align.horizontal,
        s.mytasklist, -- Middle widget

    }

    s.mywiboxright:setup{
        layout = wibox.layout.align.horizontal,
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            wibox.widget.systray(),
            mytextclock,
        }

    }
end)
