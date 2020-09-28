class Enemy
{
	PVector position, velocity;
	float enemySize = 15;
	color playerColor = color (255, 205, 0);
	Enemy ()
	{
		position = new PVector ();
		velocity = new PVector();
		

	}
void draw ()
{
	fill (playerColor);
	stroke(255);

	pushMatrix();
  	translate(position.x, position.y);
  	rotate(frameCount / -100.0);
  	star(0, 0, 30, 70, 5); 
  	popMatrix();

}

void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

}
