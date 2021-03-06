-- To replace the Caffeinate app

local prefix = require('prefix')

local menu = nil

local function toggle()
    local enabled = hs.caffeinate.toggle('displayIdle')
    if enabled then
        menu = hs.menubar.new()
        menu:setTitle('☕')
        menu:setMenu({
            { title = 'Turn off Caffeinate', fn = toggle }
        })
    else
        menu:delete()
    end
    hs.alert.show('Caffeinate '.. (enabled and 'enabled' or 'disabled'), 1)
end

prefix.bind('ctrl', 'c', toggle)
prefix.bind('ctrl', 's', hs.caffeinate.startScreensaver)
prefix.bind('ctrl', 'l', function() hs.caffeinate.lockScreen() end) 

