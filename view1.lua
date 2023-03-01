-----------------------------------------------------------------------------------------
--
-- view1.lua
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

   	local s = display.newText("사칙 연산 게임", display.contentCenterX, display.contentCenterY - 30, "font/123RF_하르방_R_TTF.ttf")
	s:setFillColor(0)
	s.size = 100
	sceneGroup:insert(s)

   	local start = display.newText("start", display.contentCenterX, display.contentCenterY + 60, "font/123RF_하르방_R_TTF.ttf")
	start:setFillColor(0)
	start.size = 50
	sceneGroup:insert(start)

	local function goGame(event)
		composer.gotoScene("view2")
	end
	start:addEventListener("tap", goGame)
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