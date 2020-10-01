float deltaTime, time, framerateMod = 30;
float expX, expY;

int score, scoreUp = 10, highscore, numberOfBullets = 1, numberOfEnemies = 33, firstRowOfEnemies = 11, secondRowOfEnemies = 22, thirdRowOfEnemies = 33, buttonX, buttonY, buttonSize = 100;
int lives = 3;

PFont myFont;

Player player;
Enemy[] enemies;
Bullet[] bullets;
Explosion explosion;
StartMenu menu;
GameManager gameManager;
GameOver gameOverClass;

PVector collider = new PVector();

boolean startMenu = false, bulletDead = true;	//Don't forget to set startMenu back to true when development is over!
boolean gameOver = false;

void setup() 
{
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
  	explosion = new Explosion(expX, expY);
  	menu = new StartMenu();
  	gameManager = new GameManager();
  	gameOverClass = new GameOver ();

<<<<<<< Updated upstream
gameManager.start();

=======
//Create our enemies
  	for (int i = 0; i < numberOfEnemies; i++)
  	{
  		

  		if (i <= firstRowOfEnemies)
  		{
  			enemies[i] = new Enemies();
  			enemies[i].position.x += 50 * i;
  		}
  		else if (i > firstRowOfEnemies && i <= secondRowOfEnemies)
  		{
  			for (int j = 0; j < firstRowOfEnemies; j++)
  			{
  				enemies[i] = new Enemies();
  				enemies[i].position = enemies[i].startPos;
  			  	enemies[i].position.y = height * 0.2; 

  			  	enemies[i].position.x += 50 * j;
  			}
  		}
  	}

  	// for (int i = 0; i < numberOfEnemies; i++)
  	// {
  	// 	enemies[i] = new Enemies();
  	// 	enemies[i].position.y += 50;
  	// 	enemies[i].position.x += 50 * i;
  	// }

  	player.position.x = width/2;
  	player.position.y = height * 0.8;

  	buttonX = width/2 - buttonSize-10;
  	buttonY = height/2 - buttonSize/2;
>>>>>>> Stashed changes
}


void draw() 
{
	background(0, 20, 39);

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



