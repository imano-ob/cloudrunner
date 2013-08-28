-- Nuvenzinha, comida de Cloud!

require 'class'

Cloudinho = class()

function Cloudinho:init(posx, posy)
	self.image = love.graphics.newImage("nuvenzinha.png")	--sprite
	self.posx = posx		-- posicao x
	self.posy = posy		-- posicao y
end

function Cloudinho:__tostring()
	return self.posx..', '..self.posy
end

function Cloudinho:update(dt)
	-- movimentacao de cloudinho
	if self.posx > -50 then
		self.posx = self.posx - 100 * dt
	else self.posx = 900
	self.posy = math.random()*love.graphics.getHeight()
	end
end

function Cloudinho:draw()
  local scale = self:scale()
	love.graphics.draw(self.image, self.posx, self.posy, 0, scale, scale)
      end

function Cloudinho:scale()
  return 0.1
end

function Cloudinho:size()
  local scale = self:scale()
  --Numeros magicos sao o tamanho da imagem original
  local width = scale * 457
  local height = scale * 457
  return width, height
end