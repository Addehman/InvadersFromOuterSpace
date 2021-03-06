float deltaTime, time, framerateMod = 30, expX, expY;

int score, scoreUp = 10, highscore, numberOfBullets = 1, 
numberOfEnemyBullets = 11, numberOfEnemies = 33, buttonX, 
buttonY, buttonSize = 100, lives = 3, randomEnemyFire, row;

PFont myFont;
PImage Galaxy;
PImage Player, LivesIcon;

Player player;
Enemy[] enemies;
Bullet[] bullets;
Bullet[] enemyBullets;
Explosion explosion;
StartMenu menu;
GameManager gameManager;
GameOver gameOverClass;
CollisionManager collisionManager;

PVector collider = new PVector();

boolean startMenu = true, bulletDead = true, 
enemyBulletDead = true, gameOver = false;


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

  	enemies = new Enemy[numberOfEnemies];
  	player = new Player();
  	bullets = new Bullet[numberOfBullets];
  	enemyBullets = new Bullet[numberOfEnemyBullets];
  	explosion = new Explosion(expX, expY);
  	menu = new StartMenu();
  	gameManager = new GameManager();
  	gameOverClass = new GameOver ();
  	collisionManager = new CollisionManager();


	gameManager.start();
}


void draw() 
{
	background(Galaxy);

	if (startMenu) {
		menu.startmenu ();
	}
	else if (gameOver) {
		gameOverClass.gameover();
	}
	else {
		gameManager.update();
	}
}