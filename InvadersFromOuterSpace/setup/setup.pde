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

  	enemy = new Enemy();
  	player = new Player();

  	player.position.x = width/2;
  	player.position.y = height * 0.8;
}

void draw() 
{
	background(0, 20, 39);

	// Draw enemy
  	enemy.draw ();

	//game();

	player.draw();
	player.update();
}

/*void game()
{
	//Calculate delta time
	long currentTime = millis();
	deltaTime = (currentTime - time) * 0.001f;

	
}*/
