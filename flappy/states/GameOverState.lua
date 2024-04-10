GameOverState = Class{}

function GameOverState:init(params)
    self.score = params.score
end



function GameOverState:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('start')
    end
end

function GameOverState:render()
    love.graphics.setFont(fonts['large'])
    love.graphics.printf('You died!', 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(fonts['medium'])
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')

    love.graphics.printf('Press Enter to Play Again!', 0, 160, VIRTUAL_WIDTH, 'center')
end