local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

Theme.font = "Ubuntu 8" -- "Tamsyn 10" -- "Sans 8"
Theme.taglist_font = "Ubuntu Medium 9"

Theme.useless_gap = dpi(5)

Theme.border_width = dpi(2)

Theme.border_normal = "#3B4252"
Theme.border_focus = "#4C566A"
Theme.border_marked = "#D08770"

Theme.fg_normal = "#ECEFF4"
Theme.fg_focus = "#88C0D0"
Theme.fg_urgent = "#D08770"
Theme.bg_normal = "#2E3440"
Theme.bg_focus = "#3B4252"
Theme.bg_urgent = "#3B4252"
Theme.bg_systray = Theme.bg_normal

Theme.taglist_squares_sel = Theme_path .. "taglist/squarefz.png"
Theme.taglist_squares_unsel = Theme_path .. "taglist/squarez.png"
