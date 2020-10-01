float deltaTime, time, framerateMod = 30;
float expX, expY;

int score, scoreUp = 10, highscore, numberOfBullets = 1, numberOfEnemies = 11/*, firstRowOfEnemies = 11, secondRowOfEnemies = 22, thirdRowOfEnemies = 33*/, buttonX, buttonY, buttonSize = 100;
int lives = 3;

PFont myFont;
PImage Galaxy;
PImage Player;

Player player;
Enemy[] enemies1;
Enemy[] enemies2;
Enemy[] enemies3;
Bullet[] bullets;
Explosion explosion;
StartMenu menu;
GameManager gameManager;
GameOver gameOverClass;

PVector collider = new PVector();

boolean startMenu = false, bulletDead = true;	//Don't forget to set startMenu back to true when development is over!
boolean gameOver = false, firstRowOfEnemies = true, secondRowOfEnemies = false, thirdRowOfEnemies = false;


void setup()
{
	Galaxy = loadImage ("Images/Galaxy.jpg");
	Player = loadImage ("Images/Alien.gif");
	Player.resize (30,25);
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
	else if (gameOver) {
		gameOverClass.gameover();
	}
	else 
	{
		gameManager.update();
	}
}