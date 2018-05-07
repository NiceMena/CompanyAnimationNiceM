-----------------------------------------------------------------------------------------
--
-- splash_screen.lua
-- Created by: Nice Mena
-- Date: april 30th 2018
-- Description: This is the splash screen of the game. It displays the 
-- company logo that flies across the screen
-----------------------------------------------------------------------------------------

-- Use Composer Library
local composer = require( "composer" )

-- Name the Scene
sceneName = "splash_screen"

-----------------------------------------------------------------------------------------

-- Create Scene Object
local scene = composer.newScene( sceneName )

----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

-- The local variables for this scene
local companyLogo
local areaText
local scrollXSpeed = 6
local scrollYSpeed = 1

-----------------------------------------------------------------------------------------------
--SOUNDS
-------------------------------------------------------------------------------------------------
local fazSounds

-- background sound
local fazSounds = audio.loadSound("Sounds/New Recording 3.mp3")
local fazSoundsChannel

--------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
--------------------------------------------------------------------------------------------

-- The function that moves the company logo across the screen
local function movecompanyLogo()
    companyLogo.x = companyLogo.x + scrollXSpeed
    companyLogo.y = companyLogo.y + scrollYSpeed
end

local function MainMenuTransition ()
    -- Go to the intro screen
    composer.gotoScene( "main_menu" )
end 

local function MovedareaText(event)
      --add the scroll speed to the x-value of text
      areaText.x = areaText.x + scrollSpeed
end

-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -- set the background to be black
    display.setDefault("background", 0, 0, 0)

    -- Insert the company logo image
    companyLogo = display.newImageRect("Images/CompanyLogoNice.png", 200, 200)
    companyLogo:rotate(-20)
    -- set the initial x and y position of the company logo
    companyLogo.x = 100
    companyLogo.y = display.contentHeight/2

    --------------------------------------------------------------------------------------------
    -- TEXT
    --------------------------------------------------------------------------------------------
    --Display phrase on the screen
    areaText = display.newText("FAZ GAMES", 25, 30, Arial, textSize)
    areaText.x = 300
    areaText.y = 150
    scrollSpeed = 5
    --set the text color
    areaText:setTextColor(65, 150, 175)

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert(companyLogo)
    sceneGroup:insert(areaText)

end -- function scene:create( event )



-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is still off screen (but is about to come on screen).
    if ( phase == "will" ) then
       
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- start the splash screen music
        -- Call the company logo function as soon as we enter the frame.
        -- Movetext will be called over and over again
        Runtime:addEventListener("enterFrame", MovedareaText)
        Runtime:addEventListener("enterFrame", movecompanyLogo)

        fazSoundsChannel = audio.play(fazSounds) 

        timer.performWithDelay(3000, MainMenuTransition)
        
    end

end --function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is on screen (but is about to go off screen).
    -- Insert code here to "pause" the scene.
    -- Example: stop timers, stop animation, stop audio, etc.
    if ( phase == "will" ) then  

    -----------------------------------------------------------------------------------------

    -- Called immediately after scene goes off screen.
    elseif ( phase == "did" ) then

        
    end

end --function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------


    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.
end -- function scene:destroy( event )

-----------------------------------------------------------------------------------------
-- EVENT LISTENERS
-----------------------------------------------------------------------------------------

-- Adding Event Listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )


return scene
