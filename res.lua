-----------------------------------------------------------------------------------------
--
-- view3.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view

	local background = display.newImage( "image/background.jpg", display.contentWidth, display.contentHeight)
   	background.x = display.contentWidth / 2
   	background.y = display.contentHeight / 2
   	sceneGroup:insert(background)
	local correct1 = composer.getVariable("correct1")
	local correct2 = composer.getVariable("correct2")
	local correct3 = composer.getVariable("correct3")
	local correct4 = composer.getVariable("correct4")
	local correct5 = composer.getVariable("correct5")

	local score = 0

	if correct1 == 1 then
		score = score + 1
	end

	if correct2 == 1 then
		score = score + 1
	end

	if correct3 == 1 then
		score = score + 1
	end

	if correct4 == 1 then
		score = score + 1
	end

	if correct5 == 1 then
		score = score + 1
	end

	if correct6 == 1 then
		score = score + 1
	end

	if correct7 == 1 then
		score = score + 1
	end

	local talk = display.newText("내가 맞은 점수" , display.contentCenterX, display.contentHeight*0.34, "font/123RF_하르방_R_TTF.ttf")
	talk:setFillColor(0)
	talk.size = 80
	sceneGroup:insert(talk)

	local okay = display.newText(score*20 , display.contentCenterX - 30, display.contentHeight*0.57, "font/123RF_하르방_R_TTF.ttf")
	okay:setFillColor(0)
	okay.size = 100
	sceneGroup:insert(okay)

	local talk2 = display.newText("점" , display.contentCenterX + 100 , display.contentHeight*0.57, "font/123RF_하르방_R_TTF.ttf")
	talk2:setFillColor(0)
	talk2.size = 80
	sceneGroup:insert(talk2)
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