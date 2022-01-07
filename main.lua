#!/user/bin/env lua

function love.load()
	love.window.setTitle("firstGame")
	love.window.setMode(450, 380, { resizable=false,
	vsync=false})
	font = love.graphics.newFont(30)

	player1 = {}
	player2 = {}
	ball = {}

	ball.x= 450/2
	ball.y= 380/2
	ball.radius = 10

	player1.x = 0
	player1.y = 40
	player1.score=0
	
	player2.x = 430
	player2.y = 40
	player2.score=0

end

function love.update()
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
end

function love.draw()
	love.graphics.rectangle("fill",player1.x,player1.y,20,60)
	love.graphics.rectangle("fill",player2.x,player2.y,20,60)

	love.graphics.setFont(font)

	love.graphics.circle("fill",ball.x,ball.y,ball.radius)

	love.graphics.print(player1.score,player1.x,0)
	love.graphics.print(player2.score,player2.x,0)
end

