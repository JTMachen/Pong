-- PlayState.lua

-- Need to include some powerups (speedup, increase paddlesize, etc 
-- so that when the ball 'collides' with the powerup it impacts the rendering of the game)

PlayState = Class{__includes = BaseState}

local player1Score = 0
local player2Score = 0

local servingPlayer = 1


-- Create an empty init function
function PlayState:init()
    self.player1 = Paddle(10, 30, 5, 20)
    self.player2 = Paddle(VIRTUAL_WIDTH - 10, VIRTUAL_HEIGHT - 30, 5, 20)
    self.ball = Ball(VIRTUAL_WIDTH / 2 - 2, VIRTUAL_HEIGHT / 2 - 2, 4, 4)
end

function PlayState:update(dt)
    -- Check for keyboard inputs
    if love.keyboard.isDown('w') then
        self.player1.dy = -PADDLE_SPEED
    elseif love.keyboard.isDown('s') then
        self.player1.dy = PADDLE_SPEED
    else
        self.player1.dy = 0
    end

    if love.keyboard.isDown('up') then
        self.player2.dy = -PADDLE_SPEED
    elseif love.keyboard.isDown('down') then
        self.player2.dy = PADDLE_SPEED
    else
        self.player2.dy = 0
    end

    self.player1:update(dt)
    self.player2:update(dt)

    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        if gameState == 'serve' then
            gameState = 'play'
        end
    end

    if gameState == 'play' then
        self.ball:update(dt)
    
        if self.ball:collides(self.player1) then
            gSounds['paddleHit']:setVolume(0.08)
            gSounds['paddleHit']:play()
            self.ball.dx = -self.ball.dx * 1.03
            self.ball.x = self.player1.x + 5


            if self.ball.dy < 0 then
                self.ball.dy = -math.random(10, 150)
            else
                self.ball.dy = math.random(10, 150)
            end
        end

        if self.ball:collides(self.player2) then
            gSounds['paddleHit']:setVolume(0.08)
            gSounds['paddleHit']:play()
            self.ball.dx = -self.ball.dx * 1.03
            self.ball.x = self.player2.x - 5

            if self.ball.dy < 0 then
                self.ball.dy = -math.random(10, 150)
            else
                self.ball.dy = math.random(10, 150)
            end
        end

        if self.ball.x < 0 then
            gSounds['score']:setVolume(0.08)
            gSounds['score']:play()
            servingPlayer = 1
            player2Score = player2Score + 1
            self.ball:reset()
            gameState = 'serve'
        elseif self.ball.x > VIRTUAL_WIDTH then
            gSounds['score']:setVolume(0.08)
            gSounds['score']:play()
            servingPlayer = 2
            player1Score = player1Score + 1
            self.ball:reset()
            gameState = 'serve'
        end

        if self.ball.y < 0 or self.ball.y > VIRTUAL_HEIGHT - 4 then
            self.ball.dy = -self.ball.dy
        end

        if player1Score == 11 or player2Score == 11 then
            if player1Score > player2Score then
                winningPlayer = 1
            else
                winningPlayer = 2
            end
            gameState = 'stop'
            player1Score = 0
            player2Score = 0
        end

    elseif gameState == 'serve' then
        self.ball.dy = math.random(-50, 50)
        if servingPlayer == 1 then
            self.ball.dx = math.random(140, 200)
        else
            self.ball.dx = -math.random(140, 200)
        end
    elseif gameState == 'start' then
        servingPlayer = 1
        gameState = 'serve'
    end
end

function PlayState:render()
    

    if gameState == 'stop' then
        gStateMachine:change('GameEnd')
    
    elseif gameState == 'serve' or gameState == 'play' then
        love.graphics.setFont(gFonts['large'])
        love.graphics.printf(tostring(player1Score), VIRTUAL_WIDTH / 4, 10, 100)
        love.graphics.printf(tostring(player2Score), VIRTUAL_WIDTH * (3 / 4) - 2, 10, 100)
        love.graphics.setFont(gFonts['medium'])
        love.graphics.printf('Press Enter to serve', 0, 20, VIRTUAL_WIDTH, 'center')
    end
    self.player1:render()
    self.player2:render()
    self.ball:render()
end