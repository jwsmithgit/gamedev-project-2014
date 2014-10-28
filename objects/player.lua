-- player.lua
-- {} are hash tables, key:value pairs
local player = {}
player.imgdown = love.graphics.newImage("images/playerdown.png")
player.xo = player.imgdown:getWidth() / 2
player.yo = player.imgdown:getHeight() * 3 / 4
player.xb = 4
player.yb = 0
player.w = player.imgdown:getWidth()
player.h = player.imgdown:getHeight()
player.bw = 20
player.bh = player.imgdown:getHeight()

-- this runs when the player is loaded
function player:load( px, py )

	-- placing variables into the {}
	self.state = "stop" --stop/walk/attack
	self.img = love.graphics.newImage("images/playerdown.png")
	self.x = px
	self.y = py
	self.speed = 180
	self.attack_cooldown = 0

end

function player:update( dt )
	
	if love.keyboard.isDown(" ") or self.attack_cooldown > 0 then
		self:attack( dt )
	--move player
	elseif love.keyboard.isDown("left") or love.keyboard.isDown("right") or love.keyboard.isDown("up") or love.keyboard.isDown("down") then
		self:move( self.speed * dt )
	end

end

function player:stop()
	
end

function player:attack( dt )

	if self.attack_cooldown <= 0 then
		self.attack_cooldown = 0.5
	else
		self.attack_cooldown = self.attack_cooldown - dt;
	end

end

function player:move( speed )

	local xmove = 0
	local ymove = 0

	if love.keyboard.isDown("lshift") then
		speed = speed * 2
	end

	-- xmovement, left key cancels out right key and vice versa
	if love.keyboard.isDown("left") then
		xmove = xmove - 1
	end
	if love.keyboard.isDown("right") then
		xmove = xmove + 1
	end
	self.x = self.x + ( xmove * speed )

	-- ymovement, up key cancels out down key and vice versa
	if love.keyboard.isDown("up") then
		ymove = ymove - 1
	end
	if love.keyboard.isDown("down") then
		ymove = ymove + 1
	end
	self.y = self.y + ( ymove * speed )

	-- change state
	if ( xmove == 0 and ymove == 0) then
		self.state = "stop"
	else 
		self.state = "walk"
	end
	
end

function player:draw()

	love.graphics.draw( self.img, self.x, self.y )
	
end

return player