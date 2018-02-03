require "world";
function playerLoad( ... )
	player = {};
	player.x = 100; 															--componente x do player
	player.y= 200;																--componente y do player
	player.body = love.physics.newBody(world, player.x, player.y, "dynamic"); 	--cria um corpo para o player usando seu x e y
	player.body:setMass(6000);													--atribui ao player uma massa
	player.shape = love.physics.newCircleShape(5);								--atribui uma forma ao player
	player.fix = love.physics.newFixture(player.body, player.shape);			--liga a forma do player ao seu corpo
	player.fix:setRestitution(1);											--faz o player quicar
end

function playerUpdate(dt)
	if love.keyboard.isDown("down", "s") then
		--player.body:applyForce(0, -4000);
	elseif love.keyboard.isDown("up", "w") then
		--player.body:getY() = player.body:getY() - 300 *dt;
	elseif love.keyboard.isDown("left", "a") then
		player.body:applyForce(-50, 0);
	elseif love.keyboard.isDown("right", "d") then
		player.body:applyForce(50, 0);
	end
end

function playerDraw( ... )
	love.graphics.circle("line", player.body:getX(), player.body:getY(), player.shape:getRadius());
end