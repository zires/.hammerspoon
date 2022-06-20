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
                 config = { show_in_menubar = false },
                 hotkeys = { toggle_clipboard = { { "cmd", "shift" }, "v" } },
                 start = true
               }
)

Install:andUse("SpeedMenu", { start = true })

-- spaces = require("hs.spaces")
-- function MoveWindowToSpace(sp)
  -- local win = hs.window.focusedWindow()      -- current window
  -- local cur_screen = hs.screen.mainScreen()
  -- local cur_screen_id = cur_screen:getUUID()
  -- local all_spaces=spaces.allSpaces()
  -- local spaceID = all_spaces[cur_screen_id][sp]
  -- spaces.moveWindowToSpace(win:id(), spaceID)
  -- spaces.gotoSpace(spaceID)              -- follow window to new space
-- end
--
-- hs.hotkey.bind(hyper, '1', function() MoveWindowToSpace(1) end)
-- hs.hotkey.bind(hyper, '2', function() MoveWindowToSpace(2) end)
-- hs.hotkey.bind(hyper, '3', function() MoveWindowToSpace(3) end)
-- hs.hotkey.bind(hyper, '4', function() spaces.toggleMissionControl() end)

inspect = hs.inspect.inspect
prefix = require("prefix")
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
