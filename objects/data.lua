local data = {}
require("objects/enemy1") -- enemy1 object

function data.load(  )

	data.id = 0

	data.tiles = {}
	data.tiles.wall = { 
		img = love.graphics.newImage("images/tile#.png"),
		symbol = '#'
	}
	data.tiles.ground = {
		img = love.graphics.newImage("images/tile .png"),
		symbol = ' '
	}

	-- array of enemy objects
	data.enemies = {}
	data.enemies[1] = enemy1

	print( data.enemies[1].x )
	
end

-- returns the field of an object
function data.getfield( object, field )

	return data[object][field]
end

-- returns the table of an object
function data.gettable( object )

	return data[object]
end

-- increments and returns unique id for objects
function data.getid()

	data.id = data.id + 1
	return data.id
end

return data