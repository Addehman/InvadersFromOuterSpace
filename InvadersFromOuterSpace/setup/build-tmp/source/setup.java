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
float expX, expY;

PFont myFont;

Player player;
Enemy enemy;
Enemies enemies;
Bullet[] bullets; 
Bullet bullet;
Explosion explosion;
StartMenu menu;

boolean startMenu = true;

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
  	bullets = new Bullet[100];
  	explosion = new Explosion(expX, expY);
  	//enemies = new Enemies();
  	menu = new StartMenu ();

  	player.position.x = width/2;
  	player.position.y = height * 0.8f;

}


public void draw() 
{
	background(0, 20, 39);
	if (startMenu) {
		menu.startmenu ();
	}
	else {
	game();

	}
}

public void game()
{
//Calculate delta time
	long currentTime = millis();
	deltaTime = (currentTime - time) * 0.001f;

// Here we check for if there is a collision, and then we need to add a consequence. 
	/*boolean hasCollided = hitCollision (bullet.position.x, bullet.position.y, bullet.bulletSize, enemy.position.x, enemy.position.y, enemy.enemySize);
	if (hasCollided) {
		explosion.renderExp();
	}*/

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

class Bullet
{
	PVector position, velocity; //Bullet position

	float bulletSizeX = 10, bulletSizeY = 15, bulletSize;
	float bulletSpeed = 20;

	int bulletColor;

	Bullet[] bullets;


	public Bullet()
	{
		position = new PVector();
		velocity = new PVector();

		bulletColor = color(0, 255, 0);

// Starting position from player
		position.x = player.position.x;
		position.y = player.position.y;
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

// Check for if outside of window, if yes, then nullify
		/*if (position.x < 0 - bulletSize || position.x > width + bulletSize 
			|| position.y < 0 - bulletSize || position.y > height + bulletSize)
		{

			this.bullet = null;
		}*/
// This "if" below is temporary and shall be replaced by the one above, but is testing if the "null" works.
		if (position.y < bulletSizeY*2)
		{
			position.y = bulletSizeY*2;
			//this = null;
		}
	}
}
class Enemy
{
	PVector position, velocity, startPos;
	
	float rightSteps = 30, downSteps = 10, leftSteps = 30, 
	stepDistance = 0.5f, currentSteps = 0, enemySize = 15;
	
	int playerColor = color (255, 205, 0);

	boolean right = true, down1 = false, left = false, down2 = false;


	Enemy ()
	{
		position = new PVector();
		velocity = new PVector();
		startPos = new PVector(width * 0.1f, height * 0.1f);
		
		position = startPos;
		
	}

	public void draw ()
	{
		fill (playerColor);
		stroke(255);

		push();
	  	translate(position.x, position.y);
	  	//rotate(frameCount / -100.0);
	  	star(0, 0, 10, 30, 5); 
	  	pop();
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
	{// not sure if I should be using deltaTime here, but I want the for-loops to tick by deltaTime instead of frames.

// Make the enemy first take some steps to the right, then some fewer down, then some steps right and loop this

		if (right)
		{
			
			position.x += stepDistance;
			currentSteps += stepDistance;
			println("right " + currentSteps);
				
			if (currentSteps >= rightSteps)
			{
				right = false;
				down1 = true;
				currentSteps = 0;
			}
		}
		else if (down1)
		{
			
			position.y += stepDistance;
			currentSteps += stepDistance;
			println("down1 " + currentSteps);

			if (currentSteps >= downSteps)
			{
				down1 = false;
				left = true;
				currentSteps = 0;
			}
		}
		else if (left)
		{
			position.x -= stepDistance;
			currentSteps += stepDistance;
			println("left " + currentSteps);
			
				
			if (currentSteps >= leftSteps)
			{
				left = false;
				down2 = true;
				currentSteps = 0;
			}
		}
		else if (down2)
		{
			position.y += stepDistance;
			currentSteps += stepDistance;
			println("down2 " + currentSteps);
			
			if (currentSteps >= downSteps)
			{
				down2 = false;
				right = true;
				currentSteps = 0;
			}
		}
	}
}
class Explosion {
  float expX;
  float expY;
  int counter = 0;
  PImage Image1, Image2, Image3,Image4,Image5,Image6,Image7,Image8,Image9;
  
Explosion(float expX, float expY) {
  this.expX = expX;
  this.expY = expY; 
  
  Image1 = loadImage("Images/Image1.png");
  Image1.resize(70,70);
  Image2 = loadImage("Images/Image2.png");
  Image2.resize(70,70);
  Image3 = loadImage("Images/Image3.png");
  Image3.resize(70,70);
  Image4 = loadImage("Images/Image4.png");
  Image4.resize(70,70);
  Image5 = loadImage("Images/Image5.png");
  Image5.resize(70,70);
  Image6 = loadImage("Images/Image6.png");
  Image6.resize(70,70); 
  Image7 = loadImage("Images/Image7.png");
  Image7.resize(70,70); 
  Image8 = loadImage("Images/Image8.png");
  Image8.resize(70,70); 
  Image9 = loadImage("Images/Image9.png");
  Image9.resize(70,70); 

}

  public void renderExp(){
    if(counter >=0 && counter <=5){
    image(Image1,expX,expY);
    }
    if(counter > 5 && counter <=10){
    image(Image2,expX,expY);
    }
    if(counter > 10 && counter <=15){
    image(Image3,expX,expY);
    }
    if(counter > 15 && counter <=20){
    image(Image4,expX,expY);
    }
    if(counter > 20 && counter <=25){
    image(Image5,expX,expY);
    }
    if(counter > 25 && counter <=30){
    image(Image6,expX,expY);
    }
    if(counter > 30 && counter <=35){
    image(Image7,expX,expY);
    }
    if(counter > 35 && counter <=40){
    image(Image8,expX,expY);
    }
    if(counter > 40 && counter <=45){
    image(Image9,expX,expY);
    }

    counter++;
  }
}
class Player
{
	PVector position = new PVector(), velocity = new PVector(); // Only need velocity.x for now, so could actually simply be using and int/float
	
	float playerSize = 30, playerSpeed = 10.0f;

	int playerColor = color(255);


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
  class StartMenu {

    //boolean startGame = false;
    public void startmenu() {
  
      pushStyle();
      fill(0);
      noStroke();
      rectMode(CENTER);
      rect(width>>1, height>>1, 350, 150, 10, 10, 10, 10);
      textAlign(CENTER);
      fill(255);
      textSize(20);
      text(" Invaders from Outer Space ", width>>1, height/2-40);
      textSize(15);
      fill(0xffFF002F);
      rect(width>>1, height>>1, 100, 30, 10, 10, 10, 10);
      fill(255);
      text("START", width>>1, height/2+4);
      fill(255);
      textSize(10);
      text("Created by Adam & Emilie ", width>>1, height/2+40);
      popStyle();
      if (mousePressed && dist(mouseX, mouseY, width/2, height/2)<50) {
  
        startMenu = false;
      }
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
class Enemies extends Enemy
{
	Enemies()
	{
		super();
	}

	// draw()
	// {
	// 	push();
	// 	translate(position.x + enemySize * 2, position.y);
	// 	star(0, 0, 10, 30, 5);
	// 	pop();
	// }
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
  	//Find empty spot in array, create list
  	
  	for (int i = 0; i < bullets.length; i++)
  	{
  		if (bullets[i] == null)
  		{
  			bullets[i] = new Bullet();
  			bullets[i].position = player.position.copy();
  			//we are done, break/quit the loop.
  			break;
  		}
  	}
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
