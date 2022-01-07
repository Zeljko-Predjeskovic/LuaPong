#!/user/bin/env lua

function love.load()
	love.window.setTitle("firstGame")
	love.window.setMode(550, 380, { resizable=false,
	vsync=false})
	font = love.graphics.newFont(30)

	player1 = {}
	player2 = {}
	ball = {}

	ball.x= 550/2
	ball.y= 380/2
	ball.radius = 10
	ball.direction = false
	ball.angle = 0

	player1.x = 0
	player1.y = 40
	player1.score=0
	
	player2.x = 540
	player2.y = 40
	player2.score=0

end

function love.update()
	-- Key inputs for the two rectangles
		if love.keyboard.isDown("w") then
			player1.y = player1.y-1
		end
		if love.keyboard.isDown("s") then
			player1.y = player1.y+1
		end
		if love.keyboard.isDown("i") then
			player2.y = player2.y-1
		end
		if love.keyboard.isDown("k") then
			player2.y = player2.y+1
		end
	
	-- Check if the ball hits player and set the direction and angle in which way it will go
		randomAngle = math.random()-0.75

		if (ball.y>=player1.y and ball.y<=player1.y+80)
			and ball.x<=10 then
			ball.direction = true
			ball.angle = (randomAngle*100 - (randomAngle*100)%1)/100
		elseif (ball.y >= player2.y and ball.y<=player2.y+80)
			and ball.x >= 540 then
			ball.direction = false
			ball.angle = (randomAngle*100 - (randomAngle*100)%1)/100
		end
	-- Check if it hits wall when no player reaches the ball and resets after a point is done		
		if ball.x<=0 then
			player2.score = player2.score+1
			ball.x = 550/2
			ball.y = 380/2
			ball.angle = 0
		elseif ball.x>=550 then
			player1.score = player1.score+1
			ball.x = 550/2
			ball.y = 380/2
			ball.angle=0
		end

	-- Detection for the walls for the ball to reflect on

		if ball.y <= 5 or ball.y >= 375 then
			ball.angle = ball.angle*-1
		end

	-- Ball movement
		
		speed = 0.75 
		if ball.direction then
			ball.x = ball.x+speed
		else ball.x = ball.x-speed
		end
		ball.y = ball.y + ball.angle
end

function love.draw()
	love.graphics.rectangle("fill",player1.x,player1.y,10,80)
	love.graphics.rectangle("fill",player2.x,player2.y,10,80)

	love.graphics.setFont(font)

	love.graphics.circle("fill",ball.x,ball.y,ball.radius)

	love.graphics.print(player1.score,550/4,0)
	love.graphics.print(player2.score,550-550/4, 0)

	-- Draws dotted lines
	love.graphics.line(550/2,0,550/2,380)
end

