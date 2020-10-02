class Enemy
{
	PVector position, velocity, startPos;
	
	float rightSteps = 30, downSteps = 10, leftSteps = 30, 
	stepDistance = 0.5, currentSteps = 0, enemySize1 = 7, enemySize2 = 15;
	
	boolean step1 = true, step2 = false, step3 = false, step4 = false;

	color enemyColor = color (255, 205, 0);


	Enemy ()
	{
		position = new PVector();
		velocity = new PVector();
		startPos = new PVector(width * 0.1, height * 0.1 );
		
		position = startPos;		
	}

	void draw ()
	{
		fill (enemyColor);
		stroke(255);

		push();
	  	translate(position.x, position.y);
	  	star(0, 0, enemySize1, enemySize2, 5); 
	  	pop();
	}

	void star(float x, float y, float radius1, float radius2, int npoints) 
	{
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


	void movement1 () 
	{
// Make the enemy first take some steps to the right, then some fewer down, then some steps right and loop this
		

		if (step1) { // Steps Right

			position.x += stepDistance;
			currentSteps += stepDistance;
				
			if (currentSteps >= rightSteps) {

				step1 = false;
				step2 = true;
				currentSteps = 0;
			}
		}
		else if (step2) { // Steps Down		

			position.y += stepDistance;
			currentSteps += stepDistance;

			if (currentSteps >= downSteps) {

				step2 = false;
				step3 = true;
				currentSteps = 0;
			}
		}
		else if (step3) { // Steps Left

			position.x -= stepDistance;
			currentSteps += stepDistance;

			if (currentSteps >= leftSteps) {

				step3 = false;
				step4 = true;
				currentSteps = 0;
			}
		}
		else if (step4) { // Steps Down

			position.y += stepDistance;
			currentSteps += stepDistance;
			//println("down2 " + currentSteps);
			
			if (currentSteps >= downSteps) {

				step4 = false;
				step1 = true;
				currentSteps = 0;
			}
		}
	}

	void movement2 () 
	{
// Make the enemy first take some steps to the right, then some fewer down, then some steps right and loop this
		if (step1) { // Steps Left

			position.x -= stepDistance;
			currentSteps += stepDistance;
			//println("left " + currentSteps);
			
				
			if (currentSteps >= leftSteps) {

				step1 = false;
				step2 = true;
				currentSteps = 0;
			}
		}
		else if (step2) { // Steps Down
			
			position.y += stepDistance;
			currentSteps += stepDistance;
			//println("down1 " + currentSteps);

			if (currentSteps >= downSteps) {

				step2 = false;
				step3 = true;
				currentSteps = 0;
			}
		}
		else if (step3) { // Steps Right

			position.x += stepDistance;
			currentSteps += stepDistance;
			//println("right " + currentSteps);
				
			if (currentSteps >= rightSteps) {
				step3 = false;
				step4 = true;
				currentSteps = 0;
			}
		}
		else if (step4) { // Steps Down

			position.y += stepDistance;
			currentSteps += stepDistance;
			//println("down2 " + currentSteps);
			
			if (currentSteps >= downSteps) {

				step4 = false;
				step1 = true;
				currentSteps = 0;
			}
		}
	}
}