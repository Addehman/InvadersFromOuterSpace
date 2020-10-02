class GameManager
{


	GameManager()
	{

	}

// A start-function that will act as a "setup"-function, but which will be possible to call on anytime and not just once.
// Needed for example when we want to reset the game after game over.
	void start () 
	{
// Reset the game values.
		lives = 3;
		score = 0;
		row = 0; // Row-number of enemies.
		
// Create our enemies.
		for (int i = 0; i < numberOfEnemies; i++)
		{
			if (i % 11 == 0)
			{
				row++;
			}
			enemies[i] = new Enemies();
			enemies[i].position.x += 50 * (i % 11);
			enemies[i].position.y = height * (row * 0.1);
		}
// Setting player start position.
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
	  		if (i > 10 && i < 22)
			{
				enemies[i].draw();
				enemies[i].movement2();
			}
			else
			{
				enemies[i].draw();
		  		enemies[i].movement1();
			}
	
	  	}

// By random, the enemies1[i] will fire a bullet towards player.
	  	randomEnemyFire = (int)random(33);
	  	
		for (int i = 0; i < enemyBullets.length; i++)
		{
			int randomNumber = (int)random(1000);

	    	if (randomNumber % 1000 == 0 && enemyBulletDead)
			{
		    	enemyBullets[i] = new EnemyBullets();
		    	enemyBullets[i].position = enemies[randomEnemyFire].position.copy();

		    	enemyBulletDead = false;
		    	break;
	    	}
	    	else 
	    	{
	    		continue;
	    	}
		}

// If number of lives are equal or lower than 0, then go to game over screen.
	  	if (lives <= 0) 
	  	{
			gameOver = true;
			highscore = score; 
		}

		// Check if the enemies are all dead, by checking the amount of score
		if (score >= scoreUp * numberOfEnemies)
		{
			gameOver = true;
			highscore = score;
		}

// ---------------------------------------------------------=: COLLISION SECTION :=-----------------------------------------------------//

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
					// Check for collision between Bullet and the upper row of enemies (enemies1).
					if (hitCollision (bullets[i].position.x, bullets[i].position.y, bullets[i].bulletSizeY, enemies[j].position.x, enemies[j].position.y, enemies[j].enemySize2)) 
					{
						explosion.renderExp(enemies[j].position.x, enemies[j].position.y);
	
						score += scoreUp; // Add score for killing enemy

						// Remove the enemy as best as possible, by moving it outside of the screen, then shrinking it(neccessary?).
						enemies[j].position.x = -width;
						enemies[j].enemySize1 = 0;
						enemies[j].enemySize2 = 0;

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
				}
			}
		}
// Here we check for if the bullets of the enemies are hitting the player or if they leave the screen.
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

				if (hitCollision(enemyBullets[i].position.x, enemyBullets[i].position.y, enemyBullets[i].bulletSizeY/2, player.position.x, player.position.y, player.playerSize/2))
				{
					explosion.renderExp(player.position.x, player.position.y);

					lives --;

					enemyBullets[i] = null;

					enemyBulletDead = true;
					break;
				}
				else if (enemyBullets[i].position.y > height)
				{
					enemyBullets[i] = null;

					enemyBulletDead = true;
					break;
				}
			}
		}

// Checking for if the enemies have travelled all the way to the player, thus Game Over.
		for (int i = 0; i < numberOfEnemies; i++)
		{
			if (enemies[i].position.y >= player.position.y - (Player.width * 0.75))
			{
				lives = 0;
				break;
			}
		}

//---------------------------------------------------------------=: END OF COLLISION SECTION :=------------------------------------------------------------------------------//

// Draw Game User Interface		
		gui();
	}


	void gui()
	{
// Draw Score at the top in the middle of the screen.
		fill(255);
		textSize(24);
		textAlign(CENTER, TOP);
		text(score, width / 2, 5);

		textAlign(RIGHT, BOTTOM);
		text("High Score: " + highscore, width - 10, height - 5);

		if (lives == 3)
		{
			image(LivesIcon, width * 0.05, height - 20);
			image(LivesIcon, width * 0.1, height - 20);
			image(LivesIcon, width * 0.15, height - 20);
		}
		else if (lives == 2)
		{
			image(LivesIcon, width * 0.05, height - 20);
			image(LivesIcon, width * 0.1, height - 20);
		}
		else if (lives == 1)
		{
			image(LivesIcon, width * 0.05, height - 20);
		}
	}
}