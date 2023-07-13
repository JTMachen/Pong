-- GameEndState.lua


GameEnd = Class{__includes = BaseState}

-- Create an empty init function
function GameEnd:init()
    -- Nothing
end

function GameEnd:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gameState = 'start'
        gStateMachine:change('menuStart')
    end
end


function GameEnd:render()
    love.graphics.setFont(gFonts['large'])
    love.graphics.printf('Player ' .. tostring(winningPlayer) .. ' wins', 0, 50, VIRTUAL_WIDTH, 'center')
    love.graphics.setFont(gFonts['medium'])
    love.graphics.printf('Press Enter to restart', 0, VIRTUAL_HEIGHT - 50, VIRTUAL_WIDTH, 'center')
end


        