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

int score, scoreUp = 10, highscore, numberOfBullets = 1, numberOfEnemies = 5, buttonX, buttonY, buttonSize = 100;
int lives = 3;

PFont myFont;

Player player;
Enemy[] enemies;
Bullet[] bullets;
Explosion explosion;
StartMenu menu;
GameManager gameManager;

PVector collider = new PVector();

boolean startMenu = false, buttonOver = false, bulletDead = true;	//Don't forget to set startMenu back to true when development is over!


public void setup() 
{
	
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

//Create our enemies
  	for (int i = 0; i < numberOfEnemies; i++)
  	{
  		enemies[i] = new Enemies();
  		//enemies[i].startPos.x += 50;
  	}

  	player.position.x = width/2;
  	player.position.y = height * 0.8f;

  	buttonX = width/2 - buttonSize-10;
  	buttonY = height/2 - buttonSize/2;
}


public void draw() 
{
	background(0, 20, 39);

	if (startMenu) 
	{
		menu.startmenu ();
	}
	else 
	{
		gameManager.update();
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
		
	}
}
class Enemy
{
	PVector position, velocity, startPos;
	
	float rightSteps = 30, downSteps = 10, leftSteps = 30, 
	stepDistance = 0.5f, currentSteps = 0, enemySize1 = 7, enemySize2 = 15;
	
	int enemyColor = color (255, 205, 0);

	boolean right = true, down1 = false, left = false, down2 = false;


	Enemy ()
	{
		position = new PVector();
		velocity = new PVector();
		startPos = new PVector(width * 0.1f, height * 0.1f );
		
		position = startPos;

		//position.x = position.x + enemySize2 * 3 * numberOfEnemies;
		
	}

	public void draw ()
	{
		fill (enemyColor);
		stroke(255);

		push();
	  	translate(position.x, position.y);
	  	//rotate(frameCount / -100.0);
	  	star(0, 0, enemySize1, enemySize2, 5); 
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
			//println("right " + currentSteps);
				
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
			//println("down1 " + currentSteps);

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
			//println("left " + currentSteps);
			
				
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
			//println("down2 " + currentSteps);
			
			if (currentSteps >= downSteps)
			{
				down2 = false;
				right = true;
				currentSteps = 0;
			}
		}
	}
}
class Explosion 
{
  float expX;
  float expY;
  int counter = 0;
  PImage Image1, Image2, Image3,Image4,Image5,Image6,Image7,Image8,Image9;

  
  Explosion(float expX, float expY) 
  {
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

  public void renderExp(float x, float y)
  {
// setting the explosion's position, which are used to define it to be the same as the enemy's position.
    this.expX = x;
    this.expY = y;
    imageMode(CENTER);

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
class GameManager
{

	GameManager()
	{

	}

	public void update()
	{
//Calculate delta time
		long currentTime = millis();
		deltaTime = (currentTime - time) * 0.001f;

//Draw player
		player.draw();
		player.update();

//Draw enemy
	  	for(int i = 0; i < numberOfEnemies; i++)
	  	{
		  	//enemy.draw();
		  	println("drawing enemy");
		  	enemies[i].draw();
		  	//println(deltaTime);

		  	//enemy.movement();
		  	enemies[i].movement();

		  	//enemies.draw();
	  	}

	  	


// Check if the bullets are empty, if not, then spawn bullet.
		for (int i = 0; i < bullets.length; i++) 
		{
			if (bullets [i] == null) 
			{
				continue;
			}
			else 
			{
				if (hitCollision (bullets[i].position.x, bullets[i].position.y, bullets[i].bulletSize, enemies[i].position.x, enemies[i].position.y, enemies[i].enemySize2)) 
				{
					explosion.renderExp(enemies[i].position.x, enemies[i].position.y);

					score += scoreUp; // Add score for killing enemy
					//println("colliding");
					enemies[i].enemySize1 = 0;
					enemies[i].enemySize2 = 0;

					bullets[i].bulletSizeX = 0;
					bullets[i].bulletSizeY = 0;

					bulletDead = true; //setting the bullet to dead, so that a new shot can be fired again.
				}
				else if (bullets[i].position.y < bullets[i].bulletSizeY*2)
				{
					bullets[i].position.y = bullets[i].bulletSizeY*2;
					bullets[i].bulletSizeX = 0;
					bullets[i].bulletSizeY = 0;

					bulletDead = true; //setting the bullet to dead, so that a new shot can be fired again.
					//this = null;
				}
				// else if (hitCollision(bullets[i].position.x, bullets[i].position.y, bullets[i].bulletSize, enemies.position.x, enemies.position.y, enemies.enemySize2))
				// {
				// 	enemies.enemySize1 = 0;
				// 	enemies.enemySize2 = 0;

				// 	bullets[i].bulletSizeX = 0;
				// 	bullets[i].bulletSizeY = 0;

				// 	bulletDead = true;//setting the bullet to dead, so that a new shot can be fired again.
				// }

				bullets[i].update();
				bullets[i].draw(); 
			}
		}

		for (int i = 0; i < 1; i++)
		{

		}

// Draw Game User Interface		
		gui();
	}


	public void gui()
	{
// Draw Score at the top in the middle of the screen.
		fill(255);
		textSize(24);
		textAlign(LEFT, TOP);
		text(score, 5, 5);
	}
}
class GameOver {

public void gameover ()
{

 pushStyle();
    fill(0);
    noStroke();
    rectMode(CENTER);
    rect(width>>1, height>>1, 350, 150, 10, 10, 10, 10);
    textAlign(CENTER);
    fill(255);
    textSize(20);
    text(" Game over ", width>>1, height/2-40);
    textSize(15);
    fill(0xffFF002F);
    rect(width>>1, height>>1, buttonSize, 30, 10, 10, 10, 10);
    fill(255);
    text("again", width>>1, height/2+4);
    fill(255);
    textSize(10);
    text("Better luck next time ", width>>1, height/2+40);
    popStyle();

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
  public void startmenu() 
  {
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
    rect(width>>1, height>>1, buttonSize, 30, 10, 10, 10, 10);
    fill(255);
    text("START", width>>1, height/2+4);
    fill(255);
    textSize(10);
    text("Created by Adam & Emilie ", width>>1, height/2+40);
    popStyle();

//Check if the mouse is pressed when within 50px of the middle of the window.
    if (mousePressed && dist(mouseX, mouseY, width/2, height/2)<50)
    //if (mousePressed && (mouseX - width/2) < 50 && (mouseY - height/2) < 15)
    {
      startMenu = false;
      println("Starting Game and mouse is at: " + mouseX + " " + mouseY);
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

		// enemySize1 = 7;
		// enemySize2 = 15;
		

		enemyColor = color (255, 205, 0);
	}

	public void draw()
	{
		push();
		fill(enemyColor);
		translate(position.x, position.y);
		star(0, 0, enemySize1, enemySize2, 5);
		pop();
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
	
//Checking if SPACE is pressed, and if there is no bullet on screen.
  if (key == ' ' && bulletDead)
  {
//Find empty spot in array, create list (create bullet, at player's position)
  	for (int i = 0; i < bullets.length; i++)
  	{
      bullets[i] = new Bullet();
      bullets[i].position = player.position.copy();

      bulletDead = false; //Setting bullet not dead so that another can not be fired so that only one is on the screen at a time.

  		// if (bullets[i] == null)
  		// {
  		// 	bullets[i] = new Bullet();
  		// 	bullets[i].position = player.position.copy();
  		// 	//we are done, break/quit the loop.
  		// 	break;
  		// }
    //   else 
    //   {
    //     bullets[i] = new Bullet();
    //     bullets[i].position = player.position.copy();
    //     break;
    //   }
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
