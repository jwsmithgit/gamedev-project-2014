-- import those lua files
-- AnAL is a animation library
require("libs/AnAL")
-- player is an object library
require("objects/player")

-- runs when game is loaded
function love.load()

	-- call player load function
	player.load()

	-- create explosion that loops
	explosion = love.graphics.newImage("images/explosion.png")
	anim_explosion = newAnimation( explosion, 96, 96, 0.1, 0 )

	-- create explosion that bounces
	anim_explosion_bounce = newAnimation( explosion, 96, 96, 0.1, 0 )
	anim_explosion_bounce:setMode("bounce")

end

-- update functions run every step (30 times a second)
-- dt is the time between each step
function love.update(dt)

	-- call player update function
	player.update(dt)

	-- update explosion animations
	anim_explosion:update(dt)   
	anim_explosion_bounce:update(dt)  
end

-- runs when game is drawn, every step
function love.draw() 

	-- call player draw function
	player.draw()

	-- update explosion animations
	anim_explosion:draw(200,100)
	anim_explosion_bounce:draw(300,100)
end