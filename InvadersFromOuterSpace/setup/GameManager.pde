class GameManager
{

	GameManager()
	{

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


	void gui()
	{
// Draw Score at the top in the middle of the screen.
		fill(255);
		textSize(24);
		textAlign(LEFT, TOP);
		text(score, 5, 5);
	}
}