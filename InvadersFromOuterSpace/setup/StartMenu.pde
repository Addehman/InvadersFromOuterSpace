class StartMenu {

  //boolean startGame = false;
  void startmenu() 
  {
    pushStyle();
    fill(0);
    noStroke();
    rectMode(CENTER);
    rect(width>>1, height>>1, 350, 150, 10, 10, 10, 10);
    textAlign(CENTER);
    fill(255);
    textSize(20);
    text(" Invaders from Outer Space ", width>>1, height/2-40);
    textSize(15);
    fill(#FF002F);
    rect(width>>1, height>>1, buttonSize, 30, 10, 10, 10, 10);
    fill(255);
    text("START", width>>1, height/2+4);
    fill(255);
    textSize(10);
    text("Created by Adam & Emilie ", width>>1, height/2+40);
    popStyle();

//Check if the mouse is pressed when within 50px of the middle of the window.
    if (mousePressed && dist(mouseX, mouseY, width/2, height/2) < 50)
    //if (mousePressed && (mouseX - width/2) < 50 && (mouseY - height/2) < 15)
    {
      startMenu = false;
      println("Starting Game and mouse is at: " + mouseX + " " + mouseY);
    }
  }
}