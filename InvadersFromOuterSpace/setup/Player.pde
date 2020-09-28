class Player
{
	PVector position = new PVector(), velocity = new PVector(); // Only need velocity.x for now, so could actually simply be using and int/float
	float playerSize = 30;

	color playerColor = color(255);

	float playerSpeed = 10.0;

	public Player ()
	{
		
	}

	void update()
	{
		velocity = input();

		position.x += velocity.x * playerSpeed;

		// Boundaries
		if (position.x < 0 + playerSize/2)
		{
			position.x = 0 + playerSize/2;
		}
		else if (position.x > width - playerSize/2)
		{
			position.x = width - playerSize/2;
		}
	}

	void draw()
	{
		//Draw player
		fill(playerColor);
		noStroke();
		rect(position.x, position.y, playerSize, playerSize);
	}

}