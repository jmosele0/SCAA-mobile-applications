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
		hideBackground = true,
		
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
for key,value in pairs(countryData[TableId]) do
	if(key ~= "Country" and key ~= "Zimbabwe" and key ~= "Zambia" and key ~= " China" and key~= "FYR" and key ~= "Hong Kong Sar") then
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

function Reverse (arr)
	local i, j = 1, #arr

	while i < j do
		arr[i], arr[j] = arr[j], arr[i]

		i = i + 1
		j = j - 1
	end
end

local sortedReverse = Reverse(sorted)

  if ( phase == "will" ) then


-----------------------------------------------------------------------------------------------------------------
-- country buttons Function
-----------------------------------------------------------------------------------------------------------------

local function showInfo(event)
    
	local customParams={countryName=event.target.id}
	composer.gotoScene("infoScene", {effect="slideLeft", time=500, params=customParams})
	
end

local paint = {
    type = "gradient",
    color1 = { 0, 0, 0.4 },
    color2 = { 1, 1, 1, 1 },
    direction = "up"
}

	local rect = display.newRect( display.contentCenterX, display.contentCenterY, 600, 700 )
	rect.fill = paint
		
		sceneGroup:insert(rect)

yCount = 60
xCount = 0
squareSize=200
for key, value in pairs(sorted) do

	-- Create 2D array to hold our objects.
		buttons = {}
		
		buttons[key] = widget.newButton(
		{
		label = "  "..key.."  "..value,
		labelAlign = "left",
		onRelease = showInfo,
		--textOnly = true,
		id = value,
		shape = "roundrect",
		cornerRadius = 2,
		x = 130,
		y = yCount,
		}
		)
		yCount = yCount + 60
		--sceneGroup:insert(scrollView)
		scrollView:insert( buttons[key] )
		sceneGroup:insert(scrollView)
		

end

   --sceneGroup:insert(searchBar)
    sceneGroup:insert(sortBtn)
	
local sortTable = {[1]="Overall Score", [30]="Government Accountability", [3]="Absence of Corruption", [9]="Fundamental Rights", [18]="Order and Security", [41]="Civil & Criminal Justice"}

local sortTitle = display.newText( sortTable[TableId],115, 1, arial, 18)
sortTitle:setFillColor(0,0,0)

sceneGroup:insert(sortTitle)

	

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
		composer.removeScene("rankScene")
 
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