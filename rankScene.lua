local composer = require( "composer" )
 
local scene = composer.newScene()
 
-- ===================================================================================
-- Scene event functions
-- ===================================================================================

local widget = require( "widget" )
 
-- Function to handle button events
local function showOptions( event )
 
    composer.gotoScene("sortScene", {effect="slideRight", time=500, params=customParams})
	
end
--
 local scrollView = widget.newScrollView
	 {
		left = 0,
		top = 50,
		width = 400,
		height = 500,
		topPadding = -20,
		bottomPadding = 50,
		horizontalScrollDisabled = true,
		verticalScrollDisabled = false,
		backgroundColor = {1,1,1,1},
		
 }
 --]]
  
  
-- Create the widget
local sortBtn = widget.newButton(
    {
        label = "SORT",
        onRelease = showOptions,
        emboss = false,
        -- Properties for a rounded rectangle button
        shape = "roundedRect",
        width = 40,
        height = 40,
		x = 290,
		y = 1, 
		fontSize = 10,
        cornerRadius = 2,
        fillColor = { default={1,0,0,1}, over={1,0.1,0.7,0.4} },
        strokeColor = { default={1,0.4,0,1}, over={0.8,0.8,1,1} },
        strokeWidth = 4
    }
)

-----------------------------------------------------------------------------------------------------------------
-- country buttons Function
-----------------------------------------------------------------------------------------------------------------

local function showInfo(event)
    
	local customParams={
	    countryName=event.target.id
	}

	composer.gotoScene("infoScene", {effect="slideRight", time=500, params=customParams})
	
end


local widget=require("widget")


-----------------------------------------------------------------------------------------------------------------
-- Country buttons looping
-----------------------------------------------------------------------------------------------------------------
 
-- create()
function scene:create( event )

    local sceneGroup = self.view



 
	
end
   
    
-----------------------------------------------------------------------------------------------------------------
-- Scrolling
----------------------------------------------------------------------------------------------------------------- 
-- show()
function scene:show( event )
 local sceneGroup = self.view
 local phase = event.phase
 
 
 
 	--jake test
local 	countryTest = {}
local 	dataTest = {}
local 	buttons = {value}
local	buttonView={}

TableId = event.params.tableId	
print(TableId)	
for key,value in pairs(countryData[TableId]) do
	if(key ~= "Country" and key ~= "Zimbabwe" and key ~= "Zambia" and key ~=" china") then
		table.insert(countryTest, key)
		table.insert(dataTest, value)
	end 
end
	
local 	sort_relative = function(ref, t, cmp)
local 	n = #ref
    assert(#t == n)
local r = {}
    for i=1,n do r[i] = i end
		if not cmp then cmp = function(a, b) return a < b end end
			table.sort(r, function(a, b) return cmp(ref[a], ref[b]) end)
		for i=1,n do r[i] = t[r[i]] end
    return r
	end

local sorted = sort_relative(dataTest, countryTest)




  if ( phase == "will" ) then


-----------------------------------------------------------------------------------------------------------------
-- country buttons Function
-----------------------------------------------------------------------------------------------------------------

local function showInfo(event)
    
	local customParams={countryName=event.target.id}
	composer.gotoScene("infoScene", {effect="slideLeft", time=500, params=customParams})
	
end

yCount = 60
xCount = 0
squareSize=80
for key, value in pairs(sorted) do
	
	--print(key, value)
	

	
	
		-- Create 2D array to hold our objects.
		buttons = {}
		
		buttons[key] = widget.newButton(
		{
		--label = i.." country",
		label = key.."  "..value,
		labelColor = {default = {0,0,0}},
		id = value,
		shape = "roundrect",
		cornerRadius = 2,
		x = 80,
		y = yCount,
		width = squareSize,
		height = squareSize,
		defaultFile = value.."-01.png",
		--fillColor = { default={1,0,0,1}, over={1,0.1,0.7,0.4} },
        --strokeColor = { default={1,0.4,0,1}, over={0.8,0.8,1,1} },
        --strokeWidth = 4
		--labelAlign = left,
		--onRelease = showInfo,
		--labelColor = {default = {0,0,0}},
		--labelXOffset = -10,
		--labelYOffset = 10,
		--align = "left",
		}
		)
		yCount = yCount + 60
		sceneGroup:insert(scrollView)
		scrollView:insert( buttons[key] )
--]]
end

   --sceneGroup:insert(searchBar)
    sceneGroup:insert(sortBtn)
	
 

	

    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
 
    end
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