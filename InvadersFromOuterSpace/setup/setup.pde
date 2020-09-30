float deltaTime, time, framerateMod = 30;
float expX, expY;

int numberOfBullets = 5, buttonX, buttonY, buttonSize = 100;

PFont myFont;

Player player;
Enemy enemy;
Enemies enemies;
Bullet[] bullets;
Explosion explosion;
StartMenu menu;

PVector collider = new PVector();

boolean startMenu = true, buttonOver = false, firstShot = false;

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
	game();

	}
}

void game()
{
//Calculate delta time
	long currentTime = millis();
	deltaTime = (currentTime - time) * 0.001f;

//Draw player
	player.draw();
	player.update();

//Draw enemy
  	enemy.draw();
  	//println(deltaTime);

  	enemy.movement();
  	//enemies.draw();

// Check if the bullets are empty, if not, then spawn bullet.
	for (int i = 0; i < bullets.length; i++) 
	{
		if (bullets [i] == null) {
			continue;
		}
		else 
		{

		bullets[i].update();
		bullets[i].draw(); 
		}
	}

	// Here we check for if there is a collision, and then we need to add a consequence. 
	//if (firstShot)
	//{
	for (int i = 0; i <= bullets.length; i++)
	{
		if (bullets [i] == null) 
		{
			continue;
		}
		else 
		{
			if (hitCollision (bullets[i].position.x, bullets[i].position.y, bullets[i].bulletSize, enemy.position.x, enemy.position.y, enemy.enemySize)) 
			{
				explosion.renderExp();
				println("colliding");
			}
		}
			
	}
	//}
}

