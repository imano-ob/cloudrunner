-- Balao Spawner

require 'class'
require 'balao'

BalaoSpawner = class()

function BalaoSpawner:init()
	self.baloes = {}
	self.time1 = love.timer.getTime()
end

function BalaoSpawner:update(dt)
	-- movimentacao de balao
	self.time2 = love.timer.getTime()
	if (self.time2 - self.time1 > 3) then
		if math.random() > 0.5 then
			table.insert(self.baloes, Balao(math.random()*love.graphics.getWidth(), 100+love.graphics.getHeight()))
		end
		self.time1 = self.time2
	end
	for i, balao in pairs(self.baloes) do
		balao:update(dt)
	end
end

function BalaoSpawner:draw()
	for i, balao in pairs(self.baloes) do
		balao:draw()
	end
end