-- for love 0.9.1, patched for 11.5


function love.load()

	-- codepage 437, 8x16 px, 80x30 chars (640x480)
	monoFont = love.graphics.newFont("Mx437_IBM_VGA_8x16.ttf", 16)
	FONT_WIDTH = 8
	FONT_HEIGHT = 16
	love.graphics.setFont( monoFont )
	print(monoFont:getWidth("█"))
	print(monoFont:getHeight())


  helpText = "Type away! -- "
	keyValue = "nil"
	scanValue = ""
	textValue = ""
	stringValue = ""


end


function love.textinput(t)
    textValue = t
    stringValue = stringValue .. t
end


function love.keypressed(key, scancode, isrepeat)
	-- report the key's key
	keyValue = key
	scanValue = scancode
	-- trap 'escape' unicode 27 to quit
	if key == "escape" then
		love.filesystem.write( "textdump.txt", stringValue )		
		love.event.quit()
	end
end


function love.joystickpressed(joystick,button)
	-- detect joystick input
end

-- love.mousepressed( x, y, button, istouch, presses )
-- number presses
-- The number of presses in a short time frame and small area, used to simulate double, triple clicks
function love.mousepressed(x, y, button, istouch)
	-- detect mouse presses
end

-- love.touchpressed( id, x, y, dx, dy, pressure )
-- number pressure
-- The amount of pressure being applied. Most touch screens aren't pressure sensitive, in which case the pressure will be 1.
function love.touchpressed( id, x, y, dx, dy, pressure )
	-- detect touches
end

function love.draw()
    -- set font before draw text
    love.graphics.setFont(monoFont)
    
    -- concat each char as they are typed
    love.graphics.printf(helpText, 0, 0, 800)
    love.graphics.print("keypressed  (key) = " .. keyValue, 150, 150)
    love.graphics.print("keypressed (scan) = " .. scanValue, 150, 200)
    love.graphics.print("textinput  (text) = " .. textValue, 150, 250)
    if textValue == "™" then
	    love.graphics.print("Trade Mark pressed (Opt-2)", 150, 450)
    end
end