Class = require 'class'
push = require 'push'

require 'Player'
require 'Ball'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

PADDLE_SPEED = 400

gameState = 'start'

function love.load()
	
	love.window.setTitle('Catch the Ball')
	
	love.graphics.setDefaultFilter('nearest', 'nearest')
	
	smallFont = love.graphics.newFont('font.ttf', 10)
	scoreFont = love.graphics.newFont('font.ttf', 16)
	
	love.graphics.setFont(smallFont)
	
	math.randomseed(os.time())
	

	push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
		fullscreen = false,
		resizable = false,
		vsync = true
	})
	
	player1 = Player(200,230)
	
	ball = Ball(200, 10)
end

function love.keypressed(key)
	if key == 'escape' then
		love.event.quit()
	end

	
    if gameState == 'start' then
		if key == 'return' then
			gameState = 'serve'
		end
	elseif gameState == 'serve' then
		if key == 'return' then
			gameState = 'play'
		end
	elseif gameState == 'won' then
		if key == 'return' then
			gameState = 'play'
		end	
	elseif gameState == 'win' then
		if key == 'return' then
			gameState = 'play'
		end
	elseif gameState == 'lose' then 
		if key == 'return' then 
			gameState = 'won'
		end
	end
end

function love.update(dt)	

	if gameState == 'serve' then
		ball.dx = math.random(VIRTUAL_WIDTH)
		
		
		
		ball.dy = 400
		
		
	elseif gameState == 'play' then

		if ball:collides(player1) then
			gameState = "win"
			ball:reset()
		end
		
	
		
		
		if ball.y > VIRTUAL_HEIGHT then
			gameState = 'lose'
			ball:reset()
		elseif ball.x < 0 then
			
			gameState = 'won'
			ball:reset()
			ball = 0
			
		end
	
		ball:update(dt)
	end

	
	


	if love.keyboard.isDown('d') then
		player1.dx = 1
	elseif love.keyboard.isDown('a') then
		player1.dx = -1
	else
		player1.dx = 0
	end
	
	
	

	player1:update(dt)
	
end

function love.draw()
	push:start()
	
	player1:render()
	
	ball:render()

	if gameState == 'start' then
		love.graphics.setFont(smallFont)
		love.graphics.printf(
			'Welcome',
			0, 100,
			VIRTUAL_WIDTH,
			'center')
			
	elseif gameState == 'serve' then
		love.graphics.setFont(smallFont)
		love.graphics.printf(
			'Press Enter to play',
			0,
			100,
			VIRTUAL_WIDTH,
			'center')
	
	elseif gameState == 'win' then
		love.graphics.setFont(smallFont)
		love.graphics.printf(
			'You won',
			0,
			100,
			VIRTUAL_WIDTH,
			'center')
	elseif gameState == 'lose' then
		love.graphics.setFont(smallFont)
		love.graphics.printf(
			'You lose',
			0,
			100,
			VIRTUAL_WIDTH,
		   'center')
	elseif gameState == 'won' then
		love.graphics.setFont(smallFont)
		love.graphics.printf(
			'Press Enter ro play again',
			0,
			100,
			VIRTUAL_WIDTH,
			'center')	   	   
	end
	
	push:finish()
end

function displayScore()
	love.graphics.setFont(scoreFont)
end
