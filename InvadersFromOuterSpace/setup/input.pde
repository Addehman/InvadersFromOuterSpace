boolean moveLeft = false, moveRight = false;

PVector inputVector = new PVector();


void keyPressed()
{
	if (keyCode == LEFT || key == 'a') {

	moveLeft = true;
	}
	else if (keyCode == RIGHT || key == 'd') {

		moveRight = true;
	}

//Checking if SPACE or UP(arrow) is pressed, and if there is no bullet on screen.
	if (key == ' ' && bulletDead || keyCode == UP && bulletDead) {
//Find empty spot in array, create list (create bullet, at player's position)
	for (int i = 0; i < bullets.length; i++) {

		bullets[i] = new Bullet();
		bullets[i].position = player.position.copy();

		bulletDead = false; //Setting bullet not dead so that another can not be fired so that only one is on the screen at a time.
	}
}


	if (key == ESC) {
		exit ();
	}

// ---=: TEST-KEYS / DEBUG-KEYS SECTION :=---//
//test keys to see if we can get restart screen

	if (key == 'k') {
		lives --;
	}

	if (keyCode == DOWN) {

		for (int i = 0; i < numberOfEnemies; i++) {

			enemies[i].position.y += 10;
		}
	}

	if (key == 'v') {
		gameOver = true;
	}
//-------=: END OF TEST/DEBUG KEYS SECTION :=---------//
}


void keyReleased ()
{
	if (keyCode == LEFT || key == 'a') {
		moveLeft = false;
	}
	else if (keyCode == RIGHT || key == 'd') {
		moveRight = false;
	}
}


PVector input()
{
	inputVector.x = 0;
	inputVector.y = 0;

	if (moveLeft) {
		inputVector.x -= 1;
	}

	if (moveRight) {
		inputVector.x += 1;
	}

	inputVector.normalize ();

	return inputVector;
}
