class Enemy
{
	PVector position, velocity, startPos;
	
	float rightSteps = 30, downSteps = 10, leftSteps = 30, 
	stepDistance = 0.5, currentSteps = 0, enemySize1 = 7, enemySize2 = 15;
	
	color enemyColor = color (255, 205, 0);

	boolean right = true, down1 = false, left = false, down2 = false;


	Enemy ()
	{
		position = new PVector();
		velocity = new PVector();
		startPos = new PVector(width * 0.1, height * 0.1 );
		
		position = startPos;

		//position.x = position.x + enemySize2 * 3 * numberOfEnemies;
		
	}

	void draw ()
	{
		fill (enemyColor);
		stroke(255);

		push();
	  	translate(position.x, position.y);
	  	//rotate(frameCount / -100.0);
	  	star(0, 0, enemySize1, enemySize2, 5); 
	  	pop();
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

		if (right)
		{
			
			position.x += stepDistance;
			currentSteps += stepDistance;
			//println("right " + currentSteps);
				
			if (currentSteps >= rightSteps)
			{
				right = false;
				down1 = true;
				currentSteps = 0;
			}
		}
		else if (down1)
		{
			
			position.y += stepDistance;
			currentSteps += stepDistance;
			//println("down1 " + currentSteps);

			if (currentSteps >= downSteps)
			{
				down1 = false;
				left = true;
				currentSteps = 0;
			}
		}
		else if (left)
		{
			position.x -= stepDistance;
			currentSteps += stepDistance;
			//println("left " + currentSteps);
			
				
			if (currentSteps >= leftSteps)
			{
				left = false;
				down2 = true;
				currentSteps = 0;
			}
		}
		else if (down2)
		{
			position.y += stepDistance;
			currentSteps += stepDistance;
			//println("down2 " + currentSteps);
			
			if (currentSteps >= downSteps)
			{
				down2 = false;
				right = true;
				currentSteps = 0;
			}
		}
	}
}