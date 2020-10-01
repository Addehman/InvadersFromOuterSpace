class GameManager
{

	GameManager()
	{

	}

// A start-function that will act as a "setup"-function, but which will be possible to call on anytime and not just once.
// Needed for example when we want to reset the game after game over.
	void start () 
	{
		lives = 3;
		
// Create our enemies
		for (int i = 0; i < numberOfEnemies; i++)
		{
			enemies1[i] = new Enemies();
			enemies1[i].position.x += 50 * i;
		}

		for (int i = 0; i < numberOfEnemies; i++)
		{
			enemies2[i] = new Enemies();
			enemies2[i].startPos.x = width * 0.15;
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
		  	
		  	enemies1[i].draw();
		  	enemies1[i].movement1();

		  	enemies2[i].draw();
		  	enemies2[i].movement2();

		  	enemies3[i].draw();
		  	enemies3[i].movement1();
	  	}

// If number of lives are equal or lower than 0, then go to game over screen.
	  	if (lives <= 0) 
	  	{
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
					// Check for collision between Bullet and the upper row of enemies (enemies1).
					if (hitCollision (bullets[i].position.x, bullets[i].position.y, bullets[i].bulletSizeY, enemies1[j].position.x, enemies1[j].position.y, enemies1[j].enemySize2)) 
					{
						explosion.renderExp(enemies1[j].position.x, enemies1[j].position.y);
	
						score += scoreUp; // Add score for killing enemy

						// Remove the enemy as best as possible, by moving it outside of the screen, then shrinking it(neccessary?).
						enemies1[j].position.x = -width;
						enemies1[j].enemySize1 = 0;
						enemies1[j].enemySize2 = 0;

						// enemies[j] = null; // Does NullPointerException!

						bullets[i] = null; // Removing the current bullet.
	
						bulletDead = true; // Setting the bullet to dead, so that a new shot can be fired again.

						break; // This condition is fullfilled, so break the for-loop from here and thus go onward with the rest of the code.
					}
					else if (bullets[i].position.y < bullets[i].bulletSizeY*2)
					{
						bullets[i] = null; // Removing the current bullet.
	
						bulletDead = true; // Setting the bullet to dead, so that a new shot can be fired again.
						
						break; // This condition is fullfilled, so break the for-loop from here and thus go onward with the rest of the code.
					}

					// Check for collision between Bullet and the middle row of enemies (enemies2).
					if (hitCollision (bullets[i].position.x, bullets[i].position.y, bullets[i].bulletSizeY, enemies2[j].position.x, enemies2[j].position.y, enemies2[j].enemySize2)) 
					{
						explosion.renderExp(enemies2[j].position.x, enemies2[j].position.y);
	
						score += scoreUp; // Add score for killing enemy

						// Remove the enemy as best as possible, by moving it outside of the screen, then shrinking it(neccessary?).
						enemies2[j].position.x = -width;
						enemies2[j].enemySize1 = 0;
						enemies2[j].enemySize2 = 0;

						
						bullets[i] = null; // Removing the current bullet.
	
	
						bulletDead = true; // Setting the bullet to dead, so that a new shot can be fired again.

						break; // This condition is fullfilled, so break the for-loop from here and thus go onward with the rest of the code.
					}
					else if (bullets[i].position.y < bullets[i].bulletSizeY*2)
					{
						bullets[i] = null; // Removing the current bullet.
	
						bulletDead = true; // Setting the bullet to dead, so that a new shot can be fired again.
						
						break; // This condition is fullfilled, so break the for-loop from here and thus go onward with the rest of the code.
					}

					// Check for collision between Bullet and the lower row of enemies (enemies3).
					if (hitCollision (bullets[i].position.x, bullets[i].position.y, bullets[i].bulletSizeY, enemies3[j].position.x, enemies3[j].position.y, enemies3[j].enemySize2)) 
					{
						explosion.renderExp(enemies3[j].position.x, enemies3[j].position.y);
	
						score += scoreUp; // Adding score for killing enemy

						// Remove the enemy as best as possible, by moving it outside of the screen.
						enemies3[j].position.x = -width;
						enemies3[j].enemySize1 = 0;
						enemies3[j].enemySize2 = 0;

						
						bullets[i] = null; // Removing the current bullet.
	
	
						bulletDead = true; // Setting the bullet to dead, so that a new shot can be fired again.

						break; // This condition is fullfilled, so break the for-loop from here and thus go onward with the rest of the code.
					}
					else if (bullets[i].position.y < bullets[i].bulletSizeY*2)
					{
						bullets[i] = null; // Removing the current bullet.
	
						bulletDead = true; //setting the bullet to dead, so that a new shot can be fired again.
						
						break; // This condition is fullfilled, so break the for-loop from here and thus go onward with the rest of the code.
					}
				}
			}
		}

		for (int i = 0; i < enemyBullets.length; i++)
		{
			if (enemyBullets[i] == null)
			{
				continue;
			}
			else
			{
				enemyBullets[i].update2();
				enemyBullets[i].draw();

				if (hitCollision(enemyBullets[i].position.x, enemyBullets[i].position.y, enemyBullets[i].bulletSizeY, player.position.x, player.position.y, player.playerSize))
				{
					explosion.renderExp(player.position.x, player.position.y);

					enemyBullets[i] = null;

					break;
				}
				else if (enemyBullets[i].position.y > height)
				{
					enemyBullets[i] = null;

					break;
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