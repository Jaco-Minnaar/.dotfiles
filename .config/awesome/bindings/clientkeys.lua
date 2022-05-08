-- Standard Awesome library
local gears = require("gears")
local awful = require("awful")
-- Custom Local Library
-- local titlebar = require("anybox.titlebar")
local volume_widget = require('awesome-wm-widgets.volume-widget.volume')
local _M = {}
local modkey = RC.vars.modkey

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function _M.get()
    local clientkeys = gears.table.join(
        awful.key(
            {modkey},
            "f",
            function(c)
                c.fullscreen = not c.fullscreen
                c:raise()
            end,
            {description = "toggle fullscreen",
            group = "client"}
        ),
        awful.key(
            {modkey, "Shift"},
            "c",
            function(c) c:kill() end,
            {
                description = "close",
                group = "client"
            }
        ),
        awful.key(
            {modkey, "Control"}, 
            "space", 
            awful.client.floating.toggle,
            {
                description = "toggle floating", 
                group = "client"
            }
        ),
        awful.key(
            {modkey, "Control"}, 
            "Return",
            function(c) c:swap(awful.client.getmaster()); end, 
            {
                description = "move to master", 
                group = "client"
            }
        ),
        awful.key(
            {modkey}, 
            "o", function(c) c:move_to_screen(); end, 
            {
                description = "move to screen", 
                group = "client"
            }
        ),
        awful.key(
            {modkey}, 
            "t", 
            function(c) c.ontop = not c.ontop; end, 
            {
                description = "toggle keep on top", 
                group = "client"
            }
        ),
        awful.key(
            {modkey}, 
            "n", 
            function(c)
                -- The client currently has the input focus, so it cannot be
                -- minimized, since minimized clients can't have the focus.
                c.minimized = true
            end, 
            {description = "minimize", group = "client"}
        ),
        awful.key(
            {modkey}, 
            "m", 
            function(c)
                c.maximized = not c.maximized;
                c:raise();
            end, 
            {description = "(un)maximize", group = "client"}
        ),
        awful.key(
            {modkey, "Control"}, 
            "m",
            function(c)
                c.maximized_vertical = not c.maximized_vertical
                c:raise()
            end, 
            {description = "(un)maximize vertically", group = "client"}
        ),
        awful.key(
            {modkey, "Shift"}, 
            "m",
            function(c)
                c.maximized_horizontal = not c.maximized_horizontal
                c:raise()
            end, 
            {description = "(un)maximize horizontally", group = "client"}
        ),
        awful.key({}, "XF86AudioPlay", function() awful.util.spawn("playerctl play-pause"); end),
        awful.key({}, "XF86AudioNext", function() awful.util.spawn("playerctl next"); end),
        awful.key({}, "XF86AudioPrev", function() awful.util.spawn("playerctl previous"); end),
        awful.key({}, "XF86AudioRaiseVolume", function() volume_widget:inc(5); end),
        awful.key({}, "XF86AudioLowerVolume", function() volume_widget:dec(5); end),
        awful.key({}, "XF86AudioMute", function() volume_widget:toggle(); end)
    )

    return clientkeys
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, {__call = function(_, ...) return _M.get(...) end})
