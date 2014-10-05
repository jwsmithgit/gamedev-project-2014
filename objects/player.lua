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
end

function player.update(dt)
	
	--move player
	if (player.state == "stop") or (player.state == "walk") then
			player.move(player.speed * dt)
	end

end

function player.stop()
	
end

function player.attack()
	
end

function player.move(speed)
	local xmove = 0
	local ymove = 0

	-- xmovement, left key cancels out right key and vice versa
	if (love.keyboard.isDown("left")) then
		xmove = xmove - 1
	end
	if (love.keyboard.isDown("right")) then
		xmove = xmove + 1
	end
	player.x = player.x + (xmove * speed)

	-- ymovement, up key cancels out down key and vice versa
	if (love.keyboard.isDown("up")) then
		ymove = ymove - 1
	end
	if (love.keyboard.isDown("down")) then
		ymove = ymove + 1
	end
	player.y = player.y + (ymove * speed)
	
end

function player.draw()
	love.graphics.draw(player.img, player.x, player.y)
	
end