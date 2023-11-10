-- Importing libraries
help = require('help')
gears = require('gears')
awful = require('awful')
wibox = require('wibox')
naughty = require("naughty")
beautiful = require('beautiful')
dpi = beautiful.xresources.apply_dpi
beautiful.init('~/.config/awesome/theme/init.lua')
keys = require('keys')
dashboard = require("dashboard")
sig = require('signals')
local signals = require("signals")
local req = {
  'notifications',
  'bar',
  'menu',
  'rules',
  'titlebar',
  'client',
  'awful.autofocus',
}
require("popup")

for _, x in pairs(req) do
  require(x)
end

-- Layouts
awful.layout.layouts = {
  awful.layout.suit.tile,
  awful.layout.suit.floating,
}

-- Virtual desktops/ Tabs
awful.screen.connect_for_each_screen(function(s)
  help.randomize_wallpaper()
  local tagTable = {}
  for i = 1, keys.tags do
    table.insert(tagTable, tostring(i))
  end
  awful.tag(tagTable, s, awful.layout.layouts[1])
end)


-- Garbage Collection
collectgarbage('setpause', 110)
collectgarbage('setstepmul', 1000)

-- Signals
gears.timer {
  timeout = 10,
  single_shot = true,
  autostart = true,
  call_now = true,
  callback = function()
    signals.vol()
    signals.mic()
  end
}

-- Autostart
awful.spawn("picom -b", false)

--wai
awful.spawn.with_shell("vibrantLinux")
awful.spawn.with_shell( "sleep 3s && killall vibrantLinux")

-- Autostart
awful.spawn("xrandr --output eDP-1 --primary --mode 1366x768 --pos 1280x128 --rotate normal --output DP-1 --off --output HDMI-1 --off --output DP-2 --off --output HDMI-2 --off --output DP-3 --mode 1280x1024 --pos 0x0 --rotate normal")


