class Bullet
{
	PVector position, velocity; //Bullet position
	int bulletSizeX = 5, bulletSizeY = 10;
	color bulletColor = color(0, 255, 0);

	float bulletSpeed = 10;

	Player player;

	Bullet()
	{
		position = new PVector();
		velocity = new PVector();

		//
		position.x = player.position.x;
		position.y = player.position.y;
	}

	public Bullet(float x, float y)
	{
		//Create vector objects
		position = new PVector(x, y);

		velocity = new PVector();
	}

	void update()
	{
		// Update bullet position
		position.y += bulletSpeed;
	}

	void draw()
	{
		fill(bulletColor);
		rect(position.x, position.y, bulletSizeX, bulletSizeY);
	}
}