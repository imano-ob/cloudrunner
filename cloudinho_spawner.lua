-- Cloudinho Spawner

require 'class'
require 'cloudinho'
require 'collision'
require 'cloud_strife'

CloudinhoSpawner = class()

function CloudinhoSpawner:init()
	self.cloudinhos = {}
	self.time1 = love.timer.getTime()
end

function CloudinhoSpawner:update(dt, strife)
	-- movimentacao de cloudinho
	self.time2 = love.timer.getTime()
	if (self.time2 - self.time1 > 3) then
		if math.random() > 0.5 then
			table.insert(self.cloudinhos, Cloudinho(1000, math.random()*love.graphics.getHeight()))
		end
		self.time1 = self.time2
	end
	for i, cloudinho in pairs(self.cloudinhos) do
		cloudinho:update(dt)
		if isColliding(cloudinho, strife) then
		  strife:raiseLife(20)
		  self.cloudinhos[i] = nil
		  --table.remove(self.cloudinhos, )
		end
	      end
	      
end

function CloudinhoSpawner:draw()
	for i, cloudinho in pairs(self.cloudinhos) do
		cloudinho:draw()
	end
end