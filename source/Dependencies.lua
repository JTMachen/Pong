-- Dependencies.lua

-- Call in the required files

Class = require 'lib/class'
push = require 'lib/push'

-- Call in required sprite files
require 'source/Paddle'
require 'source/Ball'

-- Call in the global contants
require 'source/constants'

-- Call in the required states
require 'source/StateMachine'
require 'source/states/BaseState'
require 'source/states/GameEndState'
require 'source/states/MenuSelectState'
require 'source/states/MenuStart'
require 'source/states/PauseState'
require 'source/states/PlayState'
require 'source/states/Rules'

gSounds = {
    ['wallHit'] = love.audio.newSource('sounds/wall_hit.wav', 'static'),
    ['score'] = love.audio.newSource('sounds/score.wav', 'static'),
    ['paddleHit'] = love.audio.newSource('sounds/paddle_hit.wav', 'static'),
    ['victory'] = love.audio.newSource('sounds/victory.mp3', 'static'),
    ['gameOver'] = love.audio.newSource('sounds/gameOver.mp3', 'static'),
    ['play'] = love.audio.newSource('sounds/play.mp3', 'static'),
    ['pause'] = love.audio.newSource('sounds/pause.wav', 'static'),
    ['confirm'] = love.audio.newSource('sounds/confirm.wav', 'static'),
    ['choiceMove'] = love.audio.newSource('sounds/pickup.wav', 'static')
}

gFonts = {
    ['small'] = love.graphics.newFont('fonts/pong_font.ttf', 8),
    ['medium'] = love.graphics.newFont('fonts/pong_font.ttf', 16),
    ['large'] = love.graphics.newFont('fonts/pong_font.ttf', 32)
}

