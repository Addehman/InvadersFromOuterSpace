class GameOver {

void gameover ()
{

 pushStyle();
    fill(0);
    noStroke();
    rectMode(CENTER);
    rect(width>>1, height>>1, 350, 150, 10, 10, 10, 10);
    textAlign(CENTER);
    fill(255);
    textSize(20);
    

if (lives <= 0)
{
    text(" Game over ", width>>1, height/2-40);
    textSize(15);
    fill(#FF002F);
    rect(width>>1, height>>1, buttonSize, 30, 10, 10, 10, 10);
    fill(255);
    text("try again", width>>1, height/2+4);
    fill(255);
    textSize(10);
    text("don't hate, do better m8", width>>1, height/2+40);
}

else {
    
	text(" Congrats, you obliterated all the stars ", width>>1, height/2-40);
    textSize(15);
    fill(#FF002F);
    rect(width>>1, height>>1, buttonSize, 30, 10, 10, 10, 10);
    fill(255);
    text("Play again", width>>1, height/2+4);
    fill(255);
    textSize(10);
    text("What're you going to do without stars", width>>1, height/2+40);
	}
	popStyle();


if (mousePressed && dist(mouseX, mouseY, width/2, height/2)<50)

    {
      gameOver = false;

 gameManager.start();
		}

	}
}
