zbuffer = {}

function zbuffer.new( )
	
	-- create 2d array, with first layer representing y pixels
	-- second layer represents sorted objects in that layer

	--[[zbuffer.m = {}          -- create the matrix
    for i = 1, love.graphics.getHeight() do
      	zbuffer.m[i] = {}     -- create a new row
    end]]--

    -- tile table
    zbuffer.tm = {}

end

function zbuffer.update( dt )
	-- iterate through m and update animations of objects
	-- from height of screen to 1
	-- from unknown to unkown

	--[[for j = love.graphics.getHeight( ), 1 do
		-- i is key/index, v is value
		for i, v in ipairs( zbuffer.m[j] ) do

			-- v will be the object/table, update its animation
			v.img:update(dt)

		end
	end]]--
end

function zbuffer.draw()
	
	-- iterate through m and draw objects
	-- from height of screen to 1
	-- from unknown to unkown

	--[[for j = love.graphics.getHeight( ), 1 do
		-- i is key/index, v is value
		for i, v in ipairs( zbuffer.m[j] ) do
			-- v will be the object/table, update its animation

			v.img:draw(i, j)

		end
	end]]--

	-- draw tiles
	for j = love.graphics.getHeight( ), 1 do
		-- i is key/index, v is value
		for i, v in ipairs( zbuffer.m[j] ) do
			-- v will be the object/table, update its animation

			v.img:draw(i, j)

		end
	end
	
end

-- add object to zbuffer
function zbuffer.add( v, i, j )

	-- insert takes a table, key and value, and inserts the key/value into the table, shifts all higher keys up
	table.insert( zbuffer.m[j], i, v )

end

-- delete object from zbuffer
function zbuffer.delete( i, j )

	-- remove takes a table and a key, then removes the key/value, then shifts all other key/values down
	table.remove( zbuffer.m[j], i )

end

function zbuffer.shift( n )

	for j = love.graphics.getHeight( ), 1 do
		-- i is key/index, v is value
		for i, v in ipairs( zbuffer.m[j] ) do
			-- v will be the object/table, update its animation

			v.img:draw(i, j)

		end
	end

end
