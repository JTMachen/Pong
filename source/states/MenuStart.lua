-- MenuStartState.lua

MenuStartState = Class{__includes = BaseState}

-- Create an empty init function
function MenuStartState:init()
    -- Nothing
end

function MenuStartState:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('PlayState')
    end
end

function MenuStartState:render()
    love.graphics.setFont(gFonts['large'])
    love.graphics.setColor(255, 255, 255, 1)
    love.graphics.printf('Pong', 0, 24, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(gFonts['medium'])
    love.graphics.printf('Press Enter', 0, 100, VIRTUAL_WIDTH, 'center')
end