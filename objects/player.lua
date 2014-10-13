-- player.lua
-- {} are hash tables, key:value pairs
player = {}

-- this runs when the player is loaded
function player.load()

	-- placing variables into the {}
	player.state = "stop" --stop/walk/attack
	player.x = 100
	player.y = 100
	player.speed = 120
	player.img = love.graphics.newImage("images/square.png")
	player.attack_cooldown = 0
end

function player.update(dt)
	
	if love.keyboard.isDown(" ") or player.attack_cooldown > 0 then
		player.attack(dt)
	--move player
	elseif love.keyboard.isDown("left") or love.keyboard.isDown("right") or love.keyboard.isDown("up") or love.keyboard.isDown("down") then
		player.move(player.speed * dt)
	end

end

function player.stop()
	
end

function player.attack(dt)
	if player.attack_cooldown <= 0 then
		player.attack_cooldown = 0.5
	else
		player.attack_cooldown = player.attack_cooldown - dt;
	end
end

function player.move(speed)
	local xmove = 0
	local ymove = 0

	-- xmovement, left key cancels out right key and vice versa
	if love.keyboard.isDown("left") then
		xmove = xmove - 1
	end
	if love.keyboard.isDown("right") then
		xmove = xmove + 1
	end
	player.x = player.x + (xmove * speed)

	-- ymovement, up key cancels out down key and vice versa
	if love.keyboard.isDown("up") then
		ymove = ymove - 1
	end
	if love.keyboard.isDown("down") then
		ymove = ymove + 1
	end
	player.y = player.y + (ymove * speed)

	-- change state
	if ( xmove == 0 and ymove == 0) then
		player.state = "stop"
	else 
		player.state = "walk"
	end
	
end

function player.draw()
	love.graphics.draw(player.img, player.x, player.y)
	
end