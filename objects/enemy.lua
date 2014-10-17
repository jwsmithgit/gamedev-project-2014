

enemy = {}

function enemy.load(x , y, pace)
	enemy.x = x
	enemy.y = y
	enemy.speed = pace
	--enemy.img = love.graphics.newImage("images/square.png")
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

function enemy.draw(cimage, x , y)
	love.graphics.draw(cimage, enemy.x, enemy.y)
end

