class GameManager
{

	GameManager()
	{

	}

void start () {
	lives = 3;
	
	//Create our enemies
  	for (int i = 0; i < numberOfEnemies; i++)
  	{
  		enemies[i] = new Enemies();
  		enemies[i].position.x += 50 * i;
  	}

  	player.position.x = width/2;
  	player.position.y = height * 0.8;

  	buttonX = width/2 - buttonSize-10;
  	buttonY = height/2 - buttonSize/2;
}

	void update()
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

if (lives <= 0) {

	gameOver = true;
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
				bullets[i].update();
				bullets[i].draw(); 

				for (int j = 0; j < enemies.length; j++)
				{
					if (hitCollision (bullets[i].position.x, bullets[i].position.y, bullets[i].bulletSize, enemies[j].position.x, enemies[j].position.y, enemies[j].enemySize2)) 
								{
									explosion.renderExp(enemies[j].position.x, enemies[j].position.y);
				
									score += scoreUp; // Add score for killing enemy
									//println("colliding");
									enemies[j].enemySize1 = 0;
									enemies[j].enemySize2 = 0;

									// enemies[j] = null; // Does NullPointerException!
									bullets[i] = null;
				
									// bullets[i].bulletSizeX = 0;
									// bullets[i].bulletSizeY = 0;
				
									bulletDead = true; //setting the bullet to dead, so that a new shot can be fired again.

									break;
								}
								else if (bullets[i].position.y < bullets[i].bulletSizeY*2)
								{
									// bullets[i].position.y = bullets[i].bulletSizeY*2;
									// bullets[i].bulletSizeX = 0;
									// bullets[i].bulletSizeY = 0;

									bullets[i] = null;
				
									bulletDead = true; //setting the bullet to dead, so that a new shot can be fired again.
									
									break;
								}
								// else if (hitCollision(bullets[i].position.x, bullets[i].position.y, bullets[i].bulletSize, enemies.position.x, enemies.position.y, enemies.enemySize2))
								// {
								// 	enemies.enemySize1 = 0;
								// 	enemies.enemySize2 = 0;
				
								// 	bullets[i].bulletSizeX = 0;
								// 	bullets[i].bulletSizeY = 0;
				
								// 	bulletDead = true;//setting the bullet to dead, so that a new shot can be fired again.
								// }
				
				}
			}
		}

// Draw Game User Interface		
		gui();
	}


	void gui()
	{
// Draw Score at the top in the middle of the screen.
		fill(255);
		textSize(24);
		textAlign(LEFT, TOP);
		text(score, 5, 5);
	}
}