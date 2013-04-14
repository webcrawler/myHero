local roostLayer = {layer}
function roostLayer:new(x,y)
	local this = {}
	setmetatable(this,self)
	self.__index  = self

	this.layer = display.newLayer()
	local bg = CCSprite:create("image/scene/battle/bg.png")
	setAnchPos(bg,0,85)
	this.layer:addChild(bg)

	local fontbg = CCSprite:create("image/scene/task/fontbg.png")
	setAnchPos(fontbg,0,625)
	this.layer:addChild(fontbg)

	local line = CCSprite:create("image/scene/task/line.png")
	setAnchPos(line,10,513)
	this.layer:addChild(line)

	---- [[大关卡]]
	local bsv = KNScrollView:new(54,640,440,50,0,true,1)
	for i = 1,1  do --DATA_MapNum:size()
			local text_font = CCLabelTTF:create("关卡名字", "Arial" , 25)
			--text_font:setContentSize(CCSize(100,100))
			bsv:addChild(text_font,text_font)
	end

	this.layer:addChild(bsv:getLayer())


	--左按钮
	local btns = require"GameLuaScript/Common/KNBtn"
	--local group = RadioGroup:new()
	local left_bt
	    left_bt = btns:new("image/buttonUI/task/left/",{"def.png","pre.png"},5,625,
	    		{
	    			--front = v[1],
	    			highLight = true,
	    			scale = true,
					--selectable = true,
	    			callback=
	    				function()
	    					--switchScene("battlere")
	    				 end
	    		 })

	this.layer:addChild(left_bt:getLayer())


	--左按钮
	--local group = RadioGroup:new()
	local right_bt
	    right_bt = btns:new("image/buttonUI/task/right/",{"def.png","pre.png"},430,625,
	    		{
	    			--front = v[1],
	    			highLight = true,
	    			scale = true,
					--selectable = true,
	    			callback=
	    				function()
	    					--switchScene("battlere")
	    				 end
	    		 })

	this.layer:addChild(right_bt:getLayer())

	local taskinfo = require"GameLuaScript/Scene/roost/taskInfo"
	local task
	local task_x = 0
	local task_y = 100
	local ksv = KNScrollView:new(0,90,480,420,0,false)
	for i = 1,DATA_MapSmall:size()  do
			task = taskinfo:new(ksv,DATA_MapSmall:get(i),task_x,task_y)
			ksv:addChild(task:getLayer(),task)
			task_y = task_y -180
	end

	this.layer:addChild(ksv:getLayer())

return this
end

function roostLayer:getLayer()
	return self.layer
end

return roostLayer