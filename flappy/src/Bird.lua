Bird = Class{}



function Bird:init()
    self.x = VIRTUAL_WIDTH / 2 - 8
    self.y = VIRTUAL_HEIGHT/2 - 8
    self.width = 16
    self.height = 16

    self.dy = 0
end

function Bird:update(dt)
    self.dy = self.dy + GRAVITY * dt
    self.y = self.y + self.dy
    if love.keyboard.wasPressed('space') then
        self.dy = JUMP
        sounds['jump']:play()
    end

end

function Bird:render()
    love.graphics.draw(images['bird'], self.x, self.y)
end