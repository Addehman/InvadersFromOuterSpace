class Player
{
	PVector position = new PVector(), velocity = new PVector(); // Only need velocity.x for now, so could actually simply be using and int/float
	float playerSize = 20;

	color playerColor = color(255);

	int playerSpeed = 30;

	public Player ()
	{
		velocity = input();
	}

	void update()
	{
		position.x += velocity.x * playerSpeed;
	}

	void draw()
	{
		//Draw player
		fill(playerColor);
		noStroke();
		rect(position.x, position.y, playerSize, playerSize);
	}

}