local enemy1 = {}
enemy1.imgleft = love.graphics.newImage("images/enemy1left.png")
enemy1.imgright = love.graphics.newImage("images/enemy1right.png")
enemy1.speed = 10

function enemy1:load( px, py )

	self.x = px;
	self.y = py;
	self.img = enemy1.imgright

	self.state = "move"

end

function enemy1:update(dt)

	-- move left
	if ( self.x > player.x ) then
		self.x = self.x - ( self.speed * dt )
		self.img = enemy1.imgleft
	end
	-- move right
	if ( self.x < player.x ) then
		self.x = self.x + ( self.speed * dt )
		self.img = enemy1.imgright
	end
	-- move up
	if ( self.y > player.y ) then
		self.y = self.y - ( self.speed * dt )
	end
	-- move down
	if ( self.y < player.y ) then
		self.y = self.y + ( self.speed * dt )
	end

end

function enemy1:draw()

	love.graphics.draw( self.img, self.x, self.y )
	
end

return enemy1