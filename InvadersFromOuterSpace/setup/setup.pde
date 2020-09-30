float deltaTime, time, framerateMod = 30;
float expX, expY;

int numberOfBullets = 5;

PFont myFont;

Player player;
Enemy enemy;
Enemies enemies;
Bullet[] bullets; 
Bullet bullet;
Explosion explosion;
StartMenu menu;

PVector collider = new PVector();

boolean startMenu = true;

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
  	bullet = new Bullet();
  	explosion = new Explosion(expX, expY);
  	//enemies = new Enemies();
  	menu = new StartMenu ();

  	player.position.x = width/2;
  	player.position.y = height * 0.8;
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

// Here we check for if there is a collision, and then we need to add a consequence. 
	for (int i = 0; i <= numberOfBullets; i++)
	{
		boolean hasCollided = hitCollision (bullet.position.x, bullet.position.y, 
			bullet.bulletSize, enemy.position.x, enemy.position.y, enemy.enemySize);
		
		if (hasCollided) {
			explosion.renderExp();
			println("colliding");
		}
	}

//Draw player
	player.draw();
	player.update();

//Draw enemy
  	enemy.draw();
  	//println(deltaTime);

  	enemy.movement();
  	//enemies.draw();

// Check if the bullets are empty, if not, then spawn bullet.
	for (int i = 0; i < bullets.length; i++) {
		if (bullets [i] == null) {
			continue;
		}
		else {

		bullets[i].update();
		bullets[i].draw(); 
		}
	}
}

