float deltaTime, time, framerateMod = 30;
Enemy enemy;

void setup() 
{
	size(640, 480);
	rectMode(CENTER);

	frameRate(framerateMod);
  enemy = new Enemy ();
}

void draw() 
{
	background(0, 20, 39);
  enemy.draw ();

	game();
}

void game()
{
	//Calculate delta time
	long currentTime = millis();
	deltaTime = (currentTime - time) * 0.001f;
}
