-- import lua files

-- 3rd party libs
require "libs/AnAL" -- animation library
local astray = require "libs/astray" -- random dungeon library
local gamera = require "libs/gamera" -- camera library
local bump = require "libs/bump" -- collision library
local slam = require "libs/slam" -- audio library

local data = require "objects/data"  -- data map for enemies, abilities, etc

local zbuffer = require "objects/zbuffer"  -- depth manager

local tilegrid = require "objects/tilegrid" -- grid of ground tile
local objectgrid = require "objects/objectgrid"  -- grid of objects 

local player = require "objects/player" -- player object

-- generate astray map
local symbols = {Wall='#', Empty=' ', DoorN=' ', DoorS=' ', DoorE=' ', DoorW=' '}
local generator = astray.Astray:new( 20, 10, 15, 70, 80, astray.RoomGenerator:new(4, 2, 6, 2, 6) )
local dungeon = generator:GenerateDungeon()
local tiles = generator:CellToTiles(dungeon, symbols )
generator:GenerateSparsifyMaze(dungeon)
local tiles = generator:CellToTiles(dungeon, symbols )
generator:GenerateRemoveDeadEnds(dungeon)
local tiles = generator:CellToTiles(dungeon, symbols )
generator:GeneratePlaceRooms(dungeon)
local tiles = generator:CellToTiles(dungeon, symbols )
generator:GeneratePlaceDoors(dungeon)
local tiles = generator:CellToTiles(dungeon, symbols )

local tsize = 32; -- tile size variable
local tgrid = tilegrid.new( tiles, #tiles + 1, #tiles[1] + 1, 4 ) -- +1 because tiles is 0 based
local cam = gamera.new( 0, 0, #tgrid.m * tsize, #tgrid.m[1] * tsize )

local ogrid = objectgrid.new( tgrid.m, #tgrid.m, #tgrid.m[1] )

local world = bump.newWorld() -- World creation

local p1 = player.new( 1000, 1000 )


------------------------
-- helper functions
------------------------

function drawdungeon(tiles, width, height)
    for y = 0, height do
        local line = ''
		for x = 0, width do
			line = line .. tiles[x][y]
		end
		print(line)
	end
	print('')
end

function writeDungeon(tiles, width, height)
	file = io.open("test.lua", "w")
	io.output(file)

    for y = 0, height do
        local line = ''
		for x = 0, width do
			line = line .. tiles[x][y]
		end
		-- write line to file
		io.write(line)
		io.write("\n")
	end
	io.close(file)
end


------------------------
-- LOVE2D functions
------------------------

-- runs when game is loaded
function love.load()

	--drawdungeon( tiles, #tiles, #tiles[1] )
	--drawdungeon( tgrid.m, #tgrid.m, #tgrid.m[1] )

	scaleinc = 1;

	-- TODO: zbuffer list, holds an elements for each y pixel
	--		as camera moves, lists are updated, list position is object yorigin position - camera yposition
	--		when objects are drawn, they are drawn in order of the zbuffer, y-resolution -> zero. Draw event loops through objects

	-- TODO: have database object that holds enemy, item and attack data
	-- 		define variables for each object in database
	-- 		be able to look up data from/for objects, give object name, and variable to find value

	-- TODO: create sound manager object, that takes sounds and plays them

	-- TODO: create music manager object, that takes songs and plays them

	-- TODO: player UI object, show health, updated when player is hit

	-- TODO: card UI object, shows current hand, gets cards added when drawing, gets cards removed when abilities used

end

-- update functions run every step (30 times a second)
-- dt is the time between each step
function love.update( dt )

	-- call player update function
	p1:update( dt )
	cam:setPosition( p1.x, p1.y )

	-- TODO: resolve any collisions, check objects with zbuffer

end

function imageDraw()
	local l, t, w, h = cam:getVisible()
	tgrid:draw( l, t, w, h )
	love.graphics.draw( p1.img, p1.x, p1.y )
end


-- runs when game is drawn, every step
function love.draw() 

	
	--[[cam:setAngle( cam:getAngle() + .01)

	if cam:getScale() >= 3 then
		scaleinc = -1
	elseif cam:getScale() <= 0.4 then
		scaleinc = 1
	end

	if scaleinc == 1 then	
		cam:setScale( cam:getScale() + .005)
	elseif scaleinc == -1 then
		cam:setScale( cam:getScale() - .005)
	end]]--
	

	cam:draw(imageDraw)

	-- call player draw function
	--[[
	enemyGen.draw()

	-- update explosion animations
	anim_explosion:draw(200,100)
	anim_explosion_bounce:draw(300,100)

	zbuffer.draw()]]--

	-- loop through zbuffer and draw objects

end