class Enemies extends Enemy
{
	Enemies()
	{
		super();

		enemyColor = color (255, 205, 0);
	}


	void draw()
	{
		push();
		fill(enemyColor);
		translate(position.x, position.y);
		star(0, 0, enemySize1, enemySize2, 5);
		pop();
	}
}