-- Standard awesome library
local gears = require("gears")
local awful = require("awful")

-- Wibox handling library
local wibox = require("wibox")
local dpi = require('beautiful.xresources').apply_dpi

local _M = {}

local deco = {
    wallpaper = require("deco.wallpaper"),
    taglist = require("deco.taglist"),
    tasklist = require("deco.tasklist")
};

local _M = {};

local WB = {}
wibox_package = WB

require("statusbar.default.helper-default")

function WB.setup_common_boxes(s)
    -- Wallpaper
    set_wallpaper(s)
    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()

    -- Create an imagebox widget
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                              awful.button({}, 1,
                                           function() awful.layout.inc(1) end),
                              awful.button({}, 3,
                                           function()
            awful.layout.inc(-1)
        end), awful.button({}, 4, function() awful.layout.inc(1) end),
                              awful.button({}, 5,
                                           function()
            awful.layout.inc(-1)
        end)))

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen = s,
        filter = awful.widget.taglist.filter.all,
        buttons = WB.taglist
    }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen = s,
        filter = awful.widget.tasklist.filter.currenttags,
        buttons = WB.tasklist
    }

    s.mytasklist:set_max_widget_size(dpi(200))
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Wibar

function _M.init()
    WB.taglist = deco.taglist()
    WB.tasklist = deco.tasklist()

    awful.screen.connect_for_each_screen(function(s)
        WB.setup_common_boxes(s)

        -- Create the top wibox
        WB.generate_wibox_one(s)

        -- Create the bottom wibox
        -- WB.generate_wibox_two(s)
        -- WB.generate_wibox_three(s)
    end)
end

return setmetatable({}, {__call = function(_, ...) return _M.init() end})
