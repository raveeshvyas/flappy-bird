WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 512
VIRTUAL_HEIGHT = 288

BACKGROUND_SPEED = 30
GROUND_SPEED = 60

GRAVITY = 20
JUMP = -5

GAP = 100
PIPE_SPEED = 180

BACKGROUND_LOOPING = 413


fonts = {
    ['large'] = love.graphics.newFont('assets/fonts/font.ttf', 28),
    ['medium'] = love.graphics.newFont('assets/fonts/font.ttf', 14)

}

images = {
    ['background'] = love.graphics.newImage('assets/images/background.png'),
    ['bird'] = love.graphics.newImage('assets/images/bird1.png'),
    ['ground'] = love.graphics.newImage('assets/images/ground.png'),
    ['pipe'] = love.graphics.newImage('assets/images/pipe.png')
}

sounds = {
    ['collision'] = love.audio.newSource('assets/sounds/explosion.wav', 'static'),
    ['jump'] = love.audio.newSource('assets/sounds/jump.wav', 'static'),
    ['music'] = love.audio.newSource('assets/sounds/marios_way.mp3', 'static'),
    ['score'] = love.audio.newSource('assets/sounds/score.wav', 'static')
}