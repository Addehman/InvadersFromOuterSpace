class GameManager
{

	GameManager()
	{

	}

void start () {
	lives = 3;
	
	//Create our enemies
  	// for (int i = 0; i < numberOfEnemies; i++)
  	// {
  	// 	enemies[i] = new Enemies();

  	
  	// 	if (firstRowOfEnemies)
  	// 	{
  	// 		enemies[i].position.x += 50 * i;
  	// 	}
  		// if (i <= firstRowOfEnemies)
  		// {
  		// 	enemies[i].position.x += 50 * i;
  		// }
  		// if (i > firstRowOfEnemies && i <= secondRowOfEnemies)
  		// {
  		// 	for (int j = 0; j < firstRowOfEnemies; j++)
  		// 	{
  		// 		enemies[i].position = enemies[i].startPos;
  		// 	  	enemies[i].position.y = height * 0.2; 

  		// 	  	enemies[i].position.x += 50 * j;
  		// 	}
  		// }
  		//}

  		for (int i = 0; i < numberOfEnemies; i++)
  		{
  			enemies1[i] = new Enemies();
  			enemies1[i].position.x += 50 * i;
  		}

  		for (int i = 0; i < numberOfEnemies; i++)
  		{
  			enemies2[i] = new Enemies();
  			enemies2[i].position.x += 50 * i;
  			enemies2[i].position.y = height * 0.2;

  		}

  	for (int i = 0; i < numberOfEnemies; i++)
  	{
  			enemies3[i] = new Enemies();
  			enemies3[i].position.x += 50 * i;
  			enemies3[i].position.y = height * 0.3;
  		}
  	

  	player.position.x = width/2;
  	player.position.y = height * 0.8;
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
		  	enemies1[i].draw();
		  	enemies1[i].movement1();

		  	enemies2[i].draw();
		  	enemies2[i].movement2();

		  	enemies3[i].draw();
		  	enemies3[i].movement1();
		  	//println(deltaTime);

		  	//enemy.movement();
		  	
		  	

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

				for (int j = 0; j < enemies1.length; j++)
				{
					if (hitCollision (bullets[i].position.x, bullets[i].position.y, bullets[i].bulletSize, enemies1[j].position.x, enemies1[j].position.y, enemies1[j].enemySize2)) 
								{
									explosion.renderExp(enemies1[j].position.x, enemies1[j].position.y);
				
									score += scoreUp; // Add score for killing enemy
									//println("colliding");
									enemies1[j].enemySize1 = 0;
									enemies1[j].enemySize2 = 0;

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