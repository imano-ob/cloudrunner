-- Buster Spawner

require 'class'
require 'buster'

BusterSpawner = class()

function BusterSpawner:init()
	self.busters = {}
end

function BusterSpawner:add(posx,posy)
	table.insert(self.busters,Buster(posx,posy))
end

function BusterSpawner:update(dt)
	-- movimentacao de buster
			
	for i, buster in pairs(self.busters) do
		buster:update(dt)
		if buster.posx > love.graphics.getWidth() then
			table.remove(self.busters,i)
		end
	end
end

function BusterSpawner:draw()
	for i, buster in pairs(self.busters) do
		buster:draw()
	end
end