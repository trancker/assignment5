--[[
    GD50
    Legend of Zelda

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

Projectile = Class{}

function Projectile:init(def, x, y, direction)
-- string identifying this object type
    self.type = def.type

    self.texture = def.texture
    self.frame = def.frame or 1

    self.direction = direction

    self.speed = def.speed

    self.defaultState = def.defaultState
    self.state = self.defaultState
    self.states = def.states
    self.distance = def.distance

    -- dimensions
    self.x = x
    self.y = y
    self.width = def.width
    self.height = def.height
end

function Projectile:update(dt)
	if self.direction == 'left' then
		self.x = self.x - self.speed * dt
		if self.x < self.x - self.distance then
			self.x = self.x - self.distance
		end
	elseif self.direction == 'right' then
		self.x = self.x + self.speed * dt
		if self.x > self.x + self.distance then
			self.x = self.x + self.distance
		end
	elseif self.direction == 'down' then
		self.y = self.y + self.speed * dt
		if self.y > self.y + self.distance then
			self.y = self.y + distance
		end
	elseif self.direction == 'up' then
		self.y = self.y - self.speed * dt
		if self.y < self.y + self.distance then
			self.y = self.y - distance
		end
	end
end

function Projectile:render(adjacentOffsetX, adjacentOffsetY)
	love.graphics.draw(gTextures[self.texture], gFrames[self.texture][self.states[self.state].frame or self.frame],
        self.x + adjacentOffsetX, self.y + adjacentOffsetY)
end