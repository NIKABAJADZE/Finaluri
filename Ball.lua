Ball = Class{}

function Ball:init(x, y)
	self.x = x
	self.y = y
	
	self.width = 6
	self.height = 16
	
	self.dx = 0
	self.dy = 0
end

function Ball:update(dt)

	self.x = self.x + self.dx * dt
	self.y = self.y + self.dy * dt
	
	
end

function Ball:collides(target)
    if self.y + self.height < target.y or self.y > target.y + target.height then
        return false
    end

    if self.x + self.width < target.x or self.x > target.x + target.width then
        return false
    end

    return true
end

function Ball:reset()
	self.x = math.random(VIRTUAL_HEIGHT)
	self.y = 3
end

function Ball:render()
	love.graphics.circle('fill', self.x, self.y, self.width, self.height)
end
