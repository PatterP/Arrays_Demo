// Title screen
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

    background = (loadImage("Background.png"));
  }

  void update() {

    playButton.update();
    learnButton.update();
    scoresButton.update();
    exitButton.update();

    buttonPressed();
  }

  void draw() {

    image(background, 0, 0);

    // Displays game name
    textAlign(CENTER, CENTER);
    textSize(80);
    fill(0);
    text("Boxes[]", width/2 - 25, 300);

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
    }
    if (scoresButton.mouseHasBeenPressed() == true) {
      highScores = new HighScores();
    }
    if (learnButton.mouseHasBeenPressed() == true) {
      learn = new Learn();
    }
    if (exitButton.mouseHasBeenPressed() == true)
      exit();
  }
}
