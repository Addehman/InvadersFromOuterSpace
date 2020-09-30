class Bullet
{
	PVector position, velocity; //Bullet position

	float bulletSizeX = 10, bulletSizeY = 15, bulletSize;
	float bulletSpeed = 20;

	color bulletColor;

	Bullet[] bullets;


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

	void draw()
	{
		//translate(position.x, position.y);
		fill(bulletColor);
		noStroke();
		rect(position.x, position.y, bulletSizeX, bulletSizeY);

		//update();

		//println("Shooting");

// Check for if outside of window, if yes, then nullify
		/*if (position.x < 0 - bulletSize || position.x > width + bulletSize 
			|| position.y < 0 - bulletSize || position.y > height + bulletSize)
		{

			this.bullet = null;
		}*/
// This "if" below is temporary and shall be replaced by the one above, but is testing if the "null" works.
		
	}
}