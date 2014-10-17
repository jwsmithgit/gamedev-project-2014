enemyGen = {}

function enemyGen.load()
		math.randomseed(os.time())
		numb = math.floor( math.random( 2 ) )
		enemyimg = ""
		enemyGen.x = 400
		enemyGen.y = 400
		enemyGen.type(numb);


end

function enemyGen.type(randNum)
	if(randNum == 0) then
		enemy.load(enemyGen.x, enemyGen.y);
		-- insert the chosen art image, and the random OK'd position
	
	elseif(randNum == 1) then
		enemy.load( enemyGen.x, enemyGen.y);
	
	elseif(randNum == 2) then
		enemy.load( enemyGen.x, enemyGen.y);
	
	elseif(randNum == 3) then
		enemy.load( enemyGen.x, enemyGen.y);

	elseif (randNum == 4)then
		enemy.load( enemyGen.x, enemyGen.y);

	end
	
end
	

function enemyGen.draw()

	enemy.draw()
end