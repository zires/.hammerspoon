-- @see https://zzamboni.org/post/my-hammerspoon-configuration-with-commentary/
-- @see https://github.com/zzamboni/dot-hammerspoon/blob/master/init.lua
-- @see https://www.cheng92.com/post/macos-hammerspoon-configuration/
hs.logger.defaultLogLevel="info"

hs.application.enableSpotlightForNameSearches(false)

hyper = {"cmd", "alt", "ctrl", "shift"}

config = hs.json.read("~/.hammerspoon/config/config.json")

hs.loadSpoon("ModalMgr")
hs.loadSpoon("SpoonInstall")

spoon.SpoonInstall.use_syncinstall = true

Install=spoon.SpoonInstall

Install:andUse("ClipboardTool",
               {
                 disable = false,
                 config = { show_in_menubar = false, max_size = true },
                 hotkeys = { toggle_clipboard = { { "cmd", "shift" }, "v" } },
                 start = true
               }
)

Install:andUse("SpeedMenu", { start = true })

inspect = hs.inspect.inspect
prefix = require("prefix")

prefix.bind('alt', 'c', function() spoon.ClipboardTool:clearAll() end)

utils = require("utils")

require("double_cmdq_to_quit")
require("keymaps")
require("window")
require("caffeinate")
require("url_dispatcher")
require("my_ksheet")
require("my_spaces")
require("dict")
-- require("smart_modifier_keys")
require("switch_primary_monitor")
pcall(hs.fnutils.partial(require, "local"))

utils.tempNotify(3, hs.notify.new({
    title = "Config reloaded",
}))
