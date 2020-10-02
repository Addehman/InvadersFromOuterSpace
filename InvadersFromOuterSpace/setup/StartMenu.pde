class StartMenu {

  //boolean startGame = false;
  void startmenu() 
  {
    pushStyle();
    fill(0);
    noStroke();
    rectMode(CENTER);
    rect(width * 0.50, height * 0.55, 266, 120, 10, 10, 10, 10);
    textAlign(CENTER);
    fill(255);
    textSize(123);
    text(" Invaders ", width * 0.5, height * 0.3);
    textSize(27);
    text(" (from outer space) ", width * 0.5, height * 0.38);
    textSize(15);
    fill(#FF002F);
    rect(width * 0.50, height * 0.51, buttonSize, 35, 10, 10, 10, 10);
    fill(255);
    text("START", width * 0.50, height * 0.52);
    fill(255);
    textSize(15);
    text("Created by Adam & Emilie ", width * 0.5, height * 0.65);
    popStyle();

//Check if the mouse is pressed when within 50px of the middle of the window.
    if (mousePressed && dist(mouseX, mouseY, width/2, height/2) < 50)
    //if (mousePressed && (mouseX - width/2) < 50 && (mouseY - height/2) < 15)
    {
      startMenu = false;
      //println("Starting Game and mouse is at: " + mouseX + " " + mouseY);
    }
  }
}
