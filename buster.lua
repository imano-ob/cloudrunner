-- Buster, a arma de Cloud!

require 'class'

Buster = class()

function Buster:init(posx, posy)
	self.image = love.graphics.newImage("raio.png")	--sprite
	self.posx = posx		-- posicao x
	self.posy = posy		-- posicao y
	self.velx = 200
end

function Buster:__tostring()
	return self.posx..', '..self.posy
end

function Buster:update(dt)
	-- movimentacao de cloudinho
	self.posx = self.posx + self.velx * dt
end

function Buster:draw()
	love.graphics.draw(self.image, self.posx, self.posy, 0, 0.1, 0.1)
end