local tilegrid = {}
tilegrid.__index = tilegrid

tilegrid["#"] = love.graphics.newImage("images/tile#.png")
tilegrid[" "] = love.graphics.newImage("images/tile .png")

local tsize = 32

function tilegrid.new( astray, spread, world, tsize )

	local self = setmetatable({}, tilegrid)

	local width, height = #astray+1, #astray[1]+1

	-- initialize 2d matrix
	self.m = {} -- symbol matrix
    for i = 0, (width*spread)-1 do
      	self.m[i] = {}
      	for j = 0, (height*spread)-1 do
      		self.m[i][j] = 0
      	end
    end

    -- set values in 2d array based on astray generation
    for x = 0, width-1 do
		for y = 0, height-1 do
			
			for i = 0, spread-1 do
				for j = 0, spread-1 do

					local xp, yp = x*spread+i, y*spread+j
					self.m[xp][yp] = astray[x][y]

					-- if wall tile, add object to collision map
					if (astray[x][y] == "#") then
						-- stored as [#][xp][|][yp]
						world:add("#"..xp.."|"..yp, xp*tsize, yp*tsize, tsize,tsize)
					end
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
	local tr = math.floor((l+w-1)/tsize)
	local tb = math.floor((t+h-1)/tsize)

	for x = tl, tr do
		for y = tt, tb do 
	        love.graphics.draw( self[ self.m[x][y] ], x*tsize, y*tsize )
		end
	end
end

function tilegrid:getSymbol( i, j )
	return self.m[i][j]
end

return tilegrid