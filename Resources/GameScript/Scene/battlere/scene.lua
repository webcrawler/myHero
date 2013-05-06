--[[

首页场景

]]


collectgarbage("setpause" , 100)
collectgarbage("setstepmul" , 5000)


-- [[ 包含各种 Layer ]]
local hlplayer = require "GameScript/Scene/battlere/battleLayer"
require "GameScript/Scene/common/infolayer"
require "GameScript/Scene/home/InformationBox"
require "GameScript/Scene/home/MessageHeader"


local M = {}

function M:create()
	local scene = display.newScene("battlere")


	---------------插入layer---------------------
	local herolineupLayer = hlplayer:new(0,0)
	scene:addChild(herolineupLayer:getLayer())

	scene:addChild(msgLayer:create(0,804))
	scene:addChild(MHLayer:create(0,686))

	scene:addChild(InfoLayer:create("lineup"):getLayer())
--	scene:addChild(BTLuaLayer())
	---------------------------------------------

	return scene
end

return M
