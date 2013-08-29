-- Aviao, inimigo de Cloud!

require 'class'

Aviao = class()

function Aviao:init(posx, posy)
	self.image = love.graphics.newImage("aviao.png")	--sprite
	self.posx = posx		-- posicao x
	self.posy = posy		-- posicao y
	self.vely = math.random()*100 - 50;
	self.velx = 250;
end

function Aviao:__tostring()
	return self.posx..', '..self.posy
end

function Aviao:update(dt)
	-- movimentacao de Aviao
	if self.posx > -50 then
		self.posx = self.posx - self.velx * dt
		self.posy = self.posy - self.vely * dt
	else 
		self.posx = love.graphics.getWidth() + math.random()*500
		self.posy = math.random()*love.graphics.getHeight()
		self.vely = math.random()*50 - 25;
	end
end

function Aviao:draw()
	love.graphics.draw(self.image, self.posx, self.posy, 0, 0.5, 0.5)
end