--[[
    GD50
    Legend of Zelda

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

Hitbox = Class{}

function Hitbox:init(x, y, width, height)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
end

function Hitbox:collides(object)
    return not (self.x + self.width < object.x or self.x > object.x + object.width or
                self.y + self.height < object.y or self.y > object.y + object.height)
end