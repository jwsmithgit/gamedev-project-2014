

enemy = {}

function enemy.load( x, y )
	enemy.x = x;
	enemy.y = y;
	enemy.speed = 10;
	enemy.img = love.graphics.newImage("images/square.png")
	enemy.state = "move"

	end

function enemy.update(dt)

		if(enemy.x > player.x) then
			enemy.x = enemy.x - (enemy.speed*dt)
		end
		if(enemy.x < player.x) then
			enemy.x = enemy.x + (enemy.speed*dt)
		end
		if(enemy.y > player.y) then
			enemy.y = enemy.y - (enemy.speed*dt)
		end
		if(enemy.y < player.y) then
			enemy.y = enemy.y + (enemy.speed*dt)
		end


	end

function enemy.draw()
	love.graphics.draw(enemy.img, enemy.x, enemy.y)
end



