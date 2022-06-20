local prefix = require('prefix')

hs.loadSpoon("KSheet")

local name = "cheatsheetM"

spoon.ModalMgr:new(name)

local cmodal = spoon.ModalMgr.modal_list[name]

cmodal:bind('', 'escape', 'Deactivate cheatsheetM', function()
  spoon.KSheet:hide()
  spoon.ModalMgr:deactivate({name})
end)

cmodal:bind('', 'Q', 'Deactivate cheatsheetM', function()
  spoon.KSheet:hide()
  spoon.ModalMgr:deactivate({name})
end)

local function show()
  spoon.KSheet:show()
  spoon.ModalMgr:deactivateAll()
  spoon.ModalMgr:activate({name})
end

prefix.bind('', '/', show) 
