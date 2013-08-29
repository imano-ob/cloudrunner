-- Main de CloudRunner

require 'cloud_strife'
require 'cloudinho_spawner'

function love.load()
	bg = love.graphics.newImage("paris.jpg")
	music = love.audio.newSource("processing_defconzero.mp3")
	love.audio.play(music)
	strife = CloudStrife(100,100)
	cloudinho_spawner = CloudinhoSpawner()
	bgx = 0
	time1 = love.timer.getTime()
end
	
function love.update(dt)
	strife:update(dt)
	cloudinho_spawner:update(dt, strife)
	bgx = bgx + 50 * dt
	
	time2 = love.timer.getTime()
	if (time2 - time1 > 5) then
		strife:raiseLife(20)
		time1 = time2
	end
	
end

function love.draw()
	love.graphics.draw(bg, -bgx, 0, 0, 1, 1)
    strife:draw()
	cloudinho_spawner:draw()
end

function love.mousepressed(x, y, button)
end

function love.keypressed(key, unicode)
end