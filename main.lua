-- Main de CloudRunner

require 'cloud_strife'
require 'cloudinho_spawner'
require 'balao_spawner'
require 'aviao_spawner'
require 'meteoro_spawner'

function love.load()
	bg = love.graphics.newImage("paris_2.jpg")
	music = love.audio.newSource("processing_defconzero.mp3")
	love.audio.play(music)
	strife = CloudStrife(100,100)
	cloudinho_spawner = CloudinhoSpawner()
	balao_spawner = BalaoSpawner()
	aviao_spawner = AviaoSpawner()
	meteoro_spawner = MeteoroSpawner()
	bgx = 0
	bgspd = 500
	time1 = love.timer.getTime()
end
	
function love.update(dt)
	strife:update(dt)
	cloudinho_spawner:update(dt, strife)
	aviao_spawner:update(dt)
	balao_spawner:update(dt)
	meteoro_spawner:update(dt)
	
	
	bgx = bgx + bgspd * dt
	if(bgx > 3205) then
		bgx = 0
	end
	
	
	
	time2 = love.timer.getTime()
	if (time2 - time1 > 5) then
		--strife:raiseLife(20)
		time1 = time2
	end
end

function love.draw()
	love.graphics.draw(bg, -bgx, 0, 0, 1, 1)
    strife:draw()
	cloudinho_spawner:draw()
	aviao_spawner:draw()
	balao_spawner:draw()
	meteoro_spawner:draw()
end

function love.mousepressed(x, y, button)
end

function love.keypressed(key, unicode)
end
