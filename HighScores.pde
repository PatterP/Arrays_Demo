// High score screen
class HighScores {

  //PImage titleCard;

  // Instantiates buttons for title screen
  Button menuButton;
  Button enterButton;
  NameInput intialsButtons[] = new NameInput[3];

  String user;

  int scoreLocation = -1;

  HighScores() {

    // Sets location and contents of buttons
    menuButton = new Button(width/2 - 200, 450 + 480, "Menu");
    enterButton = new Button(width/2 + 200, 450 + 350, "Enter");

    // Buttons used for inputing user intials
    intialsButtons[0] = new NameInput(width/2 - 200, 350 + 480);
    intialsButtons[1] = new NameInput(width/2 - 75, 350 + 480);
    intialsButtons[2] = new NameInput(width/2 + 50, 350 + 480);

    //titleCard = (loadImage("TitleCard.png"));

    // Overwrites high score when it has been beatten
    for (int i = 0; i < scores.length; i++) {
      if (score > scores[i]) {
        scoreLocation = i;
        scores[i] = score;
        break;
      }
    }
    //println(score);
  }

  void update() {

    // Updates buttons
    menuButton.update();
    enterButton.update();

    for (NameInput intials : intialsButtons) {
      intials.update();
    }

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


    for (int i = 0; i < 10; i++) {
      fill(0);
      textAlign(CENTER, CENTER);
      textSize(24);
      text(users[i], 250, 100 + 75*(i+1));

      text(scores[i], width - 250, 100 + 75*(i+1));
    }


    // Draws buttons
    menuButton.draw();

    // Allows user to input a high score if they have one
    if (scoreLocation != -1) {
      enterButton.draw();
      for (NameInput intials : intialsButtons) {
        intials.draw();
      }
    }
  }

  // Switches screen based on button input
  void buttonPressed() {
    if (menuButton.mouseHasBeenPressed() == true) {
      title = new Title();
    }

    // Adds user and score to list
    if (enterButton.mouseHasBeenPressed() == true) {
      user = intialsButtons[0].text + intialsButtons[1].text + intialsButtons[2].text;
      users[scoreLocation] = user;
      saveStrings("Users.txt", users);
      saveStrings("Scores.txt", str(scores));
    }
  }
}
