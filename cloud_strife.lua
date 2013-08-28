-- Cloud Strife, the hero of the game!

require 'class'

CloudStrife = class()

function CloudStrife:init(posx, posy)
	self.image = love.graphics.newImage("nuvem.png")	--sprite
	self.posx = posx		-- posicao x
	self.posy = posy		-- posicao y
	self.life = 100			-- vida
end

function CloudStrife:__tostring()
	return self.posx..', '..self.posy
end

function CloudStrife:update(dt)
	-- movimentacao de cloud
	if love.keyboard.isDown("down") then
		if self.posy < (love.graphics.getHeight()) then
			self.posy = self.posy + 100 * dt
		end
	end
	if love.keyboard.isDown("up") then
		if self.posy > 10 then
			self.posy = self.posy - 100 * dt
		end
	end
	if love.keyboard.isDown("right") then
		if self.posx < (love.graphics.getWidth()) then
			self.posx = self.posx + 100 * dt
		end
	end
	if love.keyboard.isDown("left") then
		if self.posx > 10 then
			self.posx = self.posx - 100 * dt
		end
	end
	
	-- vida diminui com o tempo
	self.life = self.life - 5*dt
end

function CloudStrife:raiseLife(dlife)
	self.life = self.life + dlife
end

function CloudStrife:draw()
	-- sprite depende de posicao e vida
	love.graphics.draw(self.image, self.posx, self.posy, 0, 0.5 * self.life / 100, 0.5 * self.life / 100)
end
