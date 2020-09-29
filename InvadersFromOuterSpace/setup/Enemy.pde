class Enemy
{
	PVector position, velocity, startPos;
	float enemySize = 15;
	color playerColor = color (255, 205, 0);

	boolean right = true, down1 = false, left = false, down2 = false;


	Enemy ()
	{
		position = new PVector();
		velocity = new PVector();
		startPos = new PVector(width * 0.1, height * 0.1);
		
		position = startPos;
		
	}

	void draw ()
	{
		fill (playerColor);
		stroke(255);

		pushMatrix();
	  	translate(position.x, position.y);
	  	rotate(frameCount / -100.0);
	  	star(0, 0, 10, 30, 5); 
	  	popMatrix();
	}

	void star(float x, float y, float radius1, float radius2, int npoints) 
	{
		float angle = TWO_PI / npoints;
	 	float halfAngle = angle/2.0;
	  	beginShape();
	  	for (float a = 0; a < TWO_PI; a += angle) 
	  	{
	  		float sx = x + cos(a) * radius2;
	    	float sy = y + sin(a) * radius2;
	    	vertex(sx, sy);
	    	sx = x + cos(a+halfAngle) * radius1;
	    	sy = y + sin(a+halfAngle) * radius1;
	    	vertex(sx, sy);
	  	}
	  endShape(CLOSE);
	}


	void movement () 
	{// not sure if I should be using deltaTime here, but I want the for-loops to tick by deltaTime instead of frames.

// Make the enemy first take some steps to the right, then some fewer down, then some steps right and loop this
		float rightSteps = 100, downSteps = 20, leftSteps = 100, stepDistance = 0.1;


		if (right)
		{
			for (int i = 0; i <= rightSteps; i++)
			{
				position.x += stepDistance;
				println("right "+i);
				
			}
			right = false;
			down1 = true;
		}
		else if (down1)
		{
			for (int i = 0; i <= downSteps; i++)
			{
				position.y += stepDistance;
				println("down1 "+i);
				
			}
			down1 = false;
			left = true;
		}
		else if (left)
		{
			for (int i = 0; i <= leftSteps; i++)
			{
				position.x -= stepDistance;
				println("left "+i);
				
			}
			left = false;
			down2 = true;
		}
		else if (down2)
		{
			for (int i = 0; i <= downSteps; i++)
			{
				position.y += stepDistance;
				println("down2 "+i);
				
			}
			down2 = false;
			right = true;
		}
	}
}