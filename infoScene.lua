-- Information Scene


local composer = require( "composer" )

 
local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
 
 
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 

 
-- create()
function scene:create( event )
 
    local sceneGroup = self.view
	
    -- Code here runs when the scene is first created but has not yet appeared on screen
 
end
 
 
-- show()
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
	
	local group = display.newGroup()
	

        -- Code here runs when the scene is still off screen (but is about to come on screen)
	-- its just a text field at the moment
 local addressField = native.newTextField( display.contentCenterX, display.contentCenterY * 0.01, 300, 40 )
 local widget=require("widget")
 local scroll = widget.newScrollView
	 {
		left = 0,
		top = 50,
		width = 400,
		height = 500,
		topPadding = -50,
		bottomPadding = 50,
		horizontalScrollDisabled = true,
		verticalScrollDisabled = false,
		backgroundColor = {1,1,1,1},
		listener = scrollListener,
 }
 
local function goBack(event)
	
	composer.gotoScene("searchScene", {effect = "slideRight", time = 500})
	
end

local 	backButton = widget.newButton(
		{
			onRelease = goBack,
			label = "X",
			x = 300,
			y = 80,
			width = 80,
			height = 80,
		}
		)
		

-----------------------------------------------------------------------------------------------------------------
-- Scrolling
-----------------------------------------------------------------------------------------------------------------

local	image=display.newImage(event.params.countryName.."-01.png")
		image.x=55
		image.y=95
		image.width=80
		image.height=80
	
	--sceneGroup:insert(image)



-----------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------
-- Button looping
-----------------------------------------------------------------------------------------------------------------
 
 -- constant variables for buttons
squareSize = 80
label = 60
yCount = 120
xCount = 0

	scroll:insert(backButton)
	
	
	-- print data
	currentCountry = event.params.countryName
	printIndex = 1
	
	countryInfo = display.newText( currentCountry, 175, 100, arial, 16 )
	countryInfo:setFillColor( 1, 0, 0 )
	scroll:insert(countryInfo)
	
	openingLines = display.newText(currentCountry.." has been studied by the World Justice Project and has been given the following scores out of 1:", 155, 270, 300, 200, arial, 16)
	openingLines:setFillColor(0,0,0)
	scroll:insert(openingLines)
	--jake test
	local countryTest = {}
	local dataTest = {}
	
	for key,value in pairs(countryData[1]) do
	if(key ~= "Country" and key ~= "Zimbabwe" and key ~= "Zambia") then
	table.insert(countryTest, key)
	table.insert(dataTest, value)
	end end
	
	local sort_relative = function(ref, t, cmp)
    local n = #ref
    assert(#t == n)
    local r = {}
    for i=1,n do r[i] = i end
    if not cmp then cmp = function(a, b) return a < b end end
    table.sort(r, function(a, b) return cmp(ref[a], ref[b]) end)
    for i=1,n do r[i] = t[r[i]] end
    return r
	end
	
	local sorted = sort_relative(dataTest, countryTest)
	for key, value in pairs(sorted) do
	print(value) end
	
	
	--for key, value in pairs(countryTest) do
	--print(value) end
	--for key, value in pairs(dataTest) do
	--print(value) end
	
	
	
-----------------------------------------------------------------------------------------------------------------
-- Loops through tables and prints out the data for the countries
-----------------------------------------------------------------------------------------------------------------
	yloc = 335
	yloc1 = 270
	while(printIndex <= 55) do
	for key,value in pairs(countryData[printIndex]) do 
	if(key == "Country") then typeOfInfo = display.newText(value..":", 155, yloc, 300, 200, arial, 12)  typeOfInfo:setFillColor( 0, 0, 0 ) yloc = yloc + 50 scroll:insert(typeOfInfo) end end 
	for key,value in pairs(countryData[printIndex]) do 
	if(key == currentCountry) then typeOfInfo = display.newText(value, 20, yloc1, arial, 12)  typeOfInfo:setFillColor( 0, 0, 0 ) yloc1 = yloc1 + 50 scroll:insert(typeOfInfo) end end
	printIndex = printIndex + 1 

	end
	
	hyperLink = "https://www.google.com.au/search?q="..currentCountry.."+media&source=lnms&tbm=nws" --hyperlink
	--put button at bottom of page and insert have it system.openURL(hyperLink)
	local newsButton  = display.newText("Country News (Click Me!)", 175, 150, arial, 16)
	newsButton:setFillColor( 0, 0, 0 )
	function newsButton:tap()
	system.openURL( hyperLink ) -- open URL in browser
	end

	newsButton:addEventListener('tap', newsButton) -- when text is pressed it opens the url
	
	
	scroll:insert(image)
	scroll:insert(newsButton)
	sceneGroup:insert(addressField)
	sceneGroup:insert(scroll)
	sceneGroup:insert(backButton)
	
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