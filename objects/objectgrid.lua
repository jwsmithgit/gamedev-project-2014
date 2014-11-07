local objectgrid = {}
objectgrid.__index = objectgrid

-- tm tilematrix
function objectgrid.new(tm)
	local self = setmetatable({}, objectgrid)

	local w, h = #tm, #tm[1]

	-- initialize 2d matrix
	self.m = {}
    for i = 0, w-1 do
      	self.m[i] = {}
      	for j = 0, h-1 do
      		self.m[i][j] = 0
      	end
    end

    -- find free positions
    self.f = {}
    for i = 0, w-1 do
		for j = 0, h-1 do
			if tm[i][j] == " " then
				table.insert( self.f, { ["x"] = i, ["y"] = j } )
			end
		end
	end

	return self
end

function objectgrid:update( player, dx, l, t, w, h)
	local tsize = 32
	local tl = math.floor(l/tsize)
	local tt = math.floor(t/tsize)
	local tr = math.floor((l+w)/tsize)
	local tb = math.floor((t+h)/tsize)

	for x = tl, tr do
		for y = tt, tb do 

			if self.m[x][y] ~= 0 then
	        	self.m[x][y]:update(dx, player)
	        end
		end
	end
end

-- draw the tiles based on current screen
function objectgrid:draw(l, t, w, h)
	local tsize = 32
	local tl = math.floor(l/tsize)
	local tt = math.floor(t/tsize)
	local tr = math.floor((l+w)/tsize)
	local tb = math.floor((t+h)/tsize)

	for x = tl, tr do
		for y = tt, tb do 

			if self.m[x][y] ~= 0 then
	        	love.graphics.draw( self.m[x][y].img, x*tsize, y*tsize )
	        end
		end
	end
end

-- place enemy objects in objectgrid
function objectgrid:populate( n, ot )

	for i=1, n do

		local robj = ot[math.random(#ot)]
		local rpos = math.random(#self.f)
		local pos = self.f[rpos]
		local xpos, ypos = pos.x, pos.y

		self.m[xpos][ypos] = robj.new(xpos,ypos)

		table.remove(self.f, rpos)
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