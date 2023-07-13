-- main.lua


-- Get dependencies
require 'source/Dependencies'

-- Call love.load()
function love.load()
    
    -- Get the 2-D look for the fonts
    love.graphics.setDefaultFilter('nearest','nearest')

    -- Set the random seed so the random function changes the math calls
    math.randomseed(os.time())

    -- Set title bar name
    love.window.setTitle('PONG')

    -- Setup the screen
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false, 
        vsync = true, 
        resizable = true
    })

    gStateMachine = StateMachine {
        ['menuStart'] = function() return MenuStartState() end,
        ['PlayState'] = function() return PlayState() end,
        ['GameEnd'] = function() return GameEnd() end
    }

    gStateMachine:change('menuStart')
    gSounds['play']:setLooping(true)
    gSounds['play']:setVolume(0.05)
    gSounds['play']:play()

    love.keyboard.keysPressed = {}

end

function love.keypressed(key)

    love.keyboard.keysPressed[key] = true

    if key == 'escape' then
        love.event.quit()
    end

end

function love.keyboard.wasPressed(key)
    return love.keyboard.keysPressed[key]

end

-- Call love.update()
function love.update(dt)

    gStateMachine:update(dt)

    love.keyboard.keysPressed = {}

end

function love.resize(w, h)

    push:resize(w, h)

end



function love.draw()

    push:start()
    gStateMachine:render()
    push:finish()

end