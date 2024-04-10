Pipe = Class{}

function Pipe:init(params)
    self.x = params.x
    self.y = params.y
    self.scored = false
    self.removed = false

    self.width = images['pipe']:getWidth()
end

function Pipe:update(dt)
    self.x = self.x - PIPE_SPEED * dt
end

function Pipe:collides(bird)
    if bird.x + bird.width >= self.x and bird.x <= self.x + self.width then
        if bird.y <= self.y or bird.y + bird.height >= self.y + GAP then
            return true
        end
    end

    return false
end


function Pipe:render()
    love.graphics.draw(images['pipe'], self.x, self.y + GAP)
    love.graphics.draw(images['pipe'], self.x, self.y, 0, 1, -1)
end