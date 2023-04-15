-- Standard awesome library
local awful = require("awful")
-- Theme handling library
local beautiful = require("beautiful")

local _M = {}

function _M.get(clientkeys, clientbuttons)
    local rules = {
        {
            rule = {},
            properties = {
                border_width = beautiful.border_width,
                border_color = beautiful.border_normal,
                focus = awful.client.focus.filter,
                raise = true,
                keys = clientkeys,
                buttons = clientbuttons,
                screen = awful.screen.preferred,
                placement = awful.placement.no_overlap +
                    awful.placement.no_offscreen,
            }

        },
        {
            rule = {},
            except_any = { role = {"browser"}, class = {"jetbrains-studio", "kitty", "spotify", "org.wezfurlong.wezterm"}},
            properties = {
                floating = true
            }
        },
        -- {
        --     rule_any = {
        --         instance = {
        --             "DTA", -- Firefox addon DownThemAll.
        --             "copyq", -- Includes session name in class.
        --             "pinentry"
        --         },
        --         class = {
        --             "Arandr", "Blueman-manager", "Gpick", "Kruler",
        --             "MessageWin", -- kalarm.
        --             "Sxiv", "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
        --             "Wpa_gui", "veromix", "xtightvncviewer", "galculator",
        --             "Galculator", "feh", "Game Engine", "egui-test", "qemu",
        --             "viewer"
        --
        --         },
        --
        --         -- Note that the name property shown in xprop might be set slightly after creation of the client
        --         -- and the name shown there might not match defined rules here.
        --         name = {
        --             "Event Tester", -- xev.
        --             "Game Engine", "QEMU", "Android Emulator.*"
        --         },
        --         role = {
        --             "AlarmWindow", -- Thunderbird's calendar.
        --             "ConfigManager", -- Thunderbird's about:config.
        --             "pop-up" -- e.g. Google Chrome's (detached) Developer Tools.
        --         }
        --     },
        --     properties = {floating = true}
        -- }, -- Add titlebars to normal clients and dialogs
        {
            rule_any = {type = {"normal", "dialog"}},
            properties = {titlebars_enabled = true}
        }
    }

    return rules;
end

return setmetatable({}, {__call = function(_, ...) return _M.get(...) end})
