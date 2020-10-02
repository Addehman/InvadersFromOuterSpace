class GameOver 
{
	void gameover()
	{
		pushStyle();
		textAlign(CENTER);
		textSize(32);


		if (lives <= 0) {

			fill(0);
			noStroke();
			rectMode(CENTER);
			rect(width * 0.50, height * 0.49, 350, 150, 10, 10, 10, 10);

			fill(255);
			text(" Game over ", width>>1, height/2-40);
			textSize(15);

			fill(#FF002F);
			rect(width>>1, height>>1, buttonSize, 30, 10, 10, 10, 10);

			fill(255);
			text("try again", width>>1, height/2+4);

			fill(255);
			textSize(15);
			text("don't hate, do better m8", width>>1, height * 0.61);
		}
		else {
			fill(0);
			noStroke();
			rectMode(CENTER);
			rect(width * 0.50, height * 0.54, 350, 150, 10, 10, 10, 10);

			fill(255);
			textSize (77); 
			text(" Congrats ", width * 0.50, height * 0.20);

			textSize (32);
			text (" YOU OBLITERATED ALL THE STARS ", width * 0.50, height * 0.31);

			textSize(15);
			fill(#FF002F);
			rect(width * 0.50, height* 0.50, buttonSize, 26, 10, 10, 10, 10);

			fill(255);
			text("Play again", width* 0.50, height* 0.51);

			fill(255);
			textSize(13);
			text("Joke's on you, we need stars to survive. So you're dead anyway", width>>1, height/2+40);
		}
		popStyle();

		if (mousePressed && dist(mouseX, mouseY, width/2, height/2)<50) {

			gameOver = false;

			gameManager.start();
		}
		
		textAlign(CENTER, BOTTOM);
		text("High Score: " + highscore, width / 2, height * 0.92);
	}
}
