float deltaTime, time, framerateMod = 30;
float expX, expY;

PFont myFont;

Player player;
Enemy enemy;

Bullet[] bullets; 
Bullet bullet;

Explosion explosion;

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
  	bullets = new Bullet[100];
  	explosion = new Explosion(expX, expY);

  	player.position.x = width/2;
  	player.position.y = height * 0.8;

}

void draw() 
{
	background(0, 20, 39);

	

	game();


}

void game()
{
//Calculate delta time
	long currentTime = millis();
	deltaTime = (currentTime - time) * 0.001f;

// Here we check for if there is a collision, and then we need to add a consequence. 
	//boolean hasCollided = hitCollision (bullet.position.x, bullet.position.y, bullet.bulletSize, enemy.position.x, enemy.position.y, enemy.enemySize);

//Draw player
	player.draw();
	player.update();

//Draw enemy
  	enemy.draw();
  	//println(deltaTime);
//Every 2 seconds: move enemy 
  	/*if ((int)deltaTime % 3 == 0)
  		{
  			enemy.movement();
  		}*/

  		enemy.movement();

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
<<<<<<< HEAD
=======

void game()
{
	//Calculate delta time
	long currentTime = millis();
	deltaTime = (currentTime - time) * 0.001f;

boolean hasCollided = hitCollision (bullet.position.x, bullet.position.y, bullet.bulletSize, enemy.position.x, enemy.position.y, enemy.enemySize);
	if (hasCollided) {
		explosion.renderExp();
	}
	// Here we check for if there is a collision, and then we need to add a consequence. 
}
>>>>>>> d3d10bebcbcb29f3c538340d415403cec17d6230
