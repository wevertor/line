function worldLoad( ... )
	--[[
		love.graphics.newWorld(xg, yg, sleep);
		xg = componente x da gravidade
		xy = componente y da gravidade
		sleep = permissão para os corpos "dormirem"
	--]]
	love.physics.setMeter(64);							--define quanto é 1 metro no mundo
	world = love.physics.newWorld(0, 9.81*64, true);	--cria um mundo onde a componente horizontal de gravidade é 0 e a vertical é 9.81
	width, height = love.graphics.getDimensions();		--atribui a variáveis as dimensões de tela 
	wall = {};

	objects = {};
	objects[1] = {};
	objects[1].x = width/2; 															--componente x do objects[1]
	objects[1].y= height/2;																--componente y do objects[1]
	objects[1].body = love.physics.newBody(world, objects[1].x, objects[1].y, "dynamic"); 	--cria um corpo para o objects[1] usando seu x e y
	objects[1].shape = love.physics.newRectangleShape(0, 0, 30, 30);	--atribui uma forma ao objects[1]
	objects[1].fix = love.physics.newFixture(objects[1].body, objects[1].shape);			--liga a forma do objects[1] ao seu corpo

	wall[1] = {};
	wall[1].x = width/2;
	wall[1].y = height-10;
	wall[1].width = width;
	wall[1].height = 10;
	wall[1].body = love.physics.newBody(world, wall[1].x, wall[1].y, "static");
	wall[1].shape = love.physics.newRectangleShape(0, 0, wall[1].width, wall[1].height);
	wall[1].fix = love.physics.newFixture(wall[1].body, wall[1].shape);
	
	wall[2] = {};
	wall[2].x = 10;
	wall[2].y = height/2;
	wall[2].width = 10;
	wall[2].height = height;
	wall[2].body = love.physics.newBody(world, wall[2].x, wall[2].y, "static");
	wall[2].shape = love.physics.newRectangleShape(0, 0, wall[2].width, wall[2].height);
	wall[2].fix = love.physics.newFixture(wall[2].body, wall[2].shape);

	wall[3] = {};
	wall[3].x = width-10;
	wall[3].y = height/2;
	wall[3].width = 10;
	wall[3].height = height;
	wall[3].body = love.physics.newBody(world, wall[3].x, wall[3].y, "static");
	wall[3].shape = love.physics.newRectangleShape(0, 0, wall[3].width, wall[3].height);
	wall[3].fix = love.physics.newFixture(wall[3].body, wall[3].shape);
	
end

function worldUpdate( dt )
	world:update(dt);
end

function worldDraw( ... )
	--love.graphics.rectangle("fill", floor.body:getX(), floor.body:getY(), floor.width, floor.height);
	love.graphics.polygon("line", wall[1].body:getWorldPoints(wall[1].shape:getPoints()));
	love.graphics.polygon("line", wall[2].body:getWorldPoints(wall[2].shape:getPoints()));
	love.graphics.polygon("line", wall[3].body:getWorldPoints(wall[3].shape:getPoints()));
	love.graphics.polygon("line", wall[3].body:getWorldPoints(wall[3].shape:getPoints()));
	love.graphics.polygon("line", objects[1].body:getWorldPoints(objects[1].shape:getPoints()));
end




--[[
	-> É NECESSÁRIO CRIAR AS PAREDES LATERAIS DO MUNDO
	-> CRIAR OS BLOCOS NO CHÃO

]]