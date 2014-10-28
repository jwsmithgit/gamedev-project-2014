local objectgrid = {}

function objectgrid:load( tile, width, height )

	self.width = width
	self.height = height

	self.m = {}          -- create the matrix
    for i = 1, self.width do
      	self.m[i] = {}     -- create a new row

      	for j = 1, self.height do
      		self.m[i][j] = 0 -- create hash for position, multiple objects at same position
      	end
    end

    self.free = {}

    -- iterate through astray and assign that value to 4x4 grid in m

	for y = 1, height do
    	for x = 1, width do

			--self.m[x][y] = tile[x][y]

			-- add free positions to list
			if tile[x][y] == " " then
				self.free[#self.free + 1] = { ["x"] = x, ["y"] = y }
			end

		end
	end

end

-- draw the tiles based on current screen
function objectgrid:draw( left, right, top, bottom )
	
	local tleft = math.ceil(left/global.tilesize)
	local tright = math.ceil(right/global.tilesize) + 1
	local ttop = math.ceil(top/global.tilesize)
	local tbottom = math.ceil(bottom/global.tilesize) + 1

	local tsize = global.tilesize

	for x = tleft, tright  do
		for y = ttop, tbottom do 

			if x >= 1 and x <= #self.m and y >= 1 and y <= #self.m[1] then
		        love.graphics.draw( 
		        	self[ self.m[x][y] ], 
		            ( (x - tleft ) * tsize ) - ( left % tsize ), 
		            ( (y - ttop ) * tsize ) - ( top % tsize ))
	    	end
		end
	end

end

-- place enemy objects in objectgrid
function objectgrid:populate( n )

	for i=1, n do

		math.random( #data.enemies )
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