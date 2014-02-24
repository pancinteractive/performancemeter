local _M = {}
 
local mFloor = math.floor
local sGetInfo = system.getInfo
local sGetTimer = system.getTimer
 
local prevTime = 0
_M.added = true
local function createText()
    local memory = display.newText('00 00.00 000',10,0, 'Helvetica', 14);
	--memory:setTextColor(255,53,247)
	memory:setTextColor(232,3,99)
    memory.anchorY = 0
    memory.x, memory.y = display.contentCenterX, display.screenOriginY+25
    function memory:tap ()
        collectgarbage('collect')
        if _M.added then
            Runtime:removeEventListener('enterFrame', _M.labelUpdater)
            _M.added = false
		memory.alpha = .01
        else
            Runtime:addEventListener('enterFrame', _M.labelUpdater)
            _M.added = true
		memory.alpha = 1
        end
    end
    memory:addEventListener('tap', memory)
    return memory
end
 
function _M.labelUpdater(event)
    local curTime = sGetTimer()
    _M.text.text = tostring(mFloor( 1000 / (curTime - prevTime))) .. ' ' ..
            tostring(mFloor(sGetInfo('textureMemoryUsed') * 0.0001) * 0.01) .. ' ' ..
            tostring(mFloor(collectgarbage('count')))
    _M.text:toFront()
    prevTime = curTime
end
 
function _M:newPerformanceMeter()
    self.text = createText(self)
    Runtime:addEventListener('enterFrame', _M.labelUpdater)
end
 
return _M
