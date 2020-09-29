import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class setup extends PApplet {

float deltaTime, time, framerateMod = 30;

PFont myFont;

Player player;
Enemy enemy;

Bullet[] bullets; 
Bullet bullet;

public void setup() 
{
	
	rectMode(CENTER);

	//Text settings
	myFont = createFont("AldotheApache.ttf", 32);
	textFont(myFont);

	//Setting frame rate with a variable
	frameRate(framerateMod);

  	enemy = new Enemy();
  	player = new Player();

  	bullets = new Bullet[10];

  	player.position.x = width/2;
  	player.position.y = height * 0.8f;
}

public void draw() 
{
	background(0, 20, 39);

	// Draw enemy
  	enemy.draw ();

	game();

	player.draw();
	player.update();

	for (int i = 0; i < bullets.length; i++) {
		if (bullets [i] == null) {
			continue;
		}
		else {

		bullets[i].update(); 
		}
	}
}

public void game()
{
	//Calculate delta time
	long currentTime = millis();
	deltaTime = (currentTime - time) * 0.001f;

boolean hasCollided = hitCollision (bullet.position.x, bullet.position.y, bullet.bulletSize, enemy.position.x, enemy.position.y, enemy.enemySize);
	

	// Here we check for if there is a collision, and then we need to add a consequence. 
}
class Bullet
{
	PVector position, velocity; //Bullet position

	float bulletSizeX = 10, bulletSizeY = 15, bulletSize;
	int bulletColor;

	float bulletSpeed = 20;

	public Bullet()
	{
		position = new PVector();
		velocity = new PVector();

		bulletColor = color(0, 255, 0);

		// Starting position from player
		position.x = player.position.x;
		position.y = player.position.y;

		bulletSize = bulletSizeX * bulletSizeY;
	}


	public void update()
	{
		// Update bullet position
		position.y -= bulletSpeed;
	}

	public void draw()
	{
		//translate(position.x, position.y);
		fill(bulletColor);
		noStroke();
		rect(position.x, position.y, bulletSizeX, bulletSizeY);

		//update();

		//println("Shooting");
	}
}
class Enemy
{
	PVector position, velocity, startPos;
	float enemySize = 15;
	int playerColor = color (255, 205, 0);


	Enemy ()
	{
		position = new PVector ();
		velocity = new PVector();
		startPos = new PVector(width * 0.1f, height * 0.1f);
		
		position = startPos;
		
	}

	public void draw ()
	{
		fill (playerColor);
		stroke(255);

		pushMatrix();
	  	translate(position.x, position.y);
	  	rotate(frameCount / -100.0f);
	  	star(0, 0, 10, 30, 5); 
	  	popMatrix();

	}

	public void star(float x, float y, float radius1, float radius2, int npoints) 
	{
		float angle = TWO_PI / npoints;
	 	float halfAngle = angle/2.0f;
	  	beginShape();
	  	for (float a = 0; a < TWO_PI; a += angle) 
	  	{
	  		float sx = x + cos(a) * radius2;
	    	float sy = y + sin(a) * radius2;
	    	vertex(sx, sy);
	    	sx = x + cos(a+halfAngle) * radius1;
	    	sy = y + sin(a+halfAngle) * radius1;
	    	vertex(sx, sy);
	  	}
	  endShape(CLOSE);
	}


public void movement ()
{
	

}

}
class Player
{
	PVector position = new PVector(), velocity = new PVector(); // Only need velocity.x for now, so could actually simply be using and int/float
	float playerSize = 30;

	int playerColor = color(255);

	float playerSpeed = 10.0f;

	public Player ()
	{
		
	}

	public void update()
	{
		velocity = input();

		position.x += velocity.x * playerSpeed;

		// Boundaries
		if (position.x < 0 + playerSize/2)
		{
			position.x = 0 + playerSize/2;
		}
		else if (position.x > width - playerSize/2)
		{
			position.x = width - playerSize/2;
		}
	}

	public void draw()
	{
		//Draw player
		fill(playerColor);
		noStroke();
		rect(position.x, position.y, playerSize, playerSize);
	}

}
public boolean hitCollision (float bulletX, float bulletY, float bulletSize, float collX, float collY, float collSize)
{
	float maxDistance = bulletSize + collSize;

	if (abs(bulletX - collX) > maxDistance || abs(bulletY - collY) > maxDistance)
{
	return false;
}

else if (dist(bulletX, bulletY, collX, collY) > maxDistance)
{
	return false;
}
else  
{
	return true;
	}
}
boolean moveLeft = false, moveRight = false;

PVector inputVector = new PVector();



public void keyPressed()
{
   if (keyCode == LEFT || key == 'a')
   	moveLeft = true;

   else if (keyCode == RIGHT || key == 'd')
  	moveRight = true;
	
  if (key == ' ')
  {
  	bullet = new Bullet();
  	bullet.draw();
  }
  if (key == ESC)
  {
  	exit ();
  }
}

public void keyReleased ()
{
  if (keyCode == LEFT || key == 'a')
    moveLeft = false;
  else if (keyCode == RIGHT || key == 'd')
  	moveRight = false;
}

public PVector input()
{
  inputVector.x = 0;
  inputVector.y = 0;

  if (moveLeft) {
    inputVector.x -= 1;
  }

  if (moveRight) {
    inputVector.x += 1;
  }

  inputVector.normalize ();

  return inputVector;
}
  public void settings() { 	size(640, 480); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "setup" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
