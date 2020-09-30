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
	  	enemy.draw();
	  	//println(deltaTime);

	  	enemy.movement();
	  	//enemies.draw();

// Check if the bullets are empty, if not, then spawn bullet.
		for (int i = 0; i < bullets.length; i++) 
		{
			if (bullets [i] == null) 
			{
				continue;
			}
			else 
			{
				if (hitCollision (bullets[i].position.x, bullets[i].position.y, bullets[i].bulletSize, enemy.position.x, enemy.position.y, enemy.enemySize)) 
				{
					explosion.renderExp(enemy.position.x, enemy.position.y);
					//println("colliding");
				}

				bullets[i].update();
				bullets[i].draw(); 
			}
		}
	}
}