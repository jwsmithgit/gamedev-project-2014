local camera = {}
camera.__index = camera

local camera.width = love.graphics.getWidth( )
local camera.height = love.graphics.getHeight( )

function camera:new( px , py )

	-- camera center is in the map

	self.xcenter = px
	self.ycenter = py

	self.xboundary = camera.width / 4
	self.yboundary = camera.height / 4

	self.left = self.xcenter - ( camera.width / 2 )
	self.right = self.left + camera.width
	self.top = self.ycenter - ( camera.height / 2 )
	self.bottom = self.top + camera.height

end

function camera:update( px, py )

	self.xcenter = px
	self.ycenter = py

	local leftNext = self.xcenter - ( camera.width / 2 )
	local rightNext = self.left + camera.width
	local topNext = self.ycenter - ( camera.height / 2 )
	local bottomNext = self.top + camera.height

	-- check zbuffer for objects to delete
	-- update object position in data grid
	--[[for j in zbuffer.m do
		-- check if that y pos is empty

		if next(j) ~= nil then

			-- get lowest and highest value for that yposition
			unpackm = unpack(#j)
			min = math.min(unpackm)
			max = math.max(unpackm)

			-- check if min and max are outside window properties
			-- if outside delete from zbuffer and delete object
			if ( min < self.left - self.boundary ) then
				table.remove( j, min )

			end
			if ( max > self.right + self.boundary ) then
				table.remove( j, max )
			end

		end

	end]]--

	-- remove objects in the lowest and highest yposition

	-- check grid for more objects to spawn
	-- must divide xposition by tile size
	--[[for self.left, leftNext - self.xboundary do

	end
	for self.top, topNext - self.yboundary do

	end
	for self.right, rightNext + self.xboundary do

	end
	for self.left, leftNext + self.yboundary do

	end]]--

	self.left = leftNext
	self.right = rightNext
	self.top = topNext
	self.bottom = bottomNext

end

function camera:draw()
	
end

return camera