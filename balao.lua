-- Balão, inimigo do cloud! 

require 'class'

Balao = class()

function Balao:init(posx, posy)
	self.image = love.graphics.newImage("balao.png")	--sprite
	self.posx = posx		-- posicao x
	self.posy = posy		-- posicao y
	self.velx = math.random()*30 - 15
	self.vely = 30
end

function Balao:__tostring()
	return self.posx..', '..self.posy
end

function Balao:update(dt)
	-- movimentacao de Balao
	if self.posy > -50 then
		self.posx = self.posx - self.velx * dt
		self.posy = self.posy - self.vely * dt
		
	else 
		self.posy = love.graphics.getHeight()+math.random()*200
		self.posx = math.random()*love.graphics.getWidth()
		self.velx = math.random()*30 - 15
	end
end

function Balao:draw()
	love.graphics.draw(self.image, self.posx, self.posy, 0, 0.5, 0.5)
end