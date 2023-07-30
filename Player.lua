Player = Class{}

function Player:init(x, y)
	self.x = x
	self.y = y
	
	self.width = 50
	self.height = 4

	self.dx = 0
end

function Player:update(dt)
	self.x = math.max(0, math.min(self.x + self.dx * PADDLE_SPEED * dt, VIRTUAL_WIDTH - self.width))
end

function Player:render()
	love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end
