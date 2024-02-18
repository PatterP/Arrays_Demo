class HighScores {

  //PImage titleCard;

  // Instantiates buttons for title screen
  Button menuButton;
  //Button exitButton;

  HighScores() {

    // Sets location and contents of buttons
    menuButton = new Button(width/2 - 200, 450 + 480, "Menu");
    //exitButton = new Button(100, 450 + 480, "Exit");

    //titleCard = (loadImage("TitleCard.png"));
  }

  void update() {

    menuButton.update();
    //exitButton.update();

    buttonPressed();
  }

  void draw() {

    //image(titleCard, 0, 0);

    // Displays game name
    //textAlign(BASELINE, BASELINE);
    //textSize(60);

    fill(0);
    textAlign(CENTER, CENTER);
    textSize(48);
    text("User:", 250, 100);

    text("High Score:", width - 250, 100);


    for (int i = 1; i <= 10; i++) {
      fill(0);
      textAlign(CENTER, CENTER);
      textSize(24);
      text("User:", 250, 100 + 75*i);

      text("High Score:", width - 250, 100 + 75*i);
    }


    // Draws buttons
    menuButton.draw();
    //exitButton.draw();
  }

  // Switches screen based on button input
  void buttonPressed() {
    if (menuButton.mouseHasBeenPressed() == true) {
      title = new Title();
      //theme.play();
      //theme.loop();
      //theme.play();
      //theme.loop();
    }
    //if (exitButton.mouseHasBeenPressed() == true)
      //exit();
  }
}
