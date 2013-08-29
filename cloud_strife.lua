-- Cloud Strife, the hero of the game!

require 'class'
require 'buster_spawner'

CloudStrife = class()

function CloudStrife:init(posx, posy)
	self.image = love.graphics.newImage("nuvem.png")	--sprite
	self.posx = posx		-- posicao x
	self.posy = posy		-- posicao y
	self.centrex = 0			-- posicao do centro x
	self.centrey = 0			-- posicao do centro y		
	self.velx = 100			-- velocidade no eixo y
	self.vely = 100			-- velocidade no eixo x
	self.cooldown = 0		-- cooldown para atirar
	self.life = 100			-- vida
	buster_spawner = BusterSpawner()
end

function CloudStrife:__tostring()
	return self.posx..', '..self.posy
end

function CloudStrife:update(dt)
	-- movimentacao de cloud
	if love.keyboard.isDown("down") then
		if self.posy < (love.graphics.getHeight()) then
			self.posy = self.posy + self.vely * dt
		end
	end
	if love.keyboard.isDown("up") then
		if self.posy > 10 then
			self.posy = self.posy - self.vely * dt
		end
	end
	if love.keyboard.isDown("right") then
		if self.posx < (love.graphics.getWidth()) then
			self.posx = self.posx + self.velx * dt
		end
	end
	if love.keyboard.isDown("left") then
		if self.posx > 10 then
			self.posx = self.posx - self.velx * dt
		end
	end
	
	self.centrex = self.posx + 229 * self.life / 100 / 2	-- mudar pixel do tamanho da imagem
	self.centrey = self.posy + 125 * self.life / 100 / 2
	
	if love.keyboard.isDown(" ") then
		if self.cooldown <= 0 then
			buster_spawner:add(self.centrex, self.centrey)
			self.cooldown = 0.01
		end
	end
	
	buster_spawner:update(dt)
	
	self.cooldown = self.cooldown - dt
	
	-- vida diminui com o tempo
	self.life = self.life - 5*dt
end

function CloudStrife:raiseLife(dlife)
	self.life = self.life + dlife
end


function CloudStrife:draw()
	-- sprite depende de posicao e vida
	buster_spawner:draw()
	local scale = self:scale()
	love.graphics.draw(self.image, self.posx, self.posy, 0, scale, scale)
end

function CloudStrife:scale()
  --Tamanho depende da vida atual
        return self.life / 200
end

function CloudStrife:size()
  --Tamanho depende a vida atual
  local scale = self:scale()
  --Numeros magicos abaixo sao o tamanho original da nuvem
  local width = scale * 457
  local height = scale * 249
  return width, height
end
