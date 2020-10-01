class Player
{
	PVector position = new PVector(), velocity = new PVector(); // Only need velocity.x for now, so could actually simply be using and int/float
	
	float playerSize = Player.width, playerSpeed = 10.0;

	color playerColor = color(255);


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
		image (Player, position.x, position.y);
	}
}