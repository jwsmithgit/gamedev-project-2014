require("libs/AnAL")
require("objects/player")

-- runs when game is loaded
function love.load()

	player.load()

	explosion = love.graphics.newImage("images/explosion.png")
	anim_explosion = newAnimation( explosion, 96, 96, 0.1, 0 )

	explosion_bounce = love.graphics.newImage("images/explosion.png")
	anim_explosion_bounce = newAnimation( explosion, 96, 96, 0.1, 0 )
	anim_explosion_bounce:setMode("bounce")

end

-- update functions run every step (30 times a second)
-- dt is the time between each step
function love.update(dt)
	player.update(dt)
	-- Updates the animation. (Enables frame changes)
	anim_explosion:update(dt)   
	anim_explosion_bounce:update(dt)  
end

-- runs when game is drawn
function love.draw() 
	anim_explosion:draw(200,100)
	anim_explosion_bounce:draw(300,100)
	player.draw()
end