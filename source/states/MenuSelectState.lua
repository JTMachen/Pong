-- MenuSelectState.lua

MenuSelectState = Class{__includes = BaseState}

local highlighted = 1


function MenuSelectState:update(dt)

    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    elseif love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine.change('PlayState')
    end

    if love.keyboard.wasPressed('up') or love.keyboard.wasPressed('down') then
        highlighted = highlighted == 1 and 2 or 1
        gSounds['confirm']:play()
    end

end

function MenuSelectState:render()

    -- Set the title
    love.graphics.setFont(gFonts['large'])
    love.graphics.printf('SET NUMBER', 0, 10, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(gFonts['medium'])

    -- if we're highlighting 1, render that option blue
    if highlighted == 1 then
        love.graphics.setColor(103/255, 1, 1, 1)
    end
    love.graphics.printf("1", 0, 50,
        VIRTUAL_WIDTH, 'center')

    -- reset the color
    love.graphics.setColor(255, 255, 255, 1)

    -- render option 2 blue if we're highlighting that one
    if highlighted == 2 then
        love.graphics.setColor(103/255, 1, 1, 1)
    end
    love.graphics.printf("3", 0, 90,
        VIRTUAL_WIDTH, 'center')

    if highlighted == 2 then
        love.graphics.setColor(103/255, 1, 1, 1)
    end
    love.graphics.printf("5", 0, 130,
        VIRTUAL_WIDTH, 'center')

    -- reset the color
    love.graphics.setColor(255, 255, 255, 1)
end