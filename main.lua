-- import those lua files
-- AnAL is a animation library
require("libs/AnAL")
-- player is an object library
require("objects/camera")
require("objects/collision")
require("objects/data")
require("objects/objectmap")
require("objects/player")
require("objects/spawner")
require("objects/tilemap")
require("objects/window")
require("objects/zbuffer")

-- runs when game is loaded
function love.load()

	-- call player load function
	player.load()

	tile_size = 32;
	-- TODO: tile size variable

	-- create explosion that loops
	explosion = love.graphics.newImage("images/explosion.png")
	anim_explosion = newAnimation( explosion, 96, 96, 0.1, 0 )

	-- create explosion that bounces
	anim_explosion_bounce = newAnimation( explosion, 96, 96, 0.1, 0 )
	anim_explosion_bounce:setMode("bounce")


	-- TODO: generate level
	--[[
		world holds level for each floor
		level holds variable that has grid of level (tiles)
			tiles for (wall, floor, corners)
		grid of objects (chests) and enemies (positions at start)
			names are stored at location
		]]

	-- TODO: have database object that holds enemy, item and attack data
	-- 		define variables for each object in database
	-- 		be able to look up data from/for objects, give object name, and variable to find value

	-- TODO: have window for player with width and height, and tracks (resolution / tile size ), x position, y positions,
	--		window 
	-- TODO: have camera with width and height (resolution), and tracks, xposition, yposition ( similar to window )
	--  	as player moves, adjust camera, enemy, object, and tile spawner
	--		removes objects farther than where they are spawned
	-- TODO: spawner object, checks map for new objects, enemes, tiles as camera scans the maps

	-- TODO: zbuffer list, holds an elements for each y pixel
	--		as camera moves, lists are updated, list position is object yorigin position - camera yposition
	--		when objects are drawn, they are drawn in order of the zbuffer, y-resolution -> zero. Draw event loops through objects

	-- TODO: colliion overlord object: database and functions for different collisons
	-- 		transfers data from object to other object. Like damage to health

	-- TODO: create sound manager object, that takes sounds and plays them

	-- TODO: create music manager object, that takes songs and plays them

	-- TODO: player UI object, show health, updated when player is hit

	-- TODO: card UI object, shows current hand, gets cards added when drawing, gets cards removed when abilities used

end

-- update functions run every step (30 times a second)
-- dt is the time between each step
function love.update(dt)

	-- call player update function
	player.update(dt)

	-- update explosion animations
	anim_explosion:update(dt)   
	anim_explosion_bounce:update(dt)  


	-- TODO: update window and camera

	-- TODO: check window bounds with spawners, add to scene object. loop through data map,

	-- TODO: update all objects in scene. loop through zbuffer

	-- TODO: resolve any collisions, check objects with zbuffer

end

-- runs when game is drawn, every step
function love.draw() 

	-- call player draw function
	player.draw()

	-- update explosion animations
	anim_explosion:draw(200,100)
	anim_explosion_bounce:draw(300,100)

	-- loop through zbuffer and draw objects


end