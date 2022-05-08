RC = {};
-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

require("main.error-handling")

local vars = require("main.user-variables")
RC.vars = vars;

require("main.theme");

local main = {
    layouts = require("main.layouts"),
    tags = require("main.tags"),
    rules = require("main.rules")
};

RC.layouts = main.layouts();
RC.tags = main.tags();

local bindings = {
    globalbuttons = require("bindings.globalbuttons"),
    clientbuttons = require("bindings.clientbuttons"),
    globalkeys = require("bindings.globalkeys"),
    bindtotags = require("bindings.bindtotags"),
    clientkeys = require("bindings.clientkeys")
};

RC.globalkeys = bindings.globalkeys();
RC.globalkeys = bindings.bindtotags(RC.globalkeys);

awful.rules.rules = main.rules(bindings.clientkeys(), bindings.clientbuttons());
menubar.utils.terminal = vars.terminal -- Set the terminal for applications that require it

root.buttons(bindings.globalbuttons());
root.keys(RC.globalkeys);
require("main.signals");

-- Autostart Applications
awful.spawn.with_shell("picom")
awful.spawn.with_shell("flameshot")

local statusbar = require("statusbar.default.statusbar")

statusbar();
