-- Paddle.lua

Paddle = Class{}

function Paddle:init(x, y, width, height)
    -- Initialize the various aspects of the paddles
    self.x = x
    self.y = y
    self.width = width
    self.height = height

    -- Set initial vertical velocity to 0
    self.dy = 0
end

function Paddle:update(dt)
    -- Make it so the paddles cannot go above or below the window
    if self.dy < 0 then
        self.y = math.max(0, self.y + self.dy * dt)
    else
        self.y = math.min(VIRTUAL_HEIGHT - self.height, self.y + self.dy * dt)
    end
end

function Paddle:render()
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end