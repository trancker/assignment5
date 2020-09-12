PlayerIdlePotState = Class{__includes = EntityIdleState}

function PlayerIdlePotState:enter(params)
    -- render offset for spaced character sprite
    self.entity.offsetY = 5
    self.entity.offsetX = 0
    self.pot = params.pot

	self.entity:changeAnimation('idle-pot-' .. self.entity.direction)
end

function PlayerIdlePotState:update(dt)
    EntityIdleState.update(self, dt)
end

function PlayerIdlePotState:update(dt)
    if love.keyboard.isDown('left') or love.keyboard.isDown('right') or
       love.keyboard.isDown('up') or love.keyboard.isDown('down') then
        self.entity:changeState('walk-pot', {pot = self.pot})
    end

    if love.keyboard.wasPressed('space') then
        Event.dispatch('pot-thrown', {pot = self.pot, direction = self.entity.direction})
        self.entity:changeState('idle')
    end

    self.pot.x, self.pot.y = self.entity.x, self.entity.y
end

function PlayerIdlePotState:render()
    EntityIdleState.render(self)
    self.pot:render(0, -12)
end