local objectgrid = {}
objectgrid.__index = objectgrid

function objectgrid.new(tile, width, height)
	local self = setmetatable({}, objectgrid)

	-- initialize 2d matrix
	self.m = {}
    for i = 0, width-1 do
      	self.m[i] = {}
      	for j = 0, height-1 do
      		self.m[i][j] = 0
      	end
    end

    -- find positions without walls
    self.free = {}
    for i = 0, width do
		for j = 0, height do
			if tile[i][j] == " " then
				table.insert( self.free, { ["x"] = x, ["y"] = y } )
			end
		end
	end

	return self
end

-- draw the tiles based on current screen
function objectgrid:draw(l, r, w, h)
	local tl = math.floor(l/tsize)
	local tt = math.floor(t/tsize)
	local tr = math.floor((l+w)/tsize)
	local tb = math.floor((t+h)/tsize)

	for x = tl, tr do
		for y = tt, tb do 

	        love.graphics.draw( self[ self.m[x][y] ], x*tsize, y*tsize )
		end
	end
end

-- place enemy objects in objectgrid
function objectgrid:populate( n )

	for i=1, n do

		local randomEnemy = math.random( #data.enemies )
		
	end
end

-- called in 0-based function
function objectgrid:get0( i, j )

	return self.m[i + 1][j + 1]
end

-- called from 1-based function
function objectgrid:get1( i, j )

	return self.m[i][j]
end

return objectgrid