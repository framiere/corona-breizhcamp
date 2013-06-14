local physics = require( "physics" )
physics.start()
--physics.setDrawMode( 'debug' )

local sky = display.newImage( "bkg_clouds.png" )
sky.x = 160; sky.y = 195

local ground = display.newImage( "ground.png" )
ground.x = 160; ground.y = 445
physics.addBody( ground, "static", { friction=0.3, bounce=0.3 } )

local leftWall  = display.newRect (-100, 0, 101, display.contentHeight)
local rightWall = display.newRect (display.contentWidth, 0, 100, display.contentHeight)
physics.addBody (leftWall, "static", {bounce =0.3, bounce=0.3 } )
physics.addBody (rightWall, "static", {bounce =0.3, bounce=0.3 } )


function destroyOnTouch( event, params )
	event.target:removeSelf()
	return true
end

function trucQuiTombe(name)
	local truc = display.newImage(name)
	truc.x = math.random(100,200); truc.y = 10; truc.rotation = math.random(0,360)
	physics.addBody( truc, { density=3.0, bounce=math.random(100)/100 } )
	truc:addEventListener("touch", destroyOnTouch)
end

function fontaine(event) 
	if (event.isShake) then
		for i = 1, 10 do
			trucQuiTombe("logos/logo_" .. math.random(1,11) .. ".png")
		end
	end
end

function bomb(event) 
	media.playEventSound("bomb.wav")
end

trucQuiTombe("crate.png")


Runtime:addEventListener("accelerometer", fontaine)
Runtime:addEventListener("tap", bomb)