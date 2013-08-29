-- aviao Spawner

require 'class'
require 'aviao'

AviaoSpawner = class()

function AviaoSpawner:init()
	self.avioes = {}
	self.time1 = love.timer.getTime()
end

function AviaoSpawner:update(dt)
	-- movimentacao de aviao
	self.time2 = love.timer.getTime()
	if (self.time2 - self.time1 > 3) then
		if math.random() > 0.5 then
			table.insert(self.avioes, Aviao(500+love.graphics.getWidth(), math.random()*love.graphics.getHeight()))
		end
		self.time1 = self.time2
	end
	for i, aviao in pairs(self.avioes) do
		aviao:update(dt)
	end
end

function AviaoSpawner:draw()
	for i, aviao in pairs(self.avioes) do
		aviao:draw()
	end
end