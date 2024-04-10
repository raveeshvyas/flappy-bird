PlayState = Class{}

function PlayState:init()
    self.bird = Bird()
    self.pipes = {}
    self.score = 0
    self.timer = 0
end



function PlayState:update(dt)
    if self.bird.y <= 0 or self.bird.y + self.bird.height >= VIRTUAL_HEIGHT - 16 then
        sounds['collision']:play()
        gStateMachine:change('gameover', {
            score = self.score
        })
    end
    self.bird:update(dt)
    self.timer = self.timer + dt
    if self.timer > 2 then
        self.timer = 0
        table.insert(self.pipes, Pipe {
            x = VIRTUAL_WIDTH + 32,
            y = math.random(VIRTUAL_HEIGHT / 4 - GAP / 2, VIRTUAL_HEIGHT / 4 + GAP / 2)
        })
    end
    for k, pipe in pairs(self.pipes) do
        pipe:update(dt)
        if pipe.x < -pipe.width then
            pipe.removed = true
        end
        if pipe.scored == false and pipe.x + pipe.width / 2 <= self.bird.x then
            pipe.scored = true
            self.score = self.score + 1
            sounds['score']:play()
        end
        if pipe:collides(self.bird) then
            sounds['collision']:play()
            gStateMachine:change('gameover', {
                score = self.score
            })
        end
            
    end
    

    for k, pipe in pairs(self.pipes) do
        if pipe.removed == true then
            table.remove(self.pipes, k)
        end
    end
end

function PlayState:render()
    self.bird:render()
    for k, pipe in pairs(self.pipes) do
        pipe:render()
    end
    love.graphics.setFont(fonts['large'])
    love.graphics.print('Score: ' .. tostring(self.score), 8, 8)
end