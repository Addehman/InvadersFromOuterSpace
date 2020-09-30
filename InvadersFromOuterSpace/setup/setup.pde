float deltaTime, time, framerateMod = 30;
float expX, expY;

int numberOfBullets = 100, buttonX, buttonY, buttonSize = 100;

PFont myFont;

Player player;
Enemy enemy;
Enemies enemies;
Bullet[] bullets;
Explosion explosion;
StartMenu menu;
GameManager gameManager;

PVector collider = new PVector();

boolean startMenu = false, buttonOver = false;	//Don't forget to set startMenu back to true when development is over!


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
  	bullets = new Bullet[numberOfBullets];
  	explosion = new Explosion(expX, expY);
  	//enemies = new Enemies();
  	menu = new StartMenu ();
  	gameManager = new GameManager();

  	player.position.x = width/2;
  	player.position.y = height * 0.8;

  	buttonX = width/2 - buttonSize-10;
  	buttonY = height/2 - buttonSize/2;
}


void draw() 
{
	background(0, 20, 39);
	if (startMenu) {
		menu.startmenu ();
	}
	else {
	gameManager.update();

	}
}



