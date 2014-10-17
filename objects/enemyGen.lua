
enemyGen = {}

function enemyGen.load()
	math.randomseed(os.time())
		numb = math.random() % 5;
		enemy.x = getOKXPostion.tilemap();
		enemy.y = getOKYPostion.tilemap();
		enemyGen.type(numb);


end

function enemyGen.type(randNum)
	if(randNum == 0) then
		enemy.draw("insertart", enemy.x, enemy.y); 
		-- insert the chosen art image, and the random position

	
	elseif(randNum == 1) then
		enemy.draw("insertart2", enemy.x, enemy.y); 

	
	elseif(randNum == 2) then
			enemy.draw("insertart3", enemy.x, enemy.y); 


	
	elseif(randNum == 3) then
	enemy.draw("insertart4", enemy.x, enemy.y);


	elseif (randNum == 4)then
		enemy.draw("insertart5", enemy.x, enemy.y);

	end
	
end