-- meteoro Spawner

require 'class'
require 'meteoro'

MeteoroSpawner = class()

function MeteoroSpawner:init()
	self.meteoros = {}
	self.time1 = love.timer.getTime()
end

function MeteoroSpawner:update(dt)
	-- movimentacao de meteoro
	self.time2 = love.timer.getTime()
	if (self.time2 - self.time1 > 3) then
		if math.random() > 0.5 then
			table.insert(self.meteoros, Meteoro(500+love.graphics.getWidth(), math.random()*love.graphics.getHeight()))
		end
		self.time1 = self.time2
	end
	for i, meteoro in pairs(self.meteoros) do
		meteoro:update(dt)
	end
end

function MeteoroSpawner:draw()
	for i, meteoro in pairs(self.meteoros) do
		meteoro:draw()
	end
end