class Bullet
{
	PVector position, velocity; //Bullet position

	float bulletSizeX = 10, bulletSizeY = 15, bulletSize;
	color bulletColor;

	float bulletSpeed = 20;

	public Bullet()
	{
		position = new PVector();
		velocity = new PVector();

		bulletColor = color(0, 255, 0);

		// Starting position from player
		position.x = player.position.x;
		position.y = player.position.y;

		bulletSize = bulletSizeX * bulletSizeY;
	}


	void update()
	{
		// Update bullet position
		position.y -= bulletSpeed;
	}

	void draw()
	{
		//translate(position.x, position.y);
		fill(bulletColor);
		noStroke();
		rect(position.x, position.y, bulletSizeX, bulletSizeY);

		//update();

		//println("Shooting");
	}
}