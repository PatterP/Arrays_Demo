class Title {

  //PImage titleCard;

  // Instantiates buttons for title screen
  Button playButton;
  Button scoresButton;
  Button learnButton;
  Button exitButton;

  Title() {

    // Sets location and contents of buttons
    playButton = new Button(880 - 100, 150 + 305, "Play");
    learnButton = new Button(880 - 100, 200 + 380, "Learn");
    scoresButton = new Button(880 - 100, 325 + 380, "Scores");
    exitButton = new Button(880 - 100, 450 + 380, "Exit");

    //titleCard = (loadImage("TitleCard.png"));
  }

  void update() {

    playButton.update();
    learnButton.update();
    scoresButton.update();
    exitButton.update();

    buttonPressed();
  }

  void draw() {

    //image(titleCard, 0, 0);

    // Displays game name
    //textAlign(BASELINE, BASELINE);
    //textSize(60);

    // Draws buttons
    playButton.draw();
    learnButton.draw();
    scoresButton.draw();
    exitButton.draw();
  }

  // Switches screen based on button input
  void buttonPressed() {
    if (playButton.mouseHasBeenPressed() == true) {
      minigame = new MiniGame();
      //theme.play();
      //theme.loop();
      //theme.play();
      //theme.loop();
    }
    if (scoresButton.mouseHasBeenPressed() == true) {
      highScores = new HighScores();
      //theme.play();
      //theme.loop();
      //theme.play();
      //theme.loop();
    }
    if (exitButton.mouseHasBeenPressed() == true)
      exit();
  }
}
