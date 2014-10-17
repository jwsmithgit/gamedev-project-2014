
enemyGen = {}

function enemyGen.load()
		math.randomseed(os.time())
		numb = math.random() % 2;
		enemyimg = ""
		enemy.x = 300
		enemy.y = 300
		enemyGen.type(numb);


end

function enemyGen.type(randNum)
	if(randNum == 0) then
		enemy.load(enemy.x, enemy.y);
		enemyimg = love.graphics.newImage("images/square.png")
		-- insert the chosen art image, and the random OK'd position

	
	elseif(randNum == 1) then
		enemy.load( enemy.x, enemy.y);
		enemyimg = love.graphics.newImage("images/square_old.png")

	
	elseif(randNum == 2) then
			enemy.draw("insertart3", enemy.x, enemy.y); 


	
	elseif(randNum == 3) then
	enemy.draw("insertart4", enemy.x, enemy.y);


	elseif (randNum == 4)then
		enemy.draw("insertart5", enemy.x, enemy.y);

	end
	
end

function enemyGen.draw()
		love.graphics.draw(enemyimg, enemy.x, enemy.y);
	end

	