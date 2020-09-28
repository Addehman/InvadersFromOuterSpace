float deltaTime, time, framerateMod = 30;

PFont myFont;

Player player;

Enemy enemy;


void setup() 
{
	size(640, 480);
	rectMode(CENTER);

	//Text settings
	myFont = createFont("AldotheApache.ttf", 32);
	textFont(myFont);

	//Setting frame rate with a variable
	frameRate(framerateMod);
  enemy = new Enemy ();
}

void draw() 
{
	background(0, 20, 39);
  enemy.draw ();

	game();

	player.draw();
}

void game()
{
	//Calculate delta time
	long currentTime = millis();
	deltaTime = (currentTime - time) * 0.001f;

	
}
