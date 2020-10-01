class EnemyBullets extends Bullet
{
	EnemyBullets()
	{
		super();

		bulletColor = color(255, 0, 0);
	}

	void draw()
	{
		push();
		fill(bulletColor);
		noStroke();
		rect(position.x, position.y, bulletSizeX, bulletSizeY);
		pop();
	}

}