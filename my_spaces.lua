local prefix = require("prefix")
local spaces = require("hs.spaces")

local function moveToLeft()
  local win = hs.window.focusedWindow()
  local screen = win:screen()
  local uuid = screen:getUUID()
  local all_spaces = spaces.allSpaces()
  local currSpaceID = spaces.windowSpaces(win)
  local currSpaces = all_spaces[uuid]
  local idx = utils.indexOf(currSpaces, currSpaceID[1])
  local spaceID = currSpaces[idx - 1]
  spaces.moveWindowToSpace(win:id(), spaceID)
  hs.eventtap.keyStroke({"ctrl","fn"}, "left", 0)
end

local function moveToRight()
  local win = hs.window.focusedWindow()
  local screen = win:screen()
  local uuid = screen:getUUID()
  local all_spaces = spaces.allSpaces()
  local currSpaceID = spaces.windowSpaces(win)
  local currSpaces = all_spaces[uuid]
  local idx = utils.indexOf(currSpaces, currSpaceID[1])
  local spaceID = currSpaces[idx + 1]
  spaces.moveWindowToSpace(win:id(), spaceID)
  hs.eventtap.keyStroke({"ctrl","fn"}, "right", 0)
end

prefix.bind('ctrl', 'm', function() spaces.toggleMissionControl() end)
prefix.bind('alt', 'a', function() moveToLeft() end)
prefix.bind('alt', 'd', function() moveToRight() end)

