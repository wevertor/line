require "player";
require "world";

function love.load( ... )
	worldLoad();
	playerLoad();
end

function love.update( dt )
	worldUpdate(dt);
	playerUpdate(dt);
end

function love.draw( ... )
	playerDraw();
	worldDraw();
end