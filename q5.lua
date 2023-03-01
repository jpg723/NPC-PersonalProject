-----------------------------------------------------------------------------------------
--
-- view2.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local num1 = composer.getVariable("num1")
local num2 = composer.getVariable("num2")
local num3 = composer.getVariable("num3")
local num4 = composer.getVariable("num4")
local num5 = composer.getVariable("num5")
local num6 = composer.getVariable("num6")
local num7 = composer.getVariable("num7")
local num8 = composer.getVariable("num8")
local tm
function scene:create( event )
	local sceneGroup = self.view
	
	local background = display.newImage( "image/gameBg.jpg", display.contentWidth, display.contentHeight)
   	background.x = display.contentWidth / 2
   	background.y = display.contentHeight / 2
   	sceneGroup:insert(background)

	local score = 0 

	local limit = 5
	local showLimit = display.newText(limit, display.contentWidth*0.94, display.contentHeight*0.1, "font/123RF_하르방_R_TTF.ttf")
	showLimit:setFillColor(0)
	showLimit.size = 60
	sceneGroup:insert(showLimit)

	local function timeAttack(event) 
		limit = limit - 1
		showLimit.text = limit

		if limit <= 0 then
			composer.setVariable("correct5", score)
			composer.gotoScene("res")
		end
	end
    
	tm = timer.performWithDelay(1000, timeAttack, limit)

	local num9 = math.random(50)
	local num10 = math.random(50)

	for i = 1, 2 do
		if (num9 == num1 and num10 == num2) or (num9 == num2 and num10 == num1) 
		or (num9 == num3 and num10 == num4) or (num9 == num4 and num10 == num3) 
		or (num9 == num5 and num10 == num6) or (num9 == num6 and num10 == num5)
		or (num9 == num7 and num10 == num8) or (num9 == num8 and num10 == num7) then
			num9 = math.random(50)
			num10 = math.random(50)
		end
	end
	local numX = display.newText(num9 , display.contentCenterX - 200, display.contentHeight*0.37, "font/123RF_하르방_R_TTF.ttf")
	numX:setFillColor(0)
	numX.size = 70
	sceneGroup:insert(numX)

	local question = display.newText(" * " , display.contentCenterX - 100, display.contentHeight*0.37, "font/123RF_하르방_R_TTF.ttf")
	question:setFillColor(0)
	question.size = 70
	sceneGroup:insert(question)

	local numY = display.newText(num10 , display.contentCenterX, display.contentHeight*0.37, "font/123RF_하르방_R_TTF.ttf")
	numY:setFillColor(0)
	numY.size = 70
	sceneGroup:insert(numY)

	local a = display.newText(" = " , display.contentCenterX + 100, display.contentHeight*0.37, "font/123RF_하르방_R_TTF.ttf")
	a:setFillColor(0)
	a.size = 70
	sceneGroup:insert(a)

	local b = display.newText(" ? " , display.contentCenterX + 200, display.contentHeight*0.37, "font/123RF_하르방_R_TTF.ttf")
	b:setFillColor(0)
	b.size = 70
	sceneGroup:insert(b)

	local nums = { }
	nums[1] = math.random(2500)
	nums[2] = math.random(2500)
	nums[3] = num9 * num10

	for i = 1, 3 do
		if nums[1] == nums[3] then
			nums[1] = math.random(2500)
		end

		if nums[2] == nums[3] then
			nums[1] = math.random(2500)
		end
	end

	for i = 1, 3 do
		local k = math.random(i, 3)
		local temp = nums[i]
		nums[i] = nums[k]
		nums[k] = temp
	end
	
	local rec1 = display.newRect(display.contentCenterX - 350, display.contentCenterY + 145, 240, 120 )
	rec1.strokeWidth = 3
	rec1:setStrokeColor(0.5)
   	sceneGroup:insert(rec1)

   	local answer1 = display.newText(nums[1] , display.contentCenterX - 350, display.contentCenterY + 145, "font/123RF_하르방_R_TTF.ttf")
	answer1:setFillColor(0)
	answer1.size = 60
	sceneGroup:insert(answer1)

	local rec2 = display.newRect(display.contentCenterX, display.contentCenterY + 145, 240, 120 )
	rec2.strokeWidth = 3
	rec2:setStrokeColor(0.5)
   	sceneGroup:insert(rec2)

   	local answer2 = display.newText(nums[2] , display.contentCenterX, display.contentCenterY + 145, "font/123RF_하르방_R_TTF.ttf")
	answer2:setFillColor(0)
	answer2.size = 60
	sceneGroup:insert(answer2)

	local rec3 = display.newRect(display.contentCenterX + 350, display.contentCenterY + 145, 240, 120 )
	rec3.strokeWidth = 3
	rec3:setStrokeColor(0.5)
   	sceneGroup:insert(rec3)

   	local answer3 = display.newText(nums[3] , display.contentCenterX + 350, display.contentCenterY + 145, "font/123RF_하르방_R_TTF.ttf")
	answer3:setFillColor(0)
	answer3.size = 60
	sceneGroup:insert(answer3)

	local result = num9 * num10
	local function selectAnswer7(event)
		if nums[1] == result then
			score = 1
		end
		composer.setVariable("correct5", score)
		composer.gotoScene("res")
	end
	rec1:addEventListener("tap", selectAnswer7)

	local function selectAnswer8(event)
		if nums[2] == result then
			score = 1
		end
		composer.setVariable("correct5", score)
		composer.gotoScene("res")
	end
	rec2:addEventListener("tap", selectAnswer8)

	local function selectAnswer9(event)
		if nums[3] == result then
			score = 1
		end
		composer.setVariable("correct5", score)
		composer.gotoScene("res")
	end
	rec3:addEventListener("tap", selectAnswer9)
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then
		-- Called when the scene is now off screen
		timer.pause(tm)
	end
end

function scene:destroy( event )
	local sceneGroup = self.view
	
	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene