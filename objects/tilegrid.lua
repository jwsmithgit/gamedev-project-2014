local tilegrid = {}
tilegrid.__index = tilegrid

tilegrid["#"] = love.graphics.newImage("images/tile#.png")
tilegrid[" "] = love.graphics.newImage("images/tile .png")

function tilegrid.new( astray, width, height, spread )
	local self = setmetatable({}, tilegrid)

	-- initialize 2d matrix
	self.m = {}
    for i = 0, (width*spread)-1 do
      	self.m[i] = {}
      	for j = 0, (height*spread)-1 do
      		self.m[i][j] = 0
      	end
    end

    -- set values in 2d array based on astray generation
	for y = 0, height-1 do
    	for x = 0, width-1 do
			
			for j = 0, spread-1 do
				for i = 0, spread-1 do
					self.m[(x*spread) + i][(y*spread) + j ] = astray[x][y]
				end
			end

		end
	end

	return self
end

function tilegrid:draw(l, t, w, h)
	local tsize = tilegrid["#"]:getWidth()
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

function tilegrid:get( i, j )
	return self.m[i][j]
end

return tilegrid