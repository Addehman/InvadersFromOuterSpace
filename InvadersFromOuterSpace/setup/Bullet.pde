class Bullet
{
	PVector position, velocity; //Bullet position

	float bulletSizeX = 10, bulletSizeY = 15, bulletSpeed = 20, enemyBulletSpeed = 10;

	color bulletColor;


	public Bullet()
	{
		position = new PVector();
		velocity = new PVector();

		bulletColor = color(0, 255, 0);

// Starting position from player
		position.x = player.position.x;
		position.y = player.position.y;
	}


	void update()
	{
// Update bullet position
		position.y -= bulletSpeed;
	}

	void update2()
	{
		position.y += enemyBulletSpeed;
	}

	void draw()
	{
		fill(bulletColor);
		noStroke();
		rect(position.x, position.y, bulletSizeX, bulletSizeY);		
	}
}