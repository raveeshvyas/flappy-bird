require 'src/imports'



function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')
    math.randomseed(os.time())

    love.window.setTitle('Flappy Bird')
    
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false
    })

    backgroundX = 0
    groundX = 0

    print(images['ground']:getDimensions())


    gStateMachine = StateMachine ({
        ['start'] = function (params) return StartState(params) end,
        ['play'] = function (params) return PlayState(params) end,
        ['gameover'] = function (params) return GameOverState(params) end
    }, 'start')

    sounds['music']:setLooping(true)
    sounds['music']:play()    

    love.keyboard.keysPressed = {}
end


function love.update(dt)
    backgroundX = (backgroundX + BACKGROUND_SPEED * dt) % BACKGROUND_LOOPING
    groundX = (groundX + GROUND_SPEED * dt) % VIRTUAL_WIDTH
    gStateMachine:update(dt)
    love.keyboard.keysPressed = {}
    

end

function love.keypressed(key)
    love.keyboard.keysPressed[key] = true
    if (key == 'escape') then
    love.event.quit()
    end
end

function love.keyboard.wasPressed(key)
    return love.keyboard.keysPressed[key]
end


function love.draw()
    push:start()
    love.graphics.draw(images['background'], -backgroundX, 0)
    gStateMachine:render()
    love.graphics.draw(images['ground'], -groundX, VIRTUAL_HEIGHT - 16)
    push:finish()
end
