local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
-- local naughty = require("naughty")
-- naughty.notify({text = "Hello"})

Theme.notification_icon_size = dpi(100)
Theme.font = "Source Code Pro Semibold 9" -- "Tamsyn 10" -- "Sans 8"
Theme.taglist_font = "Source Code Pro Semibold 9"

Theme.useless_gap = dpi(4)

-- Theme.border_width = dpi(2)

-- Theme.border_normal = "#3B4252"
-- Theme.border_focus = "#4C566A"
-- Theme.border_marked = "#D08770"

-- Theme.fg_normal = "#ECEFF4"
-- Theme.fg_focus = "#88C0D0"
-- Theme.fg_urgent = "#D08770"
-- Theme.bg_normal = "#2E3440"
-- Theme.bg_focus = "#3B4252"
-- Theme.bg_urgent = "#3B4252"
-- Theme.bg_systray = Theme.bg_normal
Theme.fg_normal = "#EBDBB2"
Theme.fg_focus = "#FBF1C7"
Theme.fg_urgent = "#CC9393"
Theme.bg_normal = "#282828"
Theme.bg_focus = "#665C54"
Theme.bg_urgent = "#CC241D"
Theme.border_width = dpi(1)
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
