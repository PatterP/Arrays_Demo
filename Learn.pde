class Learn {

  //PImage titleCard;

  // Next button which loads the dialogue and minigame
  Button nextButton;

  // Lines of text used to print on the typewriter
  String line1;
  String line2;
  String line3;

  // Counts which phase of dialogue the program is on
  int dialogueCounter;

  Learn() {

    // Sets location and contents of buttons
    nextButton = new Button(width - 325, height - height/9, "Next");

    //titleCard = (loadImage("TitleCard.png"));

    dialogueCounter = 0;

    background = (loadImage("Background.png"));
  }

  void update() {

    nextButton.update();

    buttonPressed();
  }

  void draw() {

    image(background, 0, 0);

    // Box that contains dialogue
    fill(255);
    stroke(0);
    strokeWeight(8);
    rect(0, height - height/4, width, height/4);

    //image(titleCard, 0, 0);

    // Displays game name
    //textAlign(BASELINE, BASELINE);
    //textSize(60);

    // Draws buttons
    nextButton.draw();

    // Updates dialogue
    textSize(24);
    textAlign(LEFT, CENTER);
    if (dialogueCounter == 0) {
      line1 = "Arrays are a variable type in computer programming languages belonging to the collections data type. However, unlike other primitive variables in computer programming languages like";
      line2 = "integers and Strings, arrays can store more than one value and that value can be of any type that it is defined as. An example would be an array of integers that stores 10 elements";
      line3 = "with those elements being the numbers 1 through 10.";
    }
    if (dialogueCounter == 1) {
      line1 = "In the previously mentioned example, element 1 would store the integer 1, element 2 would store the integer 2, and so on. Something to note however is that when it comes to arrays,";
      line2 = "computers start counting at 0. So if one wants to access the first element of the array, it would be stored at location 0, not 1. When it comes to creating and instantiating arrays";
      line3 = "there are two main ways of doing it.";
    }
    if (dialogueCounter == 2) {
      line1 = "The first is to instantiate the array and its size as well as define each element individually like so:";
      line2 = "\"int[] exampleArray = new int[3];\"";
      line3 = "\"exampleArray[0] = 1;\", \"exampleArray[1] = 2;\", \"exampleArray[2] = 3;\"";
    }
    if (dialogueCounter == 3) {
      line1 = "The second way is to instantiate the array and define its elements in a single line:";
      line2 = "\"int[] exampleArray = {1, 2, 3}\"";
      line3 = "Elements in arrays can be overwritten by new values, but an array's size or number of elements cannot be changed. Any attempts to go outside that range will cause an error.";
    }
    if (dialogueCounter == 4) {
      line1 = "A good comparison to arrays are storage boxes. Like arrays, storage boxes are used to store specific things. They also can only hold a certain amount of items";
      line2 = "and any attempts to add more will not work. In our specific example, we'll use storage boxes to help store furnature in place of arrays. ";
      line3 = "Consider playing around with the concept in the following example and try to fill the boxes up as efficiently as possible.";
    }
    // Prints dialogue
    dynamicText1(line1, 0, 10, height - height/4 + 20, 5);
    if (done1 == true)
      dynamicText2(line2, 0, 10, height - height/4 + 50, 10);
    if (done2 == true)
      dynamicText3(line3, 0, 10, height - height/4 + 80, 15);
  }

  // Switches screen and text based on button input
  void buttonPressed() {
    if (nextButton.mouseHasBeenPressed() == true) {
      clearDynamicText();
      dialogueCounter++;
      if (dialogueCounter > 4)
        minigame = new MiniGame();
    }
  }
}
