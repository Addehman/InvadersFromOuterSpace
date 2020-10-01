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
    text(" Game over ", width>>1, height/2-40);
    textSize(15);
    fill(#FF002F);
    rect(width>>1, height>>1, buttonSize, 30, 10, 10, 10, 10);
    fill(255);
    text("again", width>>1, height/2+4);
    fill(255);
    textSize(10);
    text("Better luck next time ", width>>1, height/2+40);
    popStyle();

}

}