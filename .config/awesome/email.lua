local wibox = require("wibox")
local awful = require("awful")
local naughty = require("naughty")
local watch = require("awful.widget.watch")

-- local path_to_icons = "/usr/share/icons/Arc/actions/22"
-- local unread_icon = path_to_icons .. "/mail-mark-unread.png";
-- local read_icon = path_to_icons .. "/mail-message-new.png";
-- naughty.notify({text = read_icon, icon = unread_icon})
--
local icon_font = "Font Awesome 6 Free Regular 10";
local function generate_icon_markup(code, color)
    return ' <span color="' .. color .. '">' .. code .. '</span> '
end

local icon_color = "#707070"
local function make_fa_icon(code, color)
    return wibox.widget {
        font = icon_font,
        markup = generate_icon_markup(code, color),
        widget = wibox.widget.textbox
    }
end

local read_icon = '\u{f0e0}'
local unread_icon = '\u{e16f}'

local email_widget = wibox.widget.textbox()
email_widget:set_font("Source Code Pro Semibold 9")

local email_icon = make_fa_icon(read_icon, icon_color)

watch("email-thingie count", 20, function(_, stdout)
    local unread_emails_num = tonumber(stdout) or 0
    if (unread_emails_num > 0) then
        email_icon:set_markup(generate_icon_markup(unread_icon, icon_color))
        email_widget:set_text(stdout)
    elseif (unread_emails_num == 0) then
        email_icon:set_markup(generate_icon_markup(read_icon, icon_color))
        email_widget:set_text("")
    end
end)

local function show_emails()
    awful.spawn.easy_async(
        [[bash -c 'python /home/<username>/.config/awesome/email-widget/read_unread_emails.py']],
        function(stdout)
            naughty.notify {
                text = stdout,
                title = "Unread Emails",
                timeout = 5,
                hover_timeout = 0.5,
                width = 400
            }
        end)
end

-- email_icon:connect_signal("mouse::enter", function() show_emails() end)

local M = {}
M.widget = email_widget
M.icon = email_icon

return M
