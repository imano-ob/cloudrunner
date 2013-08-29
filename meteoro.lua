-- Meteoro, inimigo de Cloud!

require 'class'

Meteoro = class()

function Meteoro:init(posx, posy)
	self.image = love.graphics.newImage("meteoro.png")	--sprite
	self.posx = posx		-- posicao x
	self.posy = posy		-- posicao y
	self.vely = 250 - math.random()*100;
	self.velx = self.vely;
end

function Meteoro:__tostring()
	return self.posx..', '..self.posy
end

function Meteoro:update(dt)
	-- movimentacao de Meteoro
	if self.posx > -50 or self.posy < love.graphics.getHeight() then
		self.posx = self.posx - self.velx * dt
		self.posy = self.posy + self.vely * dt
	else 
		self.posx = love.graphics.getWidth()/3 + math.random()*1000
		self.posy = -500- math.random()*500
		self.vely = 500 - math.random()*100;
		self.velx = self.vely;
	end
end

function Meteoro:draw()
	love.graphics.draw(self.image, self.posx, self.posy, 0, 0.1, 0.1)
end