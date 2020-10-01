float deltaTime, time, framerateMod = 30;
float expX, expY;

int score, scoreUp = 10, highscore, numberOfBullets = 1, numberOfEnemyBullets = 11, numberOfEnemies = 11, buttonX, buttonY, buttonSize = 100,
lives = 3, randomEnemyFire1, randomEnemyFire2, randomEnemyFire3;

PFont myFont;
PImage Galaxy;
PImage Player, LivesIcon;

Player player;
Enemy[] enemies1;
Enemy[] enemies2;
Enemy[] enemies3;
Bullet[] bullets;
Bullet[] enemyBullets;
Explosion explosion;
StartMenu menu;
GameManager gameManager;
GameOver gameOverClass;

PVector collider = new PVector();

boolean startMenu = true, bulletDead = true, enemyBulletDead = true;	//Don't forget to set startMenu back to true when development is over!
boolean gameOver = false;


void setup()
{
	Galaxy = loadImage ("Images/Galaxy.jpg");
	Player = loadImage ("Images/Alien.gif");
	LivesIcon = loadImage ("Images/LivesIcon.png");
	Player.resize (30,25);
	LivesIcon.resize (20, 15);
	imageMode (CENTER);
	size(640, 480);
	rectMode(CENTER);

//Text settings
	myFont = createFont("AldotheApache.ttf", 32);
	textFont(myFont);

//Setting frame rate with a variable
	frameRate(framerateMod);

  	enemies1 = new Enemy[numberOfEnemies];
  	enemies2 = new Enemy[numberOfEnemies];
  	enemies3 = new Enemy[numberOfEnemies];
  	player = new Player();
  	bullets = new Bullet[numberOfBullets];
  	enemyBullets = new Bullet[numberOfEnemyBullets];
  	explosion = new Explosion(expX, expY);
  	menu = new StartMenu();
  	gameManager = new GameManager();
  	gameOverClass = new GameOver ();


	gameManager.start();

}

void draw() 
{
	background(Galaxy);

	if (startMenu) 
	{
		menu.startmenu ();
	}
	else if (gameOver) 
	{
		gameOverClass.gameover();
	}
	else 
	{
		gameManager.update();
	}
}