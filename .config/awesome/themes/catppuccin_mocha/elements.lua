local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
-- local naughty = require("naughty")
-- naughty.notify({text = "Hello"})

Theme.notification_icon_size = dpi(100)
Theme.font = "Source Code Pro Semibold 9" -- "Tamsyn 10" -- "Sans 8"
Theme.taglist_font = "Source Code Pro Semibold 9"

Theme.useless_gap = 0

Theme.fg_normal = "#c0caf5"
Theme.fg_focus = "#1e1e2e"
Theme.fg_urgent = "#e0af68"
Theme.bg_normal = "#181825"
Theme.bg_focus = "#7f849c"
Theme.bg_urgent = "#e0af68"
Theme.border_width = 0
Theme.border_normal = "#3F3F3F"
Theme.border_focus = "#7F7F7F"
Theme.border_marked = "#CC9393"
Theme.titlebar_bg_focus = Theme.bg_focus
Theme.titlebar_bg_normal = Theme.bg_normal
Theme.titlebar_fg_focus = Theme.fg_focus
Theme.menu_height = dpi(16)
Theme.menu_width = dpi(140)
Theme.popup_bg = Theme.bg_normal
Theme.popup_bar_background_color = Theme.bg_normal

Theme.taglist_squares_sel = Theme_path .. "taglist/squarefz.png"
Theme.taglist_squares_unsel = Theme_path .. "taglist/squarez.png"
