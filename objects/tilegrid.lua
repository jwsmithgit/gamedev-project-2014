local tilegrid = {}
tilegrid["#"] = love.graphics.newImage("images/tile#.png")
tilegrid[" "] = love.graphics.newImage("images/tile .png")

function tilegrid:load( astray, width, height )

	local spread = 4

	self.width = width * spread
	self.height = height * spread

	self.m = {}          -- create the matrix
    for i = 1, self.width do
      	self.m[i] = {}     -- create a new row

      	for j = 1, self.height do
      		self.m[i][j] = 0 -- create hash for position, multiple objects at same position
      	end
    end

    -- iterate through astray and assign that value to 4x4 grid in m

	for y = 0, height-1 do
    	for x = 0, width-1 do
			
			for j = 1, spread do
				for i = 1, spread do
					self.m[(x*spread) + i][(y*spread) + j ] = astray[x][y]
				end
			end

		end
	end

end

-- draw the tiles based on current screen
function tilegrid:draw( left, right, top, bottom )
	
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

-- caled in zero based function
function tilegrid:get0( i, j )

	return self.m[i + 1][j + 1]
end

-- called from 1-based function
function tilegrid:get1( i, j )

	return self.m[i][j]
end

return tilegrid