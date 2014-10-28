-- import those lua files
-- AnAL is a animation library
require "libs/AnAL"
-- player is an object library
local astray = require "libs/astray"  -- astray object

local data = require "objects/data"  -- data map for enemies, abilities, etc

local camera = require "objects/camera" -- camera objects, uses player
local zbuffer = require "objects/zbuffer"  -- depth manager

local tilegrid = require "objects/tilegrid" -- grid of ground tile
local objectgrid = require "objects/objectgrid"  -- grid of objects 

local collision = require "objects/collision"  -- collision manager

local player = require "objects/player" -- player object

-- global variable table
global = {}

-- iterate through 2d array
function drawdungeon( tiles, width, height )

	-- Opens a file in append mode
	--file = io.open("test.lua", "a")
	-- sets the default output file as test.lua
	--io.output(file)

    for y = 0, height do
        local line = ''
		for x = 0, width do
			--print(x)B
			line = line .. tiles[x][y]
		end
		print(line)
		-- appends a word test to the last line of the file
		--io.write(line)
		--io.write("\n")
	end
	print('')


	-- closes the open file
	--io.close(file)
end


-- runs when game is loaded
function love.load()

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

	-- +1 because tiles is 0 based
	tilegrid:load( tiles, #tiles + 1, #tiles[1] + 1)

	--drawdungeon( tiles, #tiles, #tiles[1] )
	--drawdungeon( tilegrid.m, #tilegrid.m, #tilegrid.m[1] )


	objectgrid:load( tilegrid.m, #tilegrid.m, #tilegrid.m[1] )


	--	GLOBALS
	-- tile size variable
	global.tilesize = 32;


	-- LOAD
	-- call player load function
	player:load( 1000, 1000 )
	camera:load( player.x + player.xo, player.y + player.yo )

	-- create explosion that loops
	--explosion = love.graphics.newImage("images/explosion.png")
	--anim_explosion = newAnimation( explosion, 96, 96, 0.1, 0 )

	-- create explosion that bounces
	--anim_explosion_bounce = newAnimation( explosion, 96, 96, 0.1, 0 )
	--anim_explosion_bounce:setMode("bounce")

	--zbuffer.load()
	--camera.load()


	-- TODO: have window for player with width and height, and tracks (resolution / tile size ), x position, y positions,
	--		window 
	-- TODO: have camera with width and height (resolution), and tracks, xposition, yposition ( similar to window )
	--  	as player moves, adjust camera, enemy, object, and tile spawner
	--		removes objects farther than where they are spawned
	-- TODO: spawner object, checks map for new objects, enemes, tiles as camera scans the maps

	-- TODO: zbuffer list, holds an elements for each y pixel
	--		as camera moves, lists are updated, list position is object yorigin position - camera yposition
	--		when objects are drawn, they are drawn in order of the zbuffer, y-resolution -> zero. Draw event loops through objects



	-- TODO: have database object that holds enemy, item and attack data
	-- 		define variables for each object in database
	-- 		be able to look up data from/for objects, give object name, and variable to find value

	-- TODO: colliion overlord object: database and functions for different collisons
	-- 		transfers data from object to other object. Like damage to health

	-- TODO: create sound manager object, that takes sounds and plays them

	-- TODO: create music manager object, that takes songs and plays them

	-- TODO: player UI object, show health, updated when player is hit

	-- TODO: card UI object, shows current hand, gets cards added when drawing, gets cards removed when abilities used

end

-- update functions run every step (30 times a second)
-- dt is the time between each step
function love.update( dt )

	-- call player update function
	player:update( dt )

	camera:update( player.x + player.xo, player.y + player.yo )

	--print( player.x )

	--enemy.update(dt)

	-- update explosion animations
	--anim_explosion:update(dt)   
	--anim_explosion_bounce:update(dt)  

	--zbuffer.update(dt)
	-- TODO: update window and camera

	-- TODO: check window bounds with spawners, add to scene object. loop through data map,

	-- TODO: update all objects in scene. loop through zbuffer

	-- TODO: resolve any collisions, check objects with zbuffer

end

-- runs when game is drawn, every step
function love.draw() 

	tilegrid:draw( camera.left, camera.right, camera.top, camera.bottom )
	love.graphics.draw( player.img, player.x - camera.left, player.y - camera.top )

	-- call player draw function
	--[[
	enemyGen.draw()

	-- update explosion animations
	anim_explosion:draw(200,100)
	anim_explosion_bounce:draw(300,100)

	zbuffer.draw()]]--

	-- loop through zbuffer and draw objects

end