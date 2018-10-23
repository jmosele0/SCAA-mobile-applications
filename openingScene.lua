local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------


-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
local function delayRelease()
	local options = {
		effect = "fade",
		time = 1000,
	}
	composer.gotoScene( "searchScene", options )	
end
--The progam will wait a second, and then fade to searchScene



function scene:create( event )

    -- Code here runs when the scene is first created but has not yet appeared on screen

    -- Assign "self.view" to local variable "sceneGroup" for easy reference
    local sceneGroup = self.view
	


    
end



function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase
	
	

    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)

	local background=display.setDefault( "background", 0, 0, 0 )
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
		
		local loadingText = display.newText("Rule of Law Index Viewer", display.contentCenterX, display.contentCenterY, arial, 25)
		loadingText:setFillColor(2,0,0)
		loadingText:toFront()
		--[[This will send the object to the top of the 
		the parent group's visual stack--]]
		
		sceneGroup:insert(loadingText)
		

    end
	timer.performWithDelay(2000, delayRelease)
end


-- hide()
function scene:hide( event )

    local sceneGroup = self.view
	
    local phase = event.phase


    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)

    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
		

    end
end


-- destroy()
function scene:destroy( event )

    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view


end


-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------
	
return scene