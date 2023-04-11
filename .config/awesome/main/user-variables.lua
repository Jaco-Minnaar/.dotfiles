local home = os.getenv("HOME")

local _M = {
    terminal = "wezterm",
    editor = os.getenv("EDITOR") or "nvim",

    -- Default modkey.
    -- Usually, Mod4 is the key with a logo between Control and Alt.
    -- If you do not like this or do not have such a key,
    -- I suggest you to remap Mod4 to another key using xmodmap or other tools.
    -- However, you can use another modifier like Mod1, but it may interact with others.
    modkey = "Mod4"
}

_M["editor_cmd"] = _M.terminal .. " -e " .. _M.editor

return _M
