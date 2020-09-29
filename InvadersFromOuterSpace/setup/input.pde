boolean moveLeft = false, moveRight = false;

PVector inputVector = new PVector();



void keyPressed()
{
   if (keyCode == LEFT || key == 'a')
   	moveLeft = true;

   else if (keyCode == RIGHT || key == 'd')
  	moveRight = true;
	
  if (key == ' ')
  {
  	bullet = new Bullet();
  	bullet.draw();
  }
  if (key == ESC)
  {
  	exit ();
  }
}

void keyReleased ()
{
  if (keyCode == LEFT || key == 'a')
    moveLeft = false;
  else if (keyCode == RIGHT || key == 'd')
  	moveRight = false;
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
