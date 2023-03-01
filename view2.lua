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

   	local ex = display.newText("사칙 연산 중 한 가지를 선택하세요.\n", display.contentCenterX, 
   		display.contentCenterY - 70, "font/123RF_하르방_R_TTF.ttf")
	ex:setFillColor(0)
	ex.size = 60
	sceneGroup:insert(ex)

	local start1 = display.newText("+", display.contentCenterX - 300, display.contentCenterY + 30, "font/123RF_하르방_R_TTF.ttf")
	start1:setFillColor(0)
	start1.size = 150
	sceneGroup:insert(start1)

	local start2 = display.newText("-", display.contentCenterX - 100, display.contentCenterY + 30, "font/123RF_하르방_R_TTF.ttf")
	start2:setFillColor(0)
	start2.size = 150
	sceneGroup:insert(start2)

	local start3 = display.newText("×", display.contentCenterX + 100, display.contentCenterY + 30, "font/123RF_하르방_R_TTF.ttf")
	start3:setFillColor(0)
	start3.size = 150
	sceneGroup:insert(start3)

   	local start4 = display.newText("÷", display.contentCenterX + 300, display.contentCenterY + 30, "font/123RF_하르방_R_TTF.ttf")
	start4:setFillColor(0)
	start4.size = 150
	sceneGroup:insert(start4)

   	local ex1 = display.newText("총 5문제입니다.\n", display.contentCenterX, 
   		display.contentCenterY + 140, "font/123RF_하르방_R_TTF.ttf")
	ex1:setFillColor(0)
	ex1.size = 40
	sceneGroup:insert(ex1)

	local ex2 = display.newText("5초 안에 정답을 선택하세요.\n", display.contentCenterX, 
   		display.contentCenterY + 200, "font/123RF_하르방_R_TTF.ttf")
	ex2:setFillColor(0)
	ex2.size = 40
	sceneGroup:insert(ex2)

	local function goGame(event)
		composer.gotoScene("p1")
	end
	start1:addEventListener("tap", goGame)

	local function goGame(event)
		composer.gotoScene("m1")
	end
	start2:addEventListener("tap", goGame)

	local function goGame(event)
		composer.gotoScene("q1")
	end
	start3:addEventListener("tap", goGame)

	local function goGame(event)
		composer.gotoScene("d1")
	end
	start4:addEventListener("tap", goGame)


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