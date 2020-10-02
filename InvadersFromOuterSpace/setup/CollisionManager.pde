class CollisionManager
{

	void collisionCheck()
	{
		// Check if the bullets are empty, if not, then spawn bullet.
		for (int i = 0; i < bullets.length; i++) {

			if (bullets [i] == null) {
				continue;
			}
			else {
				bullets[i].update();
				bullets[i].draw(); 

				for (int j = 0; j < enemies.length; j++) {

					// Check for collision between Bullet and the upper row of enemies (enemies1).
					if (hitCollision (bullets[i].position.x, bullets[i].position.y, bullets[i].bulletSizeY, 
					enemies[j].position.x, enemies[j].position.y, enemies[j].enemySize2)) {

						explosion.renderExp(enemies[j].position.x, enemies[j].position.y);
	
						score += scoreUp; // Add score for killing enemy

						// Remove the enemy as best as possible, by moving it outside of the screen, then shrinking it(neccessary?).
						enemies[j].position.x = -width;
						enemies[j].enemySize1 = 0;
						enemies[j].enemySize2 = 0;

						bullets[i] = null; // Removing the current bullet.
	
						bulletDead = true; // Setting the bullet to dead, so that a new shot can be fired again.

						break; // This condition is fullfilled, so break the for-loop from here and thus go onward with the rest of the code.
					}
					else if (bullets[i].position.y < bullets[i].bulletSizeY*2) {

						bullets[i] = null; // Removing the current bullet.
	
						bulletDead = true; // Setting the bullet to dead, so that a new shot can be fired again.
						
						break; // This condition is fullfilled, so break the for-loop from here and thus go onward with the rest of the code.
					}
				}
			}
		}
// Here we check for if the bullets of the enemies are hitting the player or if they leave the screen.
		for (int i = 0; i < enemyBullets.length; i++) {

			if (enemyBullets[i] == null) {
				continue;
			}
			else {
				enemyBullets[i].update2();
				enemyBullets[i].draw();

				if (hitCollision(enemyBullets[i].position.x, enemyBullets[i].position.y, enemyBullets[i].bulletSizeY/2, 
				player.position.x, player.position.y, player.playerSize/2)) {

					explosion.renderExp(player.position.x, player.position.y);

					lives --;

					enemyBullets[i] = null;

					enemyBulletDead = true;

					break;
				}
				else if (enemyBullets[i].position.y > height) {

					enemyBullets[i] = null;

					enemyBulletDead = true;

					break;
				}
			}
		}

// Checking for if the enemies have travelled all the way to the player, thus Game Over.
		for (int i = 0; i < numberOfEnemies; i++) {

			if (enemies[i].position.y >= player.position.y - (Player.width * 0.75)) {

				lives = 0;

				break;
			}
		}
		
// Check if the enemies are all dead, by checking the amount of score
		if (score >= scoreUp * numberOfEnemies) {
			
			gameOver = true;
		}
	}
}